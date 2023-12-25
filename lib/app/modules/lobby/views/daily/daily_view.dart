
import 'package:animated_text_kit/animated_text_kit.dart';
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
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => Column(
              children: [
                if(controller.loading.value)
                  _progressIndicator(),
                if(!controller.loading.value && controller.todayCards.isEmpty)
                  _noCardText(),
                if(controller.todayCards.isNotEmpty)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardItem(index: 0),
                      CardItem(index: 1),
                    ],
                  ),
                const SizedBox(height: 32),
                ElevatedButton(
                    style: BtStyle.standard(color: ThemeColors.mainLight),
                    onPressed: () => Get.toNamed(Routes.currentCard),
                    child: const Text('카드 현황')),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
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
        child: Text("홈의 '나' 프로필을 완성해주세요 (필수)\n유효한 상대방이 있는 경우 매일 밤 12시에 제공됩니다", style: ThemeFonts.regular.getTextStyle(color: ThemeColors.grayText, size: 14), textAlign: TextAlign.center,),
      );
}
