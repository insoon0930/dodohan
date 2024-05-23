import 'dart:developer';

import 'package:dodohan/app/data/model/coin_receipt.dart';
import 'package:dodohan/app/data/model/receipt.dart';
import 'package:dodohan/app/data/service/coin_receipt_service/service.dart';
import 'package:dodohan/app/data/service/receipt_service/service.dart';
import 'package:get/get.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/dummy.dart';
import '../../../data/model/identity.dart';
import '../../../data/model/me_info.dart';
import '../../../data/model/user.dart';
import '../../../data/model/you_info.dart';
import '../../../data/service/application_service/service.dart';
import '../../../data/service/identity_service/service.dart';
import '../../../data/service/user_service/service.dart';
import '../../../data/service/you_info_service/service.dart';

class TestController extends GetxController {
  final IdentityService identityService = IdentityService();
  final UserService userService = UserService();
  final ApplicationService applicationService = ApplicationService();
  final YouInfoService youInfoService = YouInfoService();
  final ReceiptService receiptService = ReceiptService();
  final CoinReceiptService coinReceiptService = CoinReceiptService();

  final RxList<Identity> waitingIds = <Identity>[].obs;
  User get user => AuthService.to.user.value;


  @override
  Future<void> onInit() async {
    if(!AuthService.to.isAdmin) {
      Get.offAllNamed(Routes.loginBy);
      return;
    }
    super.onInit();
  }

  Future<void> createManApplicationDummy() async {
    MeInfo meInfo = Dummy.manMeInfo;
    YouInfo youInfo = Dummy.manYouInfo;
    await applicationService.create(meInfo, youInfo);
    Get.snackbar('남자 신청', '추가 완료');
  }

  Future<void> createWomanApplicationDummy() async {
    MeInfo meInfo = Dummy.womanMeInfo;
    YouInfo youInfo = Dummy.womanYouInfo;
    await applicationService.create(meInfo, youInfo);
    Get.snackbar('남자 신청', '추가 완료');
  }

  Future<void> updateYouInfoBodyShapeType() async {
    await youInfoService.updateBodyShapeType();
    Get.snackbar('필드 업데이트', '완료');
  }

  Future<void> updateApplicationBodyShapeType() async {
    await applicationService.updateBodyShapeType();
    Get.snackbar('필드 업데이트', '완료');
  }

  Future<void> updateDefaultCoin() async {
    await userService.updateDefaultCoin();
    Get.snackbar('필드 업데이트', '완료');
  }

  Future<void> receiptTest() async {
    log('receiptTest started');
    final receipts = await receiptService.findAll();
    log('receipts length: ${receipts.length}');
    Map<String, List<Receipt>> tokenGroups = {};

    for (var receipt in receipts) {
      String token = receipt.purchaseToken!;
      if (tokenGroups[token] == null) {
        tokenGroups[token] = [];
      }
      tokenGroups[token]!.add(receipt);
    }

    // // 중복된 토큰만 필터링
    // var duplicates = tokenGroups.keys
    //     .where((entry) => entry.value.length > 1)
    //     .expand((entry) => entry.value)
    //     .toList();

    List<String> duplicates = [];
    tokenGroups.forEach((token, receipts) {
      if (receipts.length > 1) { // 해당 토큰을 가진 영수증이 2개 이상인 경우
        duplicates.add(token); // 중복된 토큰을 리스트에 추가합니다.
      }
    });

    log('duplicates: $duplicates');
    log('duplicates: ${duplicates.length}');

    // QuerySnapshot querySnapshot = await _firestore.collection('receipts').get();
    // Map<String, List<DocumentSnapshot>> tokenGroups = {};
    //
    // for (var doc in querySnapshot.docs) {
    //   String token = doc['purchaseToken'] as String;
    //   if (tokenGroups[token] == null) {
    //     tokenGroups[token] = [];
    //   }
    //   tokenGroups[token]!.add(doc);
    // }
    //
    // // Filter out tokens that appear more than once
    // var duplicates = tokenGroups.entries.where((entry) => entry.value.length > 1).expand((entry) => entry.value).toList();
    // setState(() {
    //   duplicateReceipts = duplicates;
    //   isLoading = false;
    // });
    // // await userService.updateDefaultCoin();
    // Get.snackbar('필드 업데이트', '완료');
  }

  Future<void> dailyRewardErrorCheck() async {
    log('dailyRewardErrorCheck started');
    List<String> usersWithDuplicates = [];

    List<CoinReceipt> coinReceipts = await coinReceiptService.findAllDailyRewards();
    log('coinReceipts.lenght: ${coinReceipts.length}');

    Map<String, Map<String, int>> userDateRewards = {}; // 유저별 날짜별 보상 횟수 집계

    for (var receipt in coinReceipts) {
      String userId = receipt.user;
      DateTime date = receipt.createdAt!; // createdAt은 DateTime 타입으로 가정
      String dateKey = '${date.year}-${date.month}-${date.day}';

      if (!userDateRewards.containsKey(userId)) {
        userDateRewards[userId] = {};
      }
      if (!userDateRewards[userId]!.containsKey(dateKey)) {
        userDateRewards[userId]![dateKey] = 0;
      }
      userDateRewards[userId]![dateKey] = userDateRewards[userId]![dateKey]! + 1;
    }

    // 중복 보상이 있는 유저 찾기
    userDateRewards.forEach((userId, dates) {
      dates.forEach((date, count) {
        if (count > 5) {
          usersWithDuplicates.add('$userId on $date by $count');
        }
      });
    });
    log('usersWithDuplicates: $usersWithDuplicates');
    Get.snackbar('필드 업데이트', '완료');
  }
}
