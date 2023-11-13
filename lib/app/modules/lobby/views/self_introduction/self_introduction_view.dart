
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';

class SelfIntroductionView extends GetView<SelfIntroductionController> {
  const SelfIntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          // child: Obx(
          //   () => Column(
          //     children: [
          //       if(controller.loading.value)
          //         _progressIndicator(),
          //       if(!controller.loading.value && controller.todayCards.isEmpty)
          //         _noCardText(),
          //       if(controller.todayCards.isNotEmpty)
          //         const Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             CardItem(index: 0),
          //             CardItem(index: 1),
          //           ],
          //         ),
          //       const SizedBox(height: 32),
          //       ElevatedButton(
          //           style: BtStyle.standard(color: ThemeColors.mainLight),
          //           onPressed: () => Get.toNamed(Routes.currentCard),
          //           child: const Text('카드 현황')),
          //       const SizedBox(height: 16),
          //     ],
          //   ),
          // ),
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
        child: Text("홈의 '나' 프로필을 완성해주세요 (필수)\n유효한 상대방이 있는 경우 매일 밤 12시에 제공됩니다", style: ThemeFonts.regular.getTextStyle(color: ThemeColors.greyText, size: 14), textAlign: TextAlign.center,),
      );
}
