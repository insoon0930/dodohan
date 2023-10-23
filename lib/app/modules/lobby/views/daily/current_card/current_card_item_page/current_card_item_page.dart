import 'package:dodohan/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/image/image_view_box.dart';
import '../../../../../../../core/theme/buttons.dart';
import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../../core/utils/utility.dart';
import '../../../../../../data/enums.dart';
import '../../../../../../widgets/appbars/default_appbar.dart';
import 'current_card_item_controller.dart';

//todo 아. me & you 는 상대적인거임. '보낸 신청' 과 '받은 신청' 에서는 전부 반대지 않음??
//여기는 일단 내가 받은걸로 진행했음 //해당 페이지 들어올 때 그 역할 정하게 하면 될듯?
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
                Text('거절한 카드입니다', style: ThemeFonts.medium.getTextStyle(size: 14, color: ThemeColors.redLight))
              //1차 선택
              else if (controller.meStatus == CardStatus.checked || controller.meStatus == CardStatus.unChecked)
                _firstChoice()
              //2차 선택
              else if (controller.meStatus == CardStatus.confirmed1st && controller.youMadeAFirstChoice)
                _secondChoice()
              //거절됨
              else if (controller.meStatus == CardStatus.rejected1st || controller.meStatus == CardStatus.rejected2nd)
                Text('매칭 실패', style: ThemeFonts.medium.getTextStyle(size: 14, color: ThemeColors.redLight))
              //매칭 성공
              else if (controller.meStatus == CardStatus.rejected1st || controller.meStatus == CardStatus.rejected2nd)
                Text(Utility.formatPhoneNum(controller.dailyCard.value.youPhoneNum), style: ThemeFonts.medium.getTextStyle(size: 14, color: ThemeColors.redLight)),
              if(controller.dailyCard.value.meStatus != CardStatus.checked)
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
          onPressed: () {}, //todo
          child: const Text('수락'),
        ),
      ),
      const SizedBox(width: 16),
      Flexible(
        child: ElevatedButton(
          style: BtStyle.standard(color: ThemeColors.mainLight),
          onPressed: () {}, //todo
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
          onPressed: () {}, //todo
          child: const Text('수락'),
        ),
      ),
      const SizedBox(width: 16),
      Flexible(
        child: ElevatedButton(
          style: BtStyle.standard(color: ThemeColors.mainLight),
          onPressed: () {}, //todo
          child: const Text('거절'),
        ),
      ),
    ],
  ).paddingSymmetric(vertical: 16);
}
