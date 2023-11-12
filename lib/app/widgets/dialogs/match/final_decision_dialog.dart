import 'package:dodohan/app/widgets/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/service/match_service/service.dart';
import 'package:dodohan/app/widgets/dialogs/match/match_success_dialog.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/push_service.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/utility.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/enums.dart';
import '../../../data/model/user.dart';
import '../../../data/service/user_service/service.dart';
import '../../image/image_view_box.dart';
import '../../../data/model/match.dart';
import '../action_dialog.dart';
import '../report_dialog.dart';
import '../select/select_dialog.dart';
import '../select/select_dialog_item.dart';

class FinalDecisionDialog extends StatelessWidget {
  final UserService _userService = UserService();
  final MatchService matchService;
  final Match match;
  final String phoneNum, profileImage;
  final Function function;

  FinalDecisionDialog(this.matchService,
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
                  Text('최종 선택을 해주세요\n(수락시 6 하트가 소모됩니다)', style: ThemeFonts.regular.getTextStyle(), textAlign: TextAlign.center),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (user.coin < 6) {
                                Get.back();
                                Get.dialog(ActionDialog(title: '하트 부족', text: '스토어로 이동하기', confirmCallback: () {
                                  Get.back();
                                  return Get.toNamed(Routes.store);
                                }));
                                return;
                              }

                              Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
                              FcmService.to.sendFcmPush(user.isMan! ? match.woman : match.man, FcmPushType.weeklyDone);
                              matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.confirmed);
                              //3. 유저 하트 갯수 차감 (백, 프론트)
                              await _userService.increaseCoin(user.id, -6, type: CoinReceiptType.weeklyMatch);
                              AuthService.to.user.update((user) => user!.coin = user.coin - 6);

                              Get.back();
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
                              Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
                              FcmService.to.sendFcmPush(user.isMan! ? match.woman : match.man, FcmPushType.weeklyDone);
                              await matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.rejected);
                              //3. 유저 하트 갯수 차감 (백, 프론트)
                              final int rewardCoin = user.isMan! ? 1 : 2;
                              await _userService.increaseCoin(user.id, rewardCoin, type: CoinReceiptType.weeklyReject);
                              AuthService.to.user.update((user) => user!.coin = user.coin + rewardCoin);
                              Get.back();
                              Get.back();
                              Get.snackbar('하트 지급', '참여 보상으로 하트가 $rewardCoin개 지급되었습니다');
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
                        FcmService.to.sendFcmPush(user.isMan! ? match.woman : match.man, FcmPushType.weeklyDone);
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