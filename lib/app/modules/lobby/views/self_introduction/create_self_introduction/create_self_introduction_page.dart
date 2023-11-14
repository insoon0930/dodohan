import 'package:dodohan/app/widgets/card_container.dart';
import 'package:dodohan/app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/image/image_pick_box.dart';
import 'create_self_introduction_controller.dart';

class CreateSelfIntroductionPage extends GetView<CreateSelfIntroductionController> {
  const CreateSelfIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('셀프 소개 작성하기'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //파티 이미지
                    Text('메인 이미지', style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingOnly(bottom: 16),
                    Obx(
                          () => ImagePickBox(
                          file: controller.image.value,
                          addedCallback: (XFile file) => controller.image.value = file,
                          deletedCallback: () => controller.image.value = null,
                          onlySquare: true),
                    ),
                    //제목 textFiled
                    Text('제목', style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingSymmetric(vertical: 16),
                    MyTextField(textController: controller.titleController, width: Get.width, onChanged: (text) => controller.selfIntroduction.update((val) => val!.title = text)),
                    //본문 textFiled
                    Text('본문', style: ThemeFonts.semiBold.getTextStyle(size: 17)).paddingSymmetric(vertical: 16),
                    MyTextField(textController: controller.textController, width: Get.width, minLine: 6, onChanged: (text) => controller.selfIntroduction.update((val) => val!.text = text)),
                    _radioButtons(),
                    Text('* 내 프로필은 우선 비공개되며, 내가 수락하는 신청자에게만 내 프로필이 공개됩니다', style: ThemeFonts.medium.getTextStyle())
                        .paddingSymmetric(vertical: 16),
                  ],
                ),
              ),
            ),
            Obx(
              () => ElevatedButton(
                  style: BtStyle.onOff(controller.readyToGoPreview),
                  onPressed: () => Get.toNamed(Routes.previewSelfIntroduction),
                  child: Text('등록하기 (미리보기)',
                      style: ThemeFonts.medium
                          .getTextStyle(color: Colors.white))),
            )
          ],
        ).paddingAll(16),
      ),
    );
  }

  Widget _radioButtons() => Obx(
        () => Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              title: Text('신청자 캠퍼스 상관 없음', style: ThemeFonts.medium.getTextStyle()),
              leading: Radio<bool>(
                value: false,
                groupValue: controller.selfIntroduction.value.sameUnivOnly,
                onChanged: (bool? value) => controller.selfIntroduction.update((item) => item!.sameUnivOnly = value!),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              dense: true,
              title: Text('나와 같은 캠퍼스만 신청 받기', style: ThemeFonts.medium.getTextStyle()),
              leading: Radio<bool>(
                value: true,
                groupValue: controller.selfIntroduction.value.sameUnivOnly,
                onChanged: (bool? value) => controller.selfIntroduction.update((item) => item!.sameUnivOnly = value!),
              ),
            ),
          ],
        ),
      );
}
