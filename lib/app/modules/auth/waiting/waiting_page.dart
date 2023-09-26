import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/auth/waiting/waiting_controller.dart';
import 'package:stamp_now/core/theme/buttons.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/theme/paddings.dart';

class WaitingPage extends GetView<WaitingController> {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WaitingPage build!?');
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: ThemeFonts.bold.getTextStyle(size: 18),
              child: AnimatedTextKit(
                animatedTexts: [WavyAnimatedText('본인인증 심사중')],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
            Text('* 승인까지 최대 1일 정도 소요될 수 있습니다',
                style: ThemeFonts.medium.getTextStyle(size: 12, color: ThemeColors.grayDark)).paddingSymmetric(vertical: 8),
            SizedBox(
              width: 90,
              height: 30,
              child: ElevatedButton(
                  onPressed: () => controller.refreshPage(),
                  style: BtStyle.confirm,
                  child: Text('확인하기', style: ThemeFonts.medium.getTextStyle(size: 12))),
            )
          ],
        ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
      ),
    );
  }
}
