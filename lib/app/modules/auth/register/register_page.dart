import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/core/theme/buttons.dart';
import 'package:stamp_now/core/theme/fonts.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/paddings.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/info_data.dart';
import '../../../widgets/image/image_pick_box.dart';
import '../../../widgets/single_selector.dart';
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
              const SizedBox(height: 16.0),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('정보를 입력해주세요', style: ThemeFonts.bold.getTextStyle(size: 24))),
              Text('학교'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingOnly(top: 32, bottom: 16),
              Obx(() => _univ(context)),
              Text('성별'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingOnly(top: 32, bottom: 16),
              Obx(() => _genderCheck()),
              _imageRow(),
              const SizedBox(height: 16),
              _termsAgree().paddingOnly(bottom: 8),
              Obx(
                () => ElevatedButton(
                  style: BtStyle.onOff(controller.ready),
                  onPressed: controller.ready ? () => controller.register() : null,
                  child: Center(
                    child: Text('완료',
                        style:
                        ThemeFonts.medium.getTextStyle(color: Colors.white)),
                  ),
                )
              ),
              const SizedBox(height: 16),
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
                  : ThemeColors.cream),
          child: Center(
            child: Text('남'.tr,
                    style: ThemeFonts.regular
                        .getTextStyle(size: 17, color: controller.isMan.value == true
                        ? const Color(0xff4b8dff)
                        : ThemeColors.grayDark)),
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
                  : ThemeColors.cream),
          child: Center(
            child: Text('여'.tr,
                    style: ThemeFonts.regular
                        .getTextStyle(size: 17, color: controller.isMan.value == false
                        ? const Color(0xffff6565)
                        : ThemeColors.grayDark)),
              ),
        ),
      ),
    ],
  );

  Widget _univ(BuildContext context) => CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: () => showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 180,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: CupertinoPicker(
          magnification: 1.22,
          squeeze: 1.2,
          useMagnifier: true,
          itemExtent: 32.0,
          scrollController: FixedExtentScrollController(initialItem: controller.selectedUnivIndex),
          onSelectedItemChanged: (int selectedItem) => controller.univ.value = InfoData.univ[selectedItem],
          children: List<Widget>.generate(
              InfoData.univ.length,
                  (int index) =>
                  Center(child: Text(InfoData.univ[index]))),
        ),
      ),
    ),
    // This displays the selected fruit name.
    child: Container(
      width: 150,
      height: 41,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: controller.univ.value != '선택'
                  ? ThemeColors.main
                  : ThemeColors.grayLightest,
              width: 1),
          color: controller.univ.value != '선택'
              ? ThemeColors.mainLightest
              : ThemeColors.cream),
      child: Center(
        child: Text(
          controller.univ.value??'선택',
          style: ThemeFonts.regular.getTextStyle(size: 17, color: controller.univ.value != '선택'
              ? ThemeColors.main
              : ThemeColors.grayDark),
        ),
      ),
    ),
  );

  Widget _imageRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('프로필'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingOnly(top: 32, bottom: 16),
          Obx(
                () => ImagePickBox(
                file: controller.profileImage.value,
                addedCallback: (XFile file) => controller.profileImage.value = file,
                deletedCallback: () => controller.profileImage.value = null),
          ),
          const SizedBox(height: 8),
          Text('* 매칭된 상대에게만 공개됩니다\n  (본인 확인 가능한 정면 사진 필수)'.tr,
              style: ThemeFonts.medium.getTextStyle(size: 12, color: ThemeColors.grayDark)),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('학생증'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingOnly(top: 32, bottom: 16),
          Obx(
                () => ImagePickBox(file: controller.studentIdImage.value,
                addedCallback: (XFile file) => controller.studentIdImage.value = file,
                deletedCallback: () => controller.studentIdImage.value = null),
          ),
          const SizedBox(height: 8),
          Text('* 학교와 사진이 보여야 합니다\n '.tr,
              style: ThemeFonts.medium.getTextStyle(size: 12, color: ThemeColors.grayDark)),
        ],
      ),
    ],
  );

  Widget _termsAgree() => Row(
        children: [
          Obx(
            () => SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                  value: controller.termsAgree.value,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      // Making around shape
                      borderRadius: BorderRadius.circular(3)),
                  onChanged: (value) => controller.termsAgree.value = value!),
            ),
          ).paddingOnly(right: 8),
          GestureDetector(
              onTap: () => Get.toNamed(Routes.termsOfUse),
              child: Text('이용 약관',
                  style: ThemeFonts.medium.getTextStyle(size: 13))),
          Text(
            " 및 ",
            style: ThemeFonts.medium.getTextStyle(size: 13, color: Colors.black54),
          ),
          GestureDetector(
              onTap: () => Get.toNamed(Routes.privacy),
              child: Text('개인정보 처리방침',
                  style: ThemeFonts.medium.getTextStyle(size: 13))),
          Text(
            " 동의",
            style: ThemeFonts.medium.getTextStyle(size: 13, color: Colors.black54),
          ),
        ],
      );
}
