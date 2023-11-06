import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../../../core/base_controller.dart';
import '../../../core/services/auth_service.dart';
import '../../data/enums.dart';
import '../../data/service/user_service/service.dart';
import '../../widgets/dialogs/error_dialog.dart';
import 'package:http/http.dart' as http;

class StoreService extends BaseController {
  static StoreService get to => Get.find();
  final UserService _userService = UserService();

  AuthService authService = Get.find();
  late StreamSubscription<dynamic> _subscription;
  final RxList<ProductDetails> productDetails = <ProductDetails>[].obs;

  @override
  void onInit() async {
    List<ProductDetails> unsortedProductDetails = await getProductDetails();
    productDetails.value = unsortedProductDetails..sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
    print('productDetails.value: ${productDetails.value}');

    final Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      print('error: $error');
      // handle error here.
    });
    await initInAppPurchase();
    super.onInit();
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }

  //In-App Purchase 구매 확인: 구매가 성공적으로 완료되면, InAppPurchaseConnection 인스턴스를 사용하여 구매 확인을 수행하고, PurchaseDetails 객체를 가져올 수 있습니다.
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) async {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showLoading(); //추가됨
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          Get.dialog(ErrorDialog(text: '구매 실패'.tr));
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          bool isValid = await _verifyPurchase(purchaseDetails);
          if (isValid) {
            final int coin = int.parse(purchaseDetails.productID.split('_')[0]);
            await _userService.increaseCoin(AuthService.to.user.value.id, coin, type: CoinReceiptType.chargeCoin);
            AuthService.to.user.update((user) => user!.coin = user.coin + coin);
            hideLoading();
            Get.snackbar('결제 성공!', '$coin 하트가 지급되었습니다');
          } else {
            hideLoading();
            Get.dialog(ErrorDialog(text: '유효하지 않은 거래 발생'.tr));
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          hideLoading(); //추가(결제 취소시?)
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    });
  }


  //In-App Purchase 초기화
  Future<void> initInAppPurchase() async {
    final bool isAvailable = await InAppPurchase.instance.isAvailable();
    if (!isAvailable) {
      // In-App Purchase 미지원 기기 예외처리
      return;
    }
    await InAppPurchase.instance.restorePurchases();
  }

  //In-App Purchase 상품 조회R
  Future<List<ProductDetails>> getProductDetails() async {
    //코인 1000개 + 550개
    // 총 1550코인이 지급됩니다.
    const Set<String> productIds = <String>{'3_coins', '6_coins', '12_coins', '24_coins'};
    final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(productIds);
    if (response.notFoundIDs.isNotEmpty) {
      // 상품ID를 찾지 못한 예외처리
      return [];
    }
    return response.productDetails;
  }

  //In-App Purchase 구매 요청
  Future<void> buyProduct(ProductDetails product) async {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    await InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    http.Response response;
    const headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if(Platform.isAndroid) {
      var url = Uri.parse('https://googlereceiptverify-m2rvoqphsq-uc.a.run.app');
      Map<String, dynamic> data = {
        'receiptDto': {
          'productId': purchaseDetails.productID,
          'purchaseToken': purchaseDetails.verificationData.serverVerificationData
        },
        'buyerId': AuthService.to.user.value.id
      };
      String encodedData = jsonEncode(data);
      response = await http.post(url, body: encodedData, headers: headers);
    } else {
      var url = Uri.parse('https://applereceiptverify-m2rvoqphsq-uc.a.run.app');
      Map<String, dynamic> data = {
        'receiptDto': {
          'productId': purchaseDetails.productID,
          'receipt': purchaseDetails.verificationData.serverVerificationData,
        },
        'buyerId': AuthService.to.user.value.id,
      };
      String encodedData = jsonEncode(data);
      response = await http.post(url, body: encodedData, headers: headers);
    }
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}

