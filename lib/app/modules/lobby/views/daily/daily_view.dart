import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:stamp_now/core/theme/buttons.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../widgets/image/image_view_box.dart';

class DailyView extends GetView<DailyController> {
  const DailyView({Key? key}) : super(key: key);

  //todo 카드 로우 한줄
    //해당 신청 페이지 접근
  //todo 보낸 신청
    //해당 신청 페이지 접근
  //todo 받은 신청
    //해당 신청 페이지 접근
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Blur(
          blur: 2.5,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _card(),
                    _card(),
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
        Center(
          child: DefaultTextStyle(
            style: ThemeFonts.medium.getTextStyle(size: 18),
            child: AnimatedTextKit(
              animatedTexts: [WavyAnimatedText('준비중입니다')],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ),
        )
      ],
    );
  }

  Widget _card() => Card(
    clipBehavior: Clip.hardEdge,
    child: Container(
      width: 200,
      height: 300,
      padding: const EdgeInsets.all(4.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //키 나이 체형 흡현 mbti
          ImageViewBox(url: 'https://storage.googleapis.com/dodohan-6c8fd.appspot.com/profile/KakaoTalk_Photo_2023-08-10-18-31-31.jpg', width: 192, height: 192, isBlurred: true),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('179cm'),
              Text('26살'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('근육있는'),
              Text('비흡연'),
            ],
          ),
          Spacer(),
        ],
      ),
    ),
  );
}
