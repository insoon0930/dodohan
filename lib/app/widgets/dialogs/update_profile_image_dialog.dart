import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';

class UpdateProfileImageDialog extends StatelessWidget {
  final Function confirmCallback;
  final int costCoin;

  const UpdateProfileImageDialog({Key? key, required this.confirmCallback, required this.costCoin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding:
            const EdgeInsets.only(top: 39, bottom: 30, left: 30, right: 30),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(33)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('프로필 변경 신청', style: ThemeFonts.bold.getTextStyle(size: 18)),
            const SizedBox(height: 16),
            Text('본인 확인이 어려운 사진은\n반려될 수 있어요',
                style: ThemeFonts.medium.getTextStyle(size: 16),
                textAlign: TextAlign.center),
            const SizedBox(height: 6),
            Text('마스크, 모자, 옆모습, 어두운, 많이 가려진,\n여러명의 얼굴이 나온, ai 프로필 등',
                style: ThemeFonts.medium.getTextStyle(size: 14, color: ThemeColors.main),
                textAlign: TextAlign.center),
            const SizedBox(height: 25),
            ElevatedButton(
                onPressed: () => confirmCallback(),
                style: BtStyle.standard(color: ThemeColors.main),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('변경 신청 ',
                        style: ThemeFonts.medium
                            .getTextStyle(size: 16, color: ThemeColors.white)),
                    SvgPicture.asset('assets/love.svg').paddingSymmetric(horizontal: 4),
                    Text('$costCoin',
                        style: ThemeFonts.medium
                            .getTextStyle(size: 16, color: ThemeColors.white)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
