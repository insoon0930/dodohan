import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/model/identity.dart';
import 'package:stamp_now/core/services/auth_service.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/enums.dart';
import '../../../data/info_data.dart';
import '../../../data/model/user.dart';
import '../../../data/provider/storage_service.dart';
import '../../../data/service/identity_service/service.dart';
import '../../../widgets/dialogs/error_dialog.dart';
import '../../splash/splash_controller.dart';

class RegisterController extends GetxController {
  final StorageService storageService = Get.find();
  final IdentityService identityService = IdentityService();
  final Rxn<bool> isMan = Rxn<bool>();
  final Rxn<XFile> profileImage = Rxn<XFile>();
  final Rxn<XFile> studentIdImage = Rxn<XFile>();
  final Rx<String> univ = '선택'.obs;
  final Rx<bool> termsAgree = false.obs;

  final RxString uploadStatus = '이미지 업로드중 (0/2)'.obs;

  bool get ready => termsAgree.value && univ.value != '선택' && isMan.value != null && profileImage.value != null && studentIdImage.value != null;
  User get user => AuthService.to.user.value;
  int get selectedUnivIndex => InfoData.univ.indexOf(univ.value);

  @override
  void onInit() {
    if (user.id == '') {
      Get.put(SplashController());
    }
    super.onInit();
  }

  @override
  void onReady() {
    if(user.idStatus == IdStatus.rejected) {
      Get.dialog(const ErrorDialog(
          text: '심사 반려\n\n학생증 혹은 프로필 이미지를 확인해주세요. (본인 사진이 안나온 학생증, 마스크, 모자, 옆모습, 어두운, 많이 가려진, 여러명의 얼굴이 나온, ai 프로필 등...)'));
    }
    super.onReady();
  }

  Future<void> register() async {
    Get.dialog(_processWidget(), barrierDismissible: false);
    //이미지 두개 저장 //이미지 서비스 하나 두고 진행 ㅇㅇ.?
    String profileUrl = await storageService.uploadFile(
        file: profileImage.value!,
        bucket: StorageBucket.profile,
        userId: user.id);
    uploadStatus.value = '이미지 업로드중(1/2)';
    String studentIdUrl = await storageService.uploadFile(
        file: studentIdImage.value!,
        bucket: StorageBucket.studentId,
        userId: user.id);
    uploadStatus.value = '잠시만 기다려주세요';

    //들고온 이미지로 다큐먼트 생성
    await identityService.create(Identity(
        user: user.id,
        profileImage: profileUrl,
        studentIdImage: studentIdUrl,
        isMan: isMan.value!, univ: univ.value));

    //유저 모델 상태 업데이트
    user.idStatus = IdStatus.waiting;

    // 페이지 라우팅 //본인 인증이 진행중입니다(24시간 이내 처리)
    Get.back();
    Get.toNamed(Routes.waiting);
  }

  Widget _processWidget() => Center(child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            DefaultTextStyle(
                style: ThemeFonts.semiBold
                    .getTextStyle(color: ThemeColors.main, size: 18),
                child: Text(uploadStatus.value)),
          ],
        ),
      ));
}
