import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dodohan/app/widgets/dividers/my_divider.dart';
import 'package:dodohan/app/widgets/dividers/my_divider_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:dodohan/app/modules/lobby/views/daily/widgets/card_item.dart';
import 'package:dodohan/core/theme/buttons.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../routes/app_routes.dart';

class DailyView extends GetView<DailyController> {
  const DailyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Column(
              children: [
                if (controller.loading.value) _progressIndicator(),
                if (!controller.loading.value && controller.todayCards.isEmpty) _noCardText(),
                if (controller.todayCards.isNotEmpty)
                  Flexible(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.todayCards.length ~/ 2,
                      itemBuilder: (context, index) => _set(index * 2 + 0, index * 2 + 1),
                    ),
                  ),
                if (!controller.user.hasFourDailyCards)
                  ElevatedButton(
                          style: BtStyle.standard(color: ThemeColors.mainLight),
                          onPressed: () => Get.toNamed(Routes.currentCard),
                          child: const Text('카드 현황'))
                      .paddingOnly(top: 16),
                const SizedBox(height: 86),
              ],
            ),
          ),
        ),
        if (controller.user.hasFourDailyCards)
          ElevatedButton(
                  style: BtStyle.standard(color: ThemeColors.mainLight),
                  onPressed: () => Get.toNamed(Routes.currentCard),
                  child: const Text('카드 현황'))
              .paddingAll(16),
      ],
    );
  }

  Widget _progressIndicator() => Container(
        alignment: Alignment.center,
        height: (Get.width - 64) / 2 * 1.4 + 8,
        child: DefaultTextStyle(
          style: ThemeFonts.medium.getTextStyle(size: 18),
          child: AnimatedTextKit(
            animatedTexts: [WavyAnimatedText('···')],
            isRepeatingAnimation: true,
            repeatForever: true,
          ),
        ),
      );

  Widget _noCardText() => Container(
        alignment: Alignment.center,
        height: (Get.width - 64) / 2 * 1.4 + 8,
        child: Text(
          "홈의 '나' 프로필을 완성해주세요 (필수)\n유효한 상대방이 있는 경우 매일 밤 12시에 제공됩니다",
          style: ThemeFonts.regular.getTextStyle(color: ThemeColors.grayText, size: 14),
          textAlign: TextAlign.center,
        ),
      );

  Widget _set(int index1, int index2) => Card(
        margin: const EdgeInsets.all(0),
        color: ThemeColors.mainLightest2,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardItem(index: index1),
            CardItem(index: index2),
          ],
        ).paddingAll(10),
      ).paddingOnly(bottom: 8, top: 8);
}
