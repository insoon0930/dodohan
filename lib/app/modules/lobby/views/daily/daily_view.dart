
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:stamp_now/app/modules/lobby/views/daily/widgets/card_item.dart';
import 'package:stamp_now/core/theme/buttons.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';

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
                  const Center(child: CircularProgressIndicator()),
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
                    style: BtStyle.standard(color: ThemeColors.mainLightest),
                    onPressed: () {  },
                    child: Text('보낸 신청',
                        style:
                        ThemeFonts.medium.getTextStyle(color: Colors.white))),
                const SizedBox(height: 16),
                ElevatedButton(
                        style: BtStyle.standard(color: ThemeColors.mainLightest),
                        onPressed: () {},
                        child: Text('받은 신청',
                            style: ThemeFonts.medium.getTextStyle(color: Colors.white))),
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
        // )
      ],
    );
  }
}
