import 'package:flutter/material.dart';

import '../../../../../core/services/auth_service.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../data/info_data.dart';

class HowToUseWeeklyDialog extends StatelessWidget {
  const HowToUseWeeklyDialog({Key? key}) : super(key: key);

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
            Text('두근두근${InfoData.univInfo[AuthService.to.user.value.univ]?.appTitleTail}\n(교내 소개팅)',
                style: ThemeFonts.bold.getTextStyle(size: 20)),
            const SizedBox(height: 14),
            Text('CC(캠퍼스 커플) 매칭 서비스에요!\n인증된 동일 캠퍼스생 대상으로,\n서로의 이상형 정보에 맞는\n1:1 소개팅을 매주 매칭시켜줘요.',
                style: ThemeFonts.medium.getTextStyle(size: 17),
                textAlign: TextAlign.center),
            const SizedBox(height: 14),
            Text("신청 방법",
                style: ThemeFonts.bold.getTextStyle(size: 20),
                textAlign: TextAlign.center),
            const SizedBox(height: 14),
            Text("1. '나' & '이상형' 정보 등록\n2. 신청 버튼 클릭\n3. 매주 금요일 결과 확인",
                style: ThemeFonts.medium.getTextStyle(size: 17),
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text(
              "* 그 외 자세한 사항은 '설정'에 '자주하는 질문' 참조",
              style: ThemeFonts.medium.getTextStyle(color: ThemeColors.greyText, size: 11),
            ),
          ],
        ),
      ),
    );
  }
}
