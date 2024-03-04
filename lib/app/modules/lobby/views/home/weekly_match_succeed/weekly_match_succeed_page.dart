import 'package:dodohan/app/modules/lobby/views/home/weekly_match_succeed/weekly_match_succeed_controller.dart';
import 'package:dodohan/app/widgets/image/image_view_box.dart';
import 'package:dodohan/app/widgets/selectable_phone_num.dart';
import 'package:dodohan/core/theme/buttons.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:dodohan/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WeeklyMatchSucceedPage extends GetView<WeeklyMatchSucceedController> {
  const WeeklyMatchSucceedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Stack(
              children: [
                _background(),
                SafeArea(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                const SizedBox(height: 20),
                                Text('교내 소개팅 결과', style: ThemeFonts.bold.getTextStyle(size: 18, color: ThemeColors.skyBlue)),
                                const SizedBox(height: 15),
                                Text('${controller.match.value!.isFinalMatchSucceeded ? '최종' : '1차' } 매칭 성공!', style: ThemeFonts.bold.getTextStyle(size: 28, color: ThemeColors.blackTextLight)),
                                const SizedBox(height: 5),
                                Text('금요일이 지나면 매칭결과가 사라져요', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.skyBlueDark)),
                                const SizedBox(height: 25),
                                //https://storage.googleapis.com/dodohan-6c8fd.appspot.com/profile/Rectangle%209.png
                                Stack(children: [
                                  ImageViewBox(url: controller.profileImage, width: Get.width * 0.8, height: Get.width * 0.8),
                                  if(!controller.match.value.hasMadeDecision)
                                    Positioned(right: 10, top: 10, child: GestureDetector(
                                      onTap: () => controller.showReportDialog(),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: const ShapeDecoration(
                                          color: Colors.white,
                                          shape: OvalBorder(
                                            side: BorderSide(width: 1, color: Color(0xFFEDECEE)),
                                          ),
                                        ),
                                        child: SvgPicture.asset('assets/dots.svg', color: ThemeColors.grayDark).paddingAll(7),
                                    ),
                                  ))
                                ]),
                                const SizedBox(height: 16),
                                if(controller.match.value.isFinalMatchSucceeded)
                                  SelectablePhoneNum(phoneNum: controller.phoneNum),
                                SizedBox(height: controller.match.value.isFinalMatchSucceeded ? 32 : 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('나의 이상형 조건', style: ThemeFonts.bold.getTextStyle(size: 18, color: ThemeColors.blackTextLight)),
                                    Text('모두 일치', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.skyBlueDark)),
                                  ],
                                ).paddingSymmetric(horizontal: Get.width * 0.1),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        children: [
                                          _chip(controller.oppositeInfo.value.major!),
                                          _chip('${controller.oppositeInfo.value.age}세'),
                                          _chip('${controller.oppositeInfo.value.height}cm'),
                                          _chip(controller.oppositeInfo.value.isSmoker! ? '흡연' : '비흡연'),
                                          _chip('${controller.oppositeInfo.value.bodyShape}'),
                                        ],
                                      ).paddingSymmetric(horizontal: Get.width * 0.1),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          color: ThemeColors.cream,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: Text(controller.oppositeInfo.value.introduction??'', style: ThemeFonts.medium.getTextStyle()).paddingAll(16),
                                      ),
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: Get.width * 0.06),
                              ]),
                            ),
                          ),
                          if(!controller.match.value!.hasMadeDecision)
                            Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: ElevatedButton(
                                        style: BtStyle.standard(color: ThemeColors.chip),
                                        onPressed: () => controller.reject(),
                                        child: Text('거절', style: ThemeFonts.medium.getTextStyle(size: 16, color: ThemeColors.emphasis))),
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  Expanded(
                                    flex: 5,
                                    child: ElevatedButton(
                                        style: BtStyle.standard(color: ThemeColors.main),
                                        onPressed: () => controller.confirm(),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Text('수락'),
                                            SvgPicture.asset('assets/love.svg').paddingSymmetric(horizontal: 4),
                                            Text('${controller.user.isMan! ? 6 : 3}'),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text('수락한 경우에만 상대방의 최종 선택을 확인할 수 있습니다', style: ThemeFonts.regular.getTextStyle(color: ThemeColors.grayTextLight), textAlign: TextAlign.center),
                            ],
                          ).paddingSymmetric(horizontal: Get.width * 0.06, vertical: Get.width * 0.03),
                        ],
                      ),
                      _closeButton()
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }

  Widget _chip(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        decoration: ShapeDecoration(
          color: ThemeColors.skyBlueLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        ),
        child: Text(text, style: ThemeFonts.medium.getTextStyle(size: 16, color: ThemeColors.skyBlueDark)),
      ).paddingOnly(right: 8, bottom: 8);

  Widget _background() => Container(
    height: Get.height * 0.6,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: const Alignment(0.00, -1.00),
        end: const Alignment(0, 1),
        colors: [const Color(0xFFDDEAFF), Colors.white.withOpacity(0)],
      ),
    ),
  );

  Widget _closeButton() => Positioned(
    top: 5,
    right: Get.width * 0.03,
    child: IconButton(
      icon: SvgPicture.asset('assets/cancel.svg'),
      onPressed: () => Get.back(),
    ),
  );
}
