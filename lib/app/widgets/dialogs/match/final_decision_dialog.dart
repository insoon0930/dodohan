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
                  ImageViewBox(url: profileImage, width: 120, height: 120),
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
                onTap: () => Get.dialog(SelectDialog(itemHeight: 60, items: [
                  SelectDialogItem(
                      text: '신고하기',
                      onTap: () {
                        Get.back();
                        Get.dialog(const ErrorDialog(text: '신고가 완료되었습니다'));
                      },
                      first: true,
                      style: ThemeFonts.semiBold.getTextStyle(size: 15)),
                  SelectDialogItem(
                      text: '차단하기(즉시 거절됨)',
                      onTap: () async {
                        Get.back();
                        Get.back();
                        await matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.rejected);
                        Get.dialog(const ErrorDialog(text: '차단이 완료되었습니다'));
                      },
                      last: true,
                      style: ThemeFonts.semiBold.getTextStyle(size: 15)),
                ])),
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.transparent,
                  child: SvgPicture.asset('assets/dots.svg',
                      color: ThemeColors.grayDark),
                )),
          ),
        ],
      ),
    );
  }

}