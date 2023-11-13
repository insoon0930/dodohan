import 'package:dodohan/app/widgets/card_container.dart';
import 'package:dodohan/app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/image/image_pick_box.dart';
import 'create_self_introduction_controller.dart';

class CreateSelfIntroductionPage extends GetView<CreateSelfIntroductionPageController> {
  const CreateSelfIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('셀프 소개 작성하기'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //파티 이미지
            Text('메인 이미지'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingOnly(bottom: 16),
            Obx(
              () => ImagePickBox(
                  file: controller.image.value,
                  addedCallback: (XFile file) => controller.image.value = file,
                  deletedCallback: () => controller.image.value = null),
            ),
            //제목 textFiled
            Text('제목'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingSymmetric(vertical: 16),
            MyTextField(textController: TextEditingController(), width: Get.width),
            //본문 textFiled
            Text('본문'.tr, style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingSymmetric(vertical: 16),
            MyTextField(textController: TextEditingController(), width: Get.width, minLine: 7),
            // 같은 학교만 받기 on/off radioBox
            Obx(
              () => Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    title: Text('신청자 학교 상관 없음', style: ThemeFonts.medium.getTextStyle()),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: controller.selfIntroduction.value.sameUnivOnly,
                      onChanged: (bool? value) => controller.selfIntroduction.update((item) => item!.sameUnivOnly = value!),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    title: Text('나와 같은 학교만 받기', style: ThemeFonts.medium.getTextStyle()),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: controller.selfIntroduction.value.sameUnivOnly,
                      onChanged: (bool? value) => controller.selfIntroduction.update((item) => item!.sameUnivOnly = value!),
                    ),
                  ),
                ],
              ),
            ),
            // 내 프로필은 비공개로 올라가게 됩니다. 적어두자 걍 ㅇㅇ 스피랑 똑같이 ㄱㄱ
            Text('* 내 프로필은 우선 비공개되며, 내가 수락하는 신청자에게만 내 프로필이 공개됩니다'.tr, style: ThemeFonts.medium.getTextStyle())
                .paddingSymmetric(vertical: 16),
            //미리보기(다음버튼) - 여기서 코인 ㄴㄴ 다음페이지에서 과금ㄱ
            ElevatedButton(
                style: BtStyle.standard(color: ThemeColors.main),
                onPressed: () {},
                child: const Text('등록하기 (미리보기)'))
          ],
        ).paddingAll(16),
      ),
    );
  }
}
