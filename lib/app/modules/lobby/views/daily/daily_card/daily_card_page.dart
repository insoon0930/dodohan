import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/image/image_view_box.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../data/enums.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/dialogs/report_dialog.dart';
import '../../../../../widgets/dialogs/select/select_dialog.dart';
import '../../../../../widgets/dialogs/select/select_dialog_item.dart';
import 'daily_card_controller.dart';

class DailyCardPage extends GetView<DailyCardController> {
  const DailyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('오늘의 카드', actions: [GestureDetector(
              onTap: () => Get.dialog(ReportDialog(
                    reportCallback: () async {
                      return;
                    },
                    blockText: '차단하기(카드 삭제)',
                    blockCallback: () => controller.block(),
                  )),
              child: Container(
                width: 40,
                height: 20,
                color: Colors.transparent,
                child: SvgPicture.asset('assets/dots.svg', color: ThemeColors.grayDark).paddingOnly(left: 20),
              )).paddingOnly(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                //todo 이것도 current card 랑 일맥상통하게 해주는게 좋을듯(블러, 버튼)
                ImageViewBox(
                    url: controller.dailyCard.value.youProfileImage,
                    isBlurred: true,
                    blurValue: 24,
                    width: Get.width - 32,
                    height: Get.width - 32),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('1차 매칭에 성공시 공개됩니다', style: ThemeFonts.medium.getTextStyle(color: Colors.white, size: 14)),
                ),
              ]),
              //todo 추가 선택 가능하게 되면 아래껄로
              //if(controller.dailyCard.value.meStatus == MatchStatus.checked)
              if (controller.dailyController.isFirstChoice)
                ElevatedButton(
                  style: BtStyle.standard(),
                  onPressed: () => controller.showChooseDialog(),
                  child: const Text('선택하기'),
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
              _infoForm('MBTI', controller.youInfo.mbti ?? ''),
              const Divider(),
              _infoForm('간단소개', controller.youInfo.introduction ?? ''),
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
          // height: 35,
          alignment: Alignment.centerLeft,
          child: Text(value, style: ThemeFonts.medium.getTextStyle()).paddingOnly(left: 8),
        ),
      ],
    );
  }
}
