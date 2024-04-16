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
  // final ReceiptService youInfoService = YouInfoService();

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
    //todo 리스트업:
    // await re
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
    // await userService.updateDefaultCoin();
    Get.snackbar('필드 업데이트', '완료');
  }
}
