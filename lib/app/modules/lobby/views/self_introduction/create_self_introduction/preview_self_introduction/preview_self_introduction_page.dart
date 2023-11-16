import 'dart:io';

import 'package:dodohan/app/widgets/image/image_view_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../core/services/auth_service.dart';
import '../../../../../../../core/theme/buttons.dart';
import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../../widgets/dialogs/action_dialog.dart';
import '../../../../../../widgets/dividers/my_divider_2.dart';
import '../create_self_introduction_controller.dart';

class PreviewSelfIntroductionPage extends GetView<CreateSelfIntroductionController> {
  const PreviewSelfIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('셀프 소개 미리보기'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(File(controller.image.value!.path),
                          width: Get.width, height: Get.width, fit: BoxFit.cover)),
                  Text('${controller.selfIntroduction.value.meInfo?.univ ?? '학교명(오류)'}${controller.selfIntroduction.value.sameUnivOnly ? ' (동일 캠퍼스만 신청 가능)' : ''}',
                          style: ThemeFonts.regular.getTextStyle(size: 15, color: ThemeColors.mainLight))
                      .paddingOnly(top: 16),
                  Text(controller.titleController.text, style: ThemeFonts.semiBold.getTextStyle(size: 20)).paddingOnly(top: 8, bottom: 16),
                  const MyDivider2(),
                  Text(controller.textController.text, style: ThemeFonts.medium.getTextStyle(size: 15)).paddingSymmetric(vertical: 16),
                ],
              ),
            ),
          ),
          const MyDivider2().paddingOnly(bottom: 8),
          ElevatedButton(
              style: BtStyle.standard(color: ThemeColors.main),
              onPressed: () => Get.dialog(ActionDialog(
                  title: '셀프 소개 등록하기',
                  text: '하트 ${AuthService.to.user.value.isMan! ? 2 : 1}개가 소모됩니다',
                  confirmCallback: () => controller.createSelfIntroduction(),
                  buttonText: '등록하기')),
              child: const Text('등록하기'))
        ],
      ).paddingAll(16),
    );
  }
}
