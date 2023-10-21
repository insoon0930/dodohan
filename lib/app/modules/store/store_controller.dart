import 'dart:async';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../../../core/base_controller.dart';
import '../../../core/services/auth_service.dart';
import '../../widgets/dialogs/error_dialog.dart';

class StoreService extends BaseController {
  static StoreService get to => Get.find();

  AuthService authService = Get.find();
  late StreamSubscription<dynamic> _subscription;
  final RxList<ProductDetails> productDetails = <ProductDetails>[].obs;

  @override
  void onInit() async {
    List<ProductDetails> unsortedProductDetails = await getProductDetails();
    productDetails.value = unsortedProductDetails..sort((a, b) => a.rawPrice.compareTo(b.rawPrice));

    final Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
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
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showLoading(); //추가됨
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          Get.dialog(ErrorDialog(text: '구매 실패'.tr));
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          bool isValid = await _verifyPurchase(purchaseDetails);
          if (isValid) {
            authService.user.update((user) =>
            user!.coin = user.coin + int.parse(purchaseDetails.productID.split('_')[0]));
          } else {
            Get.dialog(ErrorDialog(text: '유효하지 않은 거래 발생'.tr));
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          hideLoading(); //추가됨
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }


  //In-App Purchase 초기화
  Future<void> initInAppPurchase() async {
    final bool isAvailable = await InAppPurchase.instance.isAvailable();
    print('initInAppPurchase: $isAvailable');
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
    final Set<String> productIds = {'3_coins', '6_coins', '12_coins', '24_coins'};
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
    // FAResponse response;
    // if(Platform.isAndroid) {
    //   response = await apiService.postJson(
    //       'in-app-purchase/google', {
    //     'productId': purchaseDetails.productID,
    //     'purchaseToken': purchaseDetails.verificationData.serverVerificationData
    //   });
    // } else {
    //   response = await apiService.postJson('in-app-purchase/apple', {
    //     'productId': purchaseDetails.productID,
    //     'receipt': purchaseDetails.verificationData.serverVerificationData,
    //     // 'purchaseToken': purchaseDetails.verificationData.serverVerificationData
    //   });
    // }
    // if (response.success) {
    //   return true;
    // } else {
    //   return false;
    // }
    return true;
  }

}

