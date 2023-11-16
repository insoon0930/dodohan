import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/base_controller.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../data/enums.dart';
import '../../../../../data/model/self_introduction.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/provider/storage_service.dart';
import '../../../../../data/service/self_introduction_service/service.dart';
import '../../../../../data/service/user_service/service.dart';
import '../../../../../widgets/dialogs/action_dialog.dart';

class CreateSelfIntroductionController extends BaseController {
  final SelfIntroductionService _selfIntroductionService = SelfIntroductionService();
  final StorageService storageService = Get.find();
  final UserService _userService = UserService();
  User get user => AuthService.to.user.value;

  final Rxn<XFile> image = Rxn<XFile>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final Rx<SelfIntroduction> selfIntroduction = SelfIntroduction().obs;

  bool get readyToGoPreview => image.value != null && selfIntroduction.value.title != '' && selfIntroduction.value.text != '';

  @override
  Future<void> onInit() async {
    selfIntroduction.update((val) {
      val!.meInfo = Get.arguments['meInfo'];
      val.phoneNum = user.phoneNum;
      val.profileImage = user.profileImage;
    });
    super.onInit();
  }

  Future<void> createSelfIntroduction() async {
    Get.back();
    final int costCoin = user.isMan! ? 2 : 1;
    if (user.coin < costCoin) {
      Get.dialog(ActionDialog(title: '하트 부족', text: '스토어로 이동하기', confirmCallback: () {
        Get.back();
        Get.toNamed(Routes.store);
      }));
      return;
    }
    showLoading();
    String mainImage = await storageService.uploadFile(file: image.value!, bucket: StorageBucket.selfIntroduction, userId: user.id);
    selfIntroduction.value.image = mainImage;
    selfIntroduction.value.region = regionFilter[user.region]!;
    await _selfIntroductionService.create(selfIntroduction.value);
    //코인 차감
    await _userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.createSelfIntro);
    AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);
    hideLoading();
    Get.offNamedUntil(Routes.lobby, (route) => false, arguments: 2);
  }
}

