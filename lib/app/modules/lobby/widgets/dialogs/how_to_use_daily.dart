import 'package:flutter/material.dart';

import '../../../../../core/services/auth_service.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../data/info_data.dart';

class HowToUseDailyDialog extends StatelessWidget {
  const HowToUseDailyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding:
        const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(33)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('오늘의 카드',
                style: ThemeFonts.bold.getTextStyle(size: 20)),
            const SizedBox(height: 14),
            Text("'캠퍼스'와 '이상형 정보'와 상관 없이\n매일 두명의 이성카드를 추천해줘요!",
                style: ThemeFonts.medium.getTextStyle(size: 17),
                textAlign: TextAlign.center),
            const SizedBox(height: 14),
            Text("1. 두 카드중 하나를 선택하면 내 카드가 전달돼요(사진 비공개)\n2. 상대방이 수락하면 서로 사진이 공개돼요\n3. 이후 최종 매칭이되면 전화번호가 공개돼요",
                style: ThemeFonts.medium.getTextStyle(size: 14),
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text(
              "* '매칭 참여'와 '거절 의사 표현'만 해도 '보상'이 주어져요!",
              style: ThemeFonts.medium.getTextStyle(color: ThemeColors.blueLight, size: 12),
            ),
          ],
        ),
      ),
    );
  }
}
