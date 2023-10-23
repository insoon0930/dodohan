import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/fonts.dart';
import 'dummy_card_item.dart';

class DailyUpdatingView extends StatelessWidget {
  const DailyUpdatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Blur(
          blur: 0.6,
          colorOpacity: 0.8,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DummyCardItem(),
                    DummyCardItem(),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                    style: BtStyle.standard(color: ThemeColors.mainLight),
                    onPressed: () {},
                    child: const Text('보낸 신청')),
                const SizedBox(height: 16),
                ElevatedButton(
                    style: BtStyle.standard(color: ThemeColors.mainLight),
                    onPressed: () {},
                    child: const Text('받은 신청')),
              ],
            ),
          ),
        ),
        Center(
          child: DefaultTextStyle(
            style: ThemeFonts.medium.getTextStyle(size: 18),
            child: AnimatedTextKit(
              animatedTexts: [WavyAnimatedText('준비중입니다')],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ),
        ),
      ],
    );
  }
}
