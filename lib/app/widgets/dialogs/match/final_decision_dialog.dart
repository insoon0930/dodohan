import 'package:dodohan/app/widgets/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/service/match_service/service.dart';
import 'package:dodohan/app/widgets/dialogs/match/match_success_dialog.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/utility.dart';
import '../../../data/enums.dart';
import '../../../data/model/user.dart';
import '../../image/image_view_box.dart';
import '../../../data/model/match.dart';
import '../action_dialog.dart';
import '../report_dialog.dart';
import '../select/select_dialog.dart';
import '../select/select_dialog_item.dart';

class FinalDecisionDialog extends StatelessWidget {
  final MatchService matchService;
  final Match match;
  final String phoneNum, profileImage;
  final Function function;

  const FinalDecisionDialog(this.matchService,
      {Key? key,
      required this.match,
      required this.phoneNum,
      required this.profileImage,
      required this.function})
      : super(key: key);

  User get user => AuthService.to.user.value;

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
                  Text('최종 선택을 해주세요', style: ThemeFonts.regular.getTextStyle(), textAlign: TextAlign.center),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.confirmed);
                              Get.back();
                              //상대가 수락했을 때만,
                              function();
                              // Get.dialog(MatchSuccessDialog(match: match, phoneNum: phoneNum, profileImage: profileImage));
                            },
                            style: BtStyle.confirm,
                            child: Text('수락',
                                style: ThemeFonts.medium
                                    .getTextStyle(size: 16, color: ThemeColors.main),
                                textAlign: TextAlign.center)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              await matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.rejected);
                              Get.back();
                            },
                            style: BtStyle.confirm,
                            child: Text('거절',
                                style: ThemeFonts.medium
                                    .getTextStyle(size: 16, color: ThemeColors.redLight),
                                textAlign: TextAlign.center)),
                      ),
                    ],
                  ).paddingAll(16),
                ]),
          ),
          Positioned(
            top: 8,
            right: 16,
            child: GestureDetector(
                onTap: () => Get.dialog(ReportDialog(
                      reportCallback: () async {
                        return;
                      },
                      blockCallback: () async {
                        await matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.rejected);
                        Get.back();
                      },
                    )),
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.transparent,
                  child: SvgPicture.asset('assets/dots.svg', color: ThemeColors.grayDark),
                )),
          ),
        ],
      ),
    );
  }

}