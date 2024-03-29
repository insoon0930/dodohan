import 'package:dodohan/app/modules/lobby/views/home/weekly_match_succeed/weekly_match_succeed_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/service/match_service/service.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/push_service.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/enums.dart';
import '../../../data/model/user.dart';
import '../../../data/service/user_service/service.dart';
import '../../image/image_view_box.dart';
import '../../../data/model/match.dart';
import '../action_dialog.dart';
import '../report_dialog.dart';

class WeeklyMatchSucceedPage extends GetView<WeeklyMatchSucceedController> {
  final UserService _userService = UserService();
  final MatchService matchService;
  Match match;
  final String phoneNum, profileImage;
  final Function function;

  WeeklyMatchSucceedPage(this.matchService,
      {Key? key,
      required this.match,
      required this.phoneNum,
      required this.profileImage,
      required this.function})
      : super(key: key);

  User get user => AuthService.to.user.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                  boxShadow: [BoxShadow(color: Color(0x1a000000), offset: Offset(2, 2), blurRadius: 8, spreadRadius: 0)],
                  color: Color(0xfffefffe)),
              padding: const EdgeInsets.all(5.0), //TODO: 조절
              child: Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 25),
                      Text('🎉 1차 매칭 성공! 🎉', style: ThemeFonts.semiBold.getTextStyle(size: 16)),
                    const SizedBox(height: 25),
                    //https://storage.googleapis.com/dodohan-6c8fd.appspot.com/profile/Rectangle%209.png
                    ImageViewBox(url: profileImage, width: Get.width * 0.5, height: Get.width * 0.5),
                    const SizedBox(height: 16),
                    Text('최종 선택을 해주세요\n(수락시 ${user.isMan! ? 6 : 3} 하트가 소모됩니다)', style: ThemeFonts.regular.getTextStyle(), textAlign: TextAlign.center),
                    Text('* 수락한 경우에만 상대방의\n최종 선택을 확인할 수 있습니다',
                        style: ThemeFonts.regular
                            .getTextStyle(size: 14, color: ThemeColors.grayText),
                        textAlign: TextAlign.center)
                        .paddingOnly(top: 14),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async {
                                final int costCoin = user.isMan! ? 6 : 3;
                                if (user.coin < costCoin) {
                                  Get.back();
                                  Get.dialog(ActionDialog(title: '하트 부족', text: '스토어로 이동하기', confirmCallback: () {
                                    Get.back();
                                    return Get.toNamed(Routes.store);
                                  }));
                                  return;
                                }

                                Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
                                match = (await matchService.findOne(user.id, user.isMan!))!;
                                matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.confirmed);
                                //3. 유저 하트 갯수 차감 (백, 프론트)
                                await _userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.weeklyMatch);
                                AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);

                                //푸시 및 보상
                                if(match.youStatus == MatchStatus.confirmed) {
                                  FcmService.to.sendFcmPush(match.you, FcmPushType.weeklyMatched);
                                } else if(match.youStatus == MatchStatus.rejected) {
                                  const refundCoin = 1;
                                  Get.snackbar('매칭 실패', '상대방은 거절을 선택했습니다. 하트 $refundCoin개를 돌려 받습니다');
                                  await _userService.increaseCoin(user.id, refundCoin, type: CoinReceiptType.dailyCardRefund);
                                  AuthService.to.user.update((user) => user!.coin = user.coin + refundCoin);
                                } else {
                                  FcmService.to.sendFcmPush(match.you, FcmPushType.weeklyChoiceMade);
                                }

                                Get.back();
                                Get.back();
                                //상대가 수락했을 때만,
                                //TODO: Get.toNamed의 리턴 값으로 뭐 전달해주고 해당 페이지에서 다시 해당 함수 실행시키는 방식으로 가자
                                function();
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
                                match = (await matchService.findOne(user.id, user.isMan!))!;
                                await matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.rejected);
                                //3. 유저 하트 갯수 증가 (백, 프론트)
                                final int rewardCoin = user.isMan! ? 1 : 2;
                                await _userService.increaseCoin(user.id, rewardCoin, type: CoinReceiptType.weeklyReject);
                                AuthService.to.user.update((user) => user!.coin = user.coin + rewardCoin);

                                //푸시 및 보상
                                if(match.youStatus == MatchStatus.confirmed) {
                                  const refundCoin = 1;
                                  await _userService.increaseCoin(match.you, refundCoin, type: CoinReceiptType.weeklyRefund);
                                  FcmService.to.sendFcmPush(match.you, FcmPushType.weeklyMatchFailed);
                                } else if(match.youStatus == MatchStatus.unChecked || match.youStatus == MatchStatus.checked) {
                                  FcmService.to.sendFcmPush(match.you, FcmPushType.weeklyChoiceMade);
                                }

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
                          FcmService.to.sendFcmPush(match.you, FcmPushType.weeklyChoiceMade);
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
      ),
    );
  }

}