import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/utility.dart';
import '../../image/image_view_box.dart';
import '../../../data/model/match.dart';

class MatchSuccessDialog extends StatelessWidget {
  final Match match;
  final String phoneNum, profileImage;

  const MatchSuccessDialog(
      {Key? key, required this.match, required this.phoneNum, required this.profileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            boxShadow: [BoxShadow(color: Color(0x1a000000), offset: Offset(2, 2), blurRadius: 8, spreadRadius: 0)],
            color: Color(0xfffefffe)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),
              Text('🎉 매칭 성공! 🎉', style: ThemeFonts.semiBold.getTextStyle(size: 16)),
              const SizedBox(height: 25),
              ImageViewBox(url: profileImage, width: 160, height: 160),
              const SizedBox(height: 16),
              Text(Utility.formatPhoneNum(phoneNum), style: ThemeFonts.medium.getTextStyle(size: 24)),
              ElevatedButton(
                  onPressed: () => Get.back(),
                  style: BtStyle.confirm,
                  child: Text('확인',
                      style: ThemeFonts.medium
                          .getTextStyle(size: 16, color: ThemeColors.mainLight),
                      textAlign: TextAlign.center)).paddingAll(16),
            ]),
      ),
    );
  }

}