
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
                if(controller.todayCards.isEmpty)
                  _progressIndicator(),
                if(controller.todayCards.isNotEmpty)
                  Row(
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
        // Center(
        //   child: DefaultTextStyle(
        //     style: ThemeFonts.medium.getTextStyle(size: 18),
        //     child: AnimatedTextKit(
        //       animatedTexts: [WavyAnimatedText('준비중입니다')],
        //       isRepeatingAnimation: true,
        //       repeatForever: true,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _progressIndicator() => Container(
    alignment: Alignment.center,
    height: (Get.width - 64) / 2 * 1.4,
    child: DefaultTextStyle(
      style: ThemeFonts.medium.getTextStyle(size: 18),
      child: AnimatedTextKit(
        animatedTexts: [WavyAnimatedText('···')],
        isRepeatingAnimation: true,
        repeatForever: true,
      ),
    ),
  );
}
