import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/widgets/image/image_view_box.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../data/enums.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import 'daily_card_controller.dart';

class DailyCardPage extends GetView<DailyCardController> {
  const DailyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('오늘의 카드'),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              ImageViewBox(url: controller.dailyCard.value.youProfileImage, isBlurred: true, width: Get.width - 32, height: Get.width - 32),
              //todo 추가 선택 가능하게 되면 아래껄로
              //if(controller.dailyCard.value.meStatus == MatchStatus.checked)
              if (controller.dailyController.isFirstChoice)
                ElevatedButton(
                  style: BtStyle.standard(),
                  onPressed: () => controller.showChooseDialog(),
                  child: Text('선택하기',
                      style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
                ).paddingSymmetric(vertical: 16),
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
          width: Get.width * 0.2,
          alignment: Alignment.centerLeft,
          child: Text(category, style: ThemeFonts.medium.getTextStyle(color: Colors.black45)).paddingOnly(left: 8),
        ),
        Container(
          width: Get.width * 0.7,
          alignment: Alignment.centerLeft,
          child: Text(value, style: ThemeFonts.medium.getTextStyle()).paddingOnly(left: 8),
        ),
      ],
    );
  }
}
