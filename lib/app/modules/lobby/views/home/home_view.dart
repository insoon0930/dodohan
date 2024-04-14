import 'dart:ffi';

import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/app/modules/lobby/views/home/me_info/me_info_controller.dart';
import 'package:dodohan/app/modules/lobby/views/home/you_info/you_info_controller.dart';
import 'package:dodohan/app/modules/lobby/widgets/dialogs/how_to_use_weekly.dart';
import 'package:dodohan/app/widgets/dialogs/error_dialog.dart';
import 'package:dodohan/app/widgets/dialogs/report_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../core/theme/buttons.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/paddings.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/info_data.dart';
import '../../../../widgets/setting_icon_button.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  final MeInfoController meInfoController = Get.find();
  final YouInfoController youInfoController = Get.find();
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _box1(),
        const SizedBox(height: 12),
        Expanded(child: _box2()),
        // _upperBox(),
        // const Divider(thickness: 10, color: ThemeColors.grayLightest)
        //     .paddingSymmetric(vertical: 16),
        // _lowerBox(),
      ],
    );
  }

  // Widget _upperBox() => Stack(
  //       children: [
  //         Column(
  //           children: [
  //             const SizedBox(height: 52),
  //             Center(
  //               child: Column(
  //                 children: [
  //                   if (AuthService.to.isAdmin)
  //                     Column(
  //                       children: [
  //                         _applicantNum(),
  //                         Text(
  //                           "신청자 수",
  //                           style: ThemeFonts.medium.getTextStyle(size: 11),
  //                         ),
  //                       ],
  //                     ),
  //                   if (!AuthService.to.isAdmin) _userNumData(),
  //                   const SizedBox(height: 16),
  //                   Obx(
  //                     () => Text(
  //                       controller.leftDay.value,
  //                       style: ThemeFonts.bold.getTextStyle(
  //                           size: 30, color: ThemeColors.mainLight),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 4),
  //                   Text(
  //                     "이번 회차 마감까지",
  //                     style: ThemeFonts.medium.getTextStyle(size: 11),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 40),
  //             ElevatedButton(
  //               style: BtStyle.standard(),
  //               onPressed: !AuthService.to.user.value.isWomanUniv
  //                   ? () => controller.getMatchResult()
  //                   : () => Get.dialog(const ErrorDialog(
  //                       text: "여대에서는 '교내 소개팅' 기능이\n제한되어있습니다!")),
  //               child: const Text('매칭 결과 확인'),
  //             ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
  //             const SizedBox(height: 16),
  //             Text(
  //               "* '금요일' 하루간 확인할 수 있습니다",
  //               style: ThemeFonts.medium.getTextStyle(size: 11),
  //             ),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             GestureDetector(
  //                 onTap: () => controller.tapProfileImage(),
  //                 child: CircleAvatar(
  //                     backgroundImage:
  //                         NetworkImage(controller.user.profileImage))),
  //             GestureDetector(
  //               child: SvgPicture.asset('assets/setting.svg'),
  //               onTap: () => Get.toNamed(Routes.setting),
  //             ),
  //           ],
  //         ).paddingSymmetric(horizontal: 16),
  //       ],
  //     );
  //
  // Widget _lowerBox() => Column(
  //       children: [
  //         Row(
  //           children: [
  //             const SizedBox(width: 16),
  //             Flexible(
  //               child: ElevatedButton(
  //                 style: BtStyle.standard(color: ThemeColors.mainLight),
  //                 onPressed: () => Get.toNamed(Routes.meInfo),
  //                 child: const Text('나'),
  //               ),
  //             ),
  //             const SizedBox(width: 16),
  //             Flexible(
  //               child: ElevatedButton(
  //                 style: BtStyle.standard(color: ThemeColors.mainLight),
  //                 onPressed: !AuthService.to.user.value.isWomanUniv
  //                     ? () => Get.toNamed(Routes.youInfo)
  //                     : () => Get.dialog(const ErrorDialog(
  //                         text: "여대에서는 '교내 소개팅' 기능이\n제한되어있습니다!")),
  //                 child: const Text('이상형'),
  //               ),
  //             ),
  //             const SizedBox(width: 16),
  //           ],
  //         ),
  //         const SizedBox(height: 16),
  //         ElevatedButton(
  //           style: BtStyle.standard(),
  //           onPressed: !AuthService.to.user.value.isWomanUniv
  //               ? () => controller.getInfos()
  //               : () => Get.dialog(
  //                   const ErrorDialog(text: "여대에서는 '교내 소개팅' 기능이\n제한되어있습니다!")),
  //           child: const Text('이번 회차 신청'),
  //         ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
  //         const SizedBox(height: 16),
  //         Text(
  //           "* '나'와 '이상형'을 모두 작성후 신청해주세요",
  //           style: ThemeFonts.medium.getTextStyle(size: 11),
  //         ),
  //       ],
  //     );

  Widget _applicantNum() => StreamBuilder<int>(
        stream: controller.getApplicantsNumStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              "${snapshot.data}",
              style: ThemeFonts.bold
                  .getTextStyle(size: 56, color: ThemeColors.main),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      );

  // Widget _userNumData() => Obx(
  //       () => Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Column(
  //             children: [
  //               Text(
  //                 "${controller.userNum.value}",
  //                 style: ThemeFonts.bold
  //                     .getTextStyle(size: 40, color: ThemeColors.main),
  //               ),
  //               Text(
  //                 "가입자 수",
  //                 style: ThemeFonts.medium.getTextStyle(size: 11),
  //               ),
  //             ],
  //           ),
  //           Column(
  //             children: [
  //               Text(
  //                 (controller.genderRatio.value).toStringAsFixed(2),
  //                 style: ThemeFonts.bold
  //                     .getTextStyle(size: 40, color: ThemeColors.main),
  //               ),
  //               Text(
  //                 "성비",
  //                 style: ThemeFonts.medium.getTextStyle(size: 11),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );

  Widget _box1() => Container(
        decoration: BoxDecoration(
          color: ThemeColors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => controller.tapProfileImage(),
                        child: CircleAvatar(
                            minRadius: 30,
                            backgroundImage:
                                NetworkImage(controller.user.profileImage))),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            //!!
                            // Text('경성대',
                            //     style: ThemeFonts.bold.getTextStyle(size: 16, color: ThemeColors.blackTextLight)),
                            Text('${controller.user.univ} ',
                                style: ThemeFonts.bold.getTextStyle(size: 16, color: ThemeColors.blackTextLight)),
                            Text(regionFilter[controller.user.region]!,
                                style: ThemeFonts.bold.getTextStyle(size: 12, color: ThemeColors.grayTextDarker))
                          ],
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.myProfile),
                          child: Container(
                              decoration: BoxDecoration(
                                color: ThemeColors.chip,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text('내 프로필 보기',
                                      style: ThemeFonts.medium
                                          .getTextStyle(size: 12))
                                  .paddingSymmetric(
                                      vertical: 6, horizontal: 10)),
                        )
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.setting),
                  child: Container(
                      color: Colors.transparent,
                      child: SvgPicture.asset('assets/setting.svg')
                          .paddingOnly(top: 10, bottom: 10, left: 10)),
                ),
                // IconButton(
                //     onPressed: () => Get.toNamed(Routes.setting),
                //     icon: SvgPicture.asset('assets/setting.svg'),
                //     padding: EdgeInsets.zero,
                //     constraints: BoxConstraints())
              ],
            )
          ],
        ),
      ).paddingSymmetric(horizontal: 16);

  Widget _box2() => Container(
        decoration: BoxDecoration(
          color: ThemeColors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('교내 소개팅',
                    style: ThemeFonts.bold.getTextStyle(
                        size: 16, color: ThemeColors.grayTextDarker)),
                GestureDetector(
                    onTap: () => Get.dialog(const HowToUseWeeklyDialog()),
                    child: Container(
                        color: Colors.transparent,
                        child: SvgPicture.asset('assets/info.svg')
                            .paddingOnly(right: 3, top: 3, bottom: 6, left: 6)))
              ],
            ),
            if(!controller.isFriday)
              Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "남은 시간",
                    style: ThemeFonts.bold.getTextStyle(size: 16),
                  ).paddingOnly(bottom: 8),
                  Obx(
                    () => Text(
                      controller.leftDay.value,
                      style: ThemeFonts.bold
                          .getTextStyle(size: 26, color: ThemeColors.main),
                    ),
                  ),
                ],
              ),
            )
            else
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "매칭 결과를 확인해보세요!",
                      style: ThemeFonts.bold.getTextStyle(size: 22, color: ThemeColors.blackTextLight),
                      textAlign: TextAlign.center,
                    ).paddingOnly(bottom: 8),
                    Text(
                      "매주 토요일 새로운 회차가 오픈됩니다",
                      style: ThemeFonts.medium.getTextStyle(size: 14, color: ThemeColors.grayTextLight),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            Obx(
              () => Column(
                children: [
                  Opacity(
                    opacity: meInfoController.isLoading.value ? 0 : 1,
                    child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.meInfo),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: meInfoController.meInfo.value.isCompleted ? ThemeColors.white : ThemeColors.subLightest,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1, color: meInfoController.meInfo.value.isCompleted ? ThemeColors.chip : ThemeColors.sub),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 26, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('내 프로필 설정',
                                  style: ThemeFonts.bold.getTextStyle(size: 16)),
                              const SizedBox(height: 4),
                              Text(meInfoController.meInfo.value.isCompleted ? '설정 완료' : '내 프로필을 설정해주세요',
                                  style: ThemeFonts.medium.getTextStyle(size: 13, color: meInfoController.meInfo.value.isCompleted ? ThemeColors.main : ThemeColors.sub)),
                            ],
                          ),
                          SvgPicture.asset('assets/arrow_right.svg')
                        ],
                      ),
                    ),
                ).paddingOnly(bottom: 12),
                  ),
                  Opacity(
                    opacity: youInfoController.isLoading.value ? 0 : 1,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(Routes.youInfo),
                      child: Container(
                        decoration: ShapeDecoration(
                          color: youInfoController.youInfo.value.isCompleted ? ThemeColors.white : ThemeColors.subLightest,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: youInfoController.youInfo.value.isCompleted ? ThemeColors.chip :ThemeColors.sub),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 26, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('이상형 설정',
                                    style: ThemeFonts.bold.getTextStyle(size: 16)),
                                const SizedBox(height: 4),
                                Text(youInfoController.youInfo.value.isCompleted ? '설정 완료' :'소개받고 싶은 이상형을 설정해주세요',
                                    style: ThemeFonts.medium.getTextStyle(size: 13, color: youInfoController.youInfo.value.isCompleted ? ThemeColors.main :ThemeColors.sub)),
                              ],
                            ),
                            SvgPicture.asset('assets/arrow_right.svg')
                          ],
                        ),
                      ),
                    ).paddingOnly(bottom: 26),
                  ),
                ],
              ),
            ),
            Obx(
              () => Opacity(
                opacity: controller.isLoading.value ? 0 : 1,
                child: Column(
                  children: [
                    if(controller.isFriday)
                      ElevatedButton(
                        style: BtStyle.standard(color: ThemeColors.sub),
                        onPressed: !AuthService.to.user.value.isWomanUniv
                            ? () => controller.getMatchResult()
                            : () => Get.dialog(const ErrorDialog(
                                text: "여대에서는 '교내 소개팅' 기능이\n제한되어있습니다!")),
                        child: const Text('매칭 결과 확인하기'),
                      ).paddingOnly(bottom: 10)
                    else
                      ElevatedButton(
                        style: BtStyle.standard(),
                        onPressed: !AuthService.to.user.value.isWomanUniv
                            ? controller.isApplicationCompleted.value ? null : () => controller.getInfos()
                            : () => Get.dialog(
                            const ErrorDialog(text: "여대에서는 '교내 소개팅' 기능이\n제한되어있습니다!")),
                        child: Text(controller.isApplicationCompleted.value ? '신청 완료' : '교내 소개팅 신청하기'),
                      ).paddingOnly(bottom: 10),
                    Text('매주 목요일 23시 55분 마감',
                        style: ThemeFonts.medium.getTextStyle(
                            size: 12, color: ThemeColors.grayTextLight))
                  ],
                ),
              ),
            ),
          ],
        ),
      ).paddingOnly(left: 16, right: 16, bottom: 16);
}
