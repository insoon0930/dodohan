import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/enums.dart';
import '../../image/image_view_box.dart';

class DecisionWaitingDialog extends StatelessWidget {
  final String profileImage;
  final MatchStatus status;

  const DecisionWaitingDialog({Key? key, required this.profileImage, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                boxShadow: [BoxShadow(color: Color(0x1a000000), offset: Offset(2, 2), blurRadius: 8, spreadRadius: 0)],
                color: Color(0xfffefffe)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 25),
                  Text('🎉 1차 매칭 성공! 🎉', style: ThemeFonts.semiBold.getTextStyle(size: 16)),
                  const SizedBox(height: 25),
                  //https://storage.googleapis.com/dodohan-6c8fd.appspot.com/profile/Rectangle%209.png
                  ImageViewBox(url: profileImage, width: 160, height: 160),
                  const SizedBox(height: 16),
                  if(status == MatchStatus.unChecked)
                    Text('상대방이 아직 확인하지 않았어요!',
                        style: ThemeFonts.regular.getTextStyle(),
                        textAlign: TextAlign.center),
                  if(status == MatchStatus.checked)
                    Text('상대방의 선택을 기다리고 있어요!',
                        style: ThemeFonts.regular.getTextStyle(),
                        textAlign: TextAlign.center),
                  ElevatedButton(
                      onPressed: () => Get.back(),
                      style: BtStyle.confirm,
                      child: Text('확인',
                          style: ThemeFonts.medium
                              .getTextStyle(size: 16, color: ThemeColors.mainLight),
                          textAlign: TextAlign.center)).paddingAll(16),
                ]),
          ),
        ],
      ),
    );
  }

}