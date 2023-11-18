import 'package:flutter/material.dart';

import '../../../../../core/services/auth_service.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../data/info_data.dart';

class HowToUseSelfIntroductionDialog extends StatelessWidget {
  const HowToUseSelfIntroductionDialog({Key? key}) : super(key: key);

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
            Text('셀프 소개',
                style: ThemeFonts.bold.getTextStyle(size: 20)),
            const SizedBox(height: 14),
            Text("자신의 매력을 어필해보세요!",
                style: ThemeFonts.medium.getTextStyle(size: 17),
                textAlign: TextAlign.center),
            const SizedBox(height: 14),
            Text("이성의 셀프 소개만 볼 수 있습니다",
                style: ThemeFonts.medium.getTextStyle(size: 14),
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text(
              "* '개인정보 노출', '부적절한 사진 업로드', '기타 이용 정책에 제한 되는 내용'은 관리자에 의해 삭제될 수 있습니다",
              style: ThemeFonts.medium.getTextStyle(color: ThemeColors.greyText, size: 12),
            ),
          ],
        ),
      ),
    );
  }
}
