import 'package:dodohan/app/widgets/card_container.dart';
import 'package:dodohan/app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/dialogs/action_dialog.dart';
import '../../../../../widgets/dividers/my_divider_2.dart';
import '../../../../../widgets/image/image_pick_box.dart';
import '../../../../../widgets/image/image_view_box.dart';
import 'self_introduction_item_controller.dart';

class SelfIntroductionItemPage extends GetView<SelfIntroductionItemController> {
  const SelfIntroductionItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('셀프 소개'),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageViewBox(url: controller.selfIntroduction.value.image, width: Get.width, height: Get.width),
                    Text('${controller.selfIntroduction.value.meInfo?.univ ?? '학교명(오류)'}${controller.selfIntroduction.value.sameUnivOnly ? ' (동일 캠퍼스만 신청 가능)' : ''}',
                        style: ThemeFonts.regular.getTextStyle(size: 15, color: ThemeColors.mainLight))
                        .paddingOnly(top: 16),
                    Text(controller.selfIntroduction.value.text, style: ThemeFonts.semiBold.getTextStyle(size: 20)).paddingOnly(top: 8, bottom: 16),
                    const MyDivider2(),
                    Text(controller.selfIntroduction.value.text, style: ThemeFonts.medium.getTextStyle(size: 15)).paddingSymmetric(vertical: 16),
                  ],
                ),
              ),
            ),
            const MyDivider2().paddingOnly(bottom: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: BtStyle.standard(color: ThemeColors.main),
                      onPressed: () => Get.dialog(ActionDialog(
                          title: '신청하기',
                          text: '내 프로필을 보내며\n상대방이 유료로 수락 할 경우\n상대방 프로필이 공개됩니다',
                          confirmCallback: () {},
                          buttonText: '무료 신청')),
                      child: const Text('무료 신청')),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                      style: BtStyle.standard(color: ThemeColors.orangeLight),
                      onPressed: () => Get.dialog(ActionDialog(
                          title: '신청하기',
                          text: '내 프로필을 보내며\n상대방이 무료로 수락 할 경우\n상대방 프로필이 공개됩니다',
                          confirmCallback: () {},
                          buttonText: '유료 신청')),
                      child: const Text('유료 신청')),
                ),
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
