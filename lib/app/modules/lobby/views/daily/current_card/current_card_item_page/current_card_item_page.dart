import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/image/image_view_box.dart';
import '../../../../../../../core/theme/buttons.dart';
import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../../core/utils/utility.dart';
import '../../../../../../data/enums.dart';
import '../../../../../../widgets/appbars/default_appbar.dart';
import 'current_card_item_controller.dart';

class CurrentCardItemPage extends GetView<CurrentCardItemController> {
  const CurrentCardItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('오늘의 카드'),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageViewBox(url: controller.dailyCard.value.youProfileImage, isBlurred: true, blurValue: 24, width: Get.width - 32, height: Get.width - 32),
              //거절함
              if (controller.meStatus == CardStatus.rejected1st || controller.meStatus == CardStatus.rejected2nd)
                _disabledBt('거절한 카드입니다')
              //1차 선택
              else if (controller.meStatus == CardStatus.checked || controller.meStatus == CardStatus.unChecked)
                _firstChoice()
              //2차 선택
              else if (controller.meStatus == CardStatus.confirmed1st && controller.youMadeAFirstChoice)
                _secondChoice()
              //거절됨
              else if (controller.meStatus == CardStatus.rejected1st || controller.meStatus == CardStatus.rejected2nd)
                _disabledBt('매칭 실패')
              //매칭 성공
              else if (controller.meStatus == CardStatus.rejected1st || controller.meStatus == CardStatus.rejected2nd)
                GestureDetector(onTap: () => controller.copyPhoneNum(Utility.formatPhoneNum(controller.dailyCard.value.youPhoneNum)),
                  child: Text(Utility.formatPhoneNum(controller.dailyCard.value.youPhoneNum), style: ThemeFonts.semiBold.getTextStyle(size: 25, color: ThemeColors.main, decoration: TextDecoration.underline)).paddingOnly(top: 16)),
              if (controller.dailyCard.value.meStatus != CardStatus.checked)
                const SizedBox(height: 16),
              _infoForm('학교', controller.youInfo.univ!),
              const Divider(),
              _infoForm('키', '${controller.youInfo.height}cm'),
              const Divider(),
              _infoForm('나이', '${controller.youInfo.age}살'),
              const Divider(),
              _infoForm('체형', controller.youInfo.bodyShape!),
              const Divider(),
              _infoForm('흡연', controller.youInfo.isSmoker!?'흡연':'비흡연'),
              const Divider(),
              _infoForm('MBTI', ''),
              const Divider(),
              _infoForm('소개', ''),
              const Divider(),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }

  Widget _infoForm(String category, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: Get.width * 0.25,
          height: 35,
          alignment: Alignment.centerLeft,
          child: Text(category, style: ThemeFonts.medium.getTextStyle(color: Colors.black45)).paddingOnly(left: 8),
        ),
        Container(
          width: Get.width * 0.65,
          height: 35,
          alignment: Alignment.centerLeft,
          child: Text(value, style: ThemeFonts.medium.getTextStyle()).paddingOnly(left: 8),
        ),
      ],
    );
  }

  Widget _firstChoice() => Row(
    children: [
      Flexible(
        child: ElevatedButton(
          style: BtStyle.standard(color: ThemeColors.main),
          onPressed: () => Get.dialog(ActionDialog(
                  title: '1차 수락',
                  text: '하트 1개가 소모됩니다',
                  confirmCallback: () => controller.firstConfirm(),
                  buttonText: '수락하기')),
              child: const Text('수락'),
        ),
      ),
      const SizedBox(width: 16),
      Flexible(
        child: ElevatedButton(
          style: BtStyle.standard(color: ThemeColors.mainLight),
          onPressed: () => Get.dialog(ActionDialog(
              title: '거절',
              text: '하트 1개를 지급받습니다',
              confirmCallback: () => controller.firstReject(),
              buttonText: '거절하기')),
          child: const Text('거절'),
        ),
      ),
    ],
  ).paddingSymmetric(vertical: 16);

  Widget _secondChoice() => Row(
    children: [
      Flexible(
        child: ElevatedButton(
          style: BtStyle.standard(color: ThemeColors.main),
          onPressed: () => Get.dialog(ActionDialog(
              title: '최종 수락',
              text: '하트 5개가 소모됩니다',
              confirmCallback: () => controller.secondConfirm(),
              buttonText: '수락하기')),
          child: const Text('수락'),
        ),
      ),
      const SizedBox(width: 16),
      Flexible(
        child: ElevatedButton(
          style: BtStyle.standard(color: ThemeColors.mainLight),
          onPressed: () => Get.dialog(ActionDialog(
              title: '거절',
              text: '하트 1개를 지급받습니다',
              confirmCallback: () => controller.secondReject(),
              buttonText: '거절하기')),
          child: const Text('거절'),
        ),
      ),
    ],
  ).paddingSymmetric(vertical: 16);

  Widget _disabledBt(String text) => ElevatedButton(
      onPressed: null,
      style: BtStyle.standard(color: ThemeColors.grayLightest),
      child: Text(text)).paddingOnly(top: 16);
}
