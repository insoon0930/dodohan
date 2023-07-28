import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/core/theme/buttons.dart';
import 'package:stamp_now/core/theme/fonts.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/paddings.dart';
import '../../../widgets/image/image_pick_box.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 74.0),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('정보를 입력해주세요', style: ThemeFonts.bold.getTextStyle(size: 24))),
              const SizedBox(height: 32.0),
              Text('성별'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)),
              const SizedBox(height: 16.0),
              Obx(() => _genderCheck()),
              //'성별', '학생증 사진', '프로필 사진'
              const SizedBox(height: 32.0),
              Text('프로필 이미지'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)),
              const SizedBox(height: 16),
              Obx(
                () => ImagePickBox(
                    file: controller.profileImage.value,
                    addedCallback: (XFile file) => controller.profileImage.value = file,
                    deletedCallback: () => controller.profileImage.value = null),
              ),
              const SizedBox(height: 8),
              Text('* 매칭된 상대에게만 공개됩니다\n  (본인 확인 가능한 사진 필수)'.tr,
                  style: ThemeFonts.medium.getTextStyle(size: 12, color: ThemeColors.grayDark)),
              const SizedBox(height: 32),
              Text('학생증'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)),
              const SizedBox(height: 16),
              Obx(
                () => ImagePickBox(file: controller.studentIdImage.value,
                    addedCallback: (XFile file) => controller.studentIdImage.value = file,
                    deletedCallback: () => controller.studentIdImage.value = null),
              ),
              const SizedBox(height: 8),
              Text('* 본인 확인이 불가한 경우 반려 될 수 있습니다'.tr,
                  style: ThemeFonts.medium.getTextStyle(size: 12, color: ThemeColors.grayDark)),
              const SizedBox(height: 32),
              Obx(
                () => ElevatedButton(
                  style: BtStyle.onOff(controller.ready),
                  onPressed: controller.ready ? () => controller.register() : null,
                  child: Center(
                    child: Text('완료',
                        style:
                        ThemeFonts.medium.getTextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
        ),
      ),
    );
  }

  Widget _genderCheck() => Row(
    children: [
      GestureDetector(
        onTap: () => controller.isMan.value = true,
        child: Container(
          width: 71,
          height: 71,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: controller.isMan.value == true
                      ? const Color(0xff4b8dff)
                      : ThemeColors.grayLightest,
                  width: 1),
              color: controller.isMan.value == true
                  ? const Color(0xffdbe9ff)
                  : const Color(0xfff7f7f7)),
          child: Center(
            child: Text('남'.tr,
                    style: ThemeFonts.semiBold
                        .getTextStyle(size: 17, color: controller.isMan.value == true
                        ? const Color(0xff4b8dff)
                        : const Color(0xff979797))),
              ),
        ),
      ),
      const SizedBox(width: 12),
      GestureDetector(
        onTap: () => controller.isMan.value = false,
        child: Container(
          width: 71,
          height: 71,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: controller.isMan.value == false
                      ? const Color(0xffff6565)
                      : ThemeColors.grayLightest,
                  width: 1),
              color: controller.isMan.value == false
                  ? const Color(0xffffe0e0)
                  : const Color(0xfff7f7f7)),
          child: Center(
            child: Text('여'.tr,
                    style: ThemeFonts.semiBold
                        .getTextStyle(size: 17, color: controller.isMan.value == false
                        ? const Color(0xffff6565)
                        : const Color(0xff979797))),
              ),
        ),
      ),
    ],
  );
}
