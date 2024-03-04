import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dodohan/app/modules/lobby/widgets/dialogs/how_to_use_daily.dart';
import 'package:dodohan/app/widgets/dividers/my_divider.dart';
import 'package:dodohan/app/widgets/dividers/my_divider_2.dart';
import 'package:dodohan/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:dodohan/app/modules/lobby/views/daily/widgets/card_item.dart';
import 'package:dodohan/core/theme/buttons.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../routes/app_routes.dart';

class DailyView extends GetView<DailyController> {
  const DailyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('두명의 이성 중\n나의 이상형을 ', style: ThemeFonts.bold.getTextStyle(size: 24)),
                Text('PICK', style: ThemeFonts.bold.getTextStyle(size: 24, color: ThemeColors.main)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('학교, 이상형 정보와 상관없이\n매일 프로필 카드를 추천해드려요!', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.grayText)),
                GestureDetector(
                  onTap: () => Get.dialog(const HowToUseDailyDialog()),
                  child: Row(
                    children: [
                      Text('이용 방법', style: ThemeFonts.medium.getTextStyle(color: ThemeColors.main)),
                      const Icon(Icons.arrow_forward_ios_rounded, color: ThemeColors.main, size: 12,)
                    ],
                  ).paddingOnly(bottom: 3),
                )
              ],
            ),
            ElevatedButton(
                style: BtStyle.outlined,
                onPressed: () => Get.toNamed(Routes.currentCard),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('내 카드', style: ThemeFonts.medium.getTextStyle(size: 18, color: ThemeColors.blackTextLight)),
                    const Icon(Icons.arrow_forward_ios_rounded, color: ThemeColors.blackTextLight, size: 16,)
                  ],
                )).paddingOnly(top: 24, bottom: 16),
            if (controller.isLoading.value) _progressIndicator(),
            if (!controller.isLoading.value && controller.todayCards.isEmpty) _noCardText(),
            if (controller.todayCards.isNotEmpty)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.todayCards.length ~/ 2,
                itemBuilder: (context, index) => _set(index * 2 + 0, index * 2 + 1),
              ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }

  Widget _progressIndicator() => Container(
        alignment: Alignment.center,
        height: (Get.width - 64) / 2 * 1.4 + 8,
        child: DefaultTextStyle(
          style: ThemeFonts.medium.getTextStyle(size: 18),
          child: AnimatedTextKit(
            animatedTexts: [WavyAnimatedText('···')],
            isRepeatingAnimation: true,
            repeatForever: true,
          ),
        ),
      );

  Widget _noCardText() => Container(
        alignment: Alignment.center,
        height: (Get.width - 64) / 2 * 1.4 + 8,
        child: Text(
          "홈의 '나' 프로필을 완성해주세요 (필수)\n유효한 상대방이 있는 경우 매일 밤 12시에 제공됩니다",
          style: ThemeFonts.regular.getTextStyle(color: ThemeColors.grayText, size: 14),
          textAlign: TextAlign.center,
        ),
      );

  Widget _set(int index1, int index2) => Obx(
    () => Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-0.84, -0.54),
            end: const Alignment(0.84, 0.54),
            colors: controller.todayCards[index1].hasPicked || controller.todayCards[index2].hasPicked
                    ? [ThemeColors.cream, ThemeColors.cream]
                    : [const Color(0xFFFFF1F0), const Color(0xFFF2EAFF)],
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('오늘의 카드 1', style: ThemeFonts.bold.getTextStyle(size: 20, color: ThemeColors.blackTextLight)).paddingOnly(left: 4, top: 2, bottom: 18),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardItem(index: index1),
                    const SizedBox(width: 8),
                    CardItem(index: index2),
                  ],
                ),
                Center(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: controller.todayCards[index1].hasPicked || controller.todayCards[index2].hasPicked
                          ? ThemeColors.grayTextLight
                          : ThemeColors.main,
                      shape: const OvalBorder(),
                    ),
                    child: Center(
                      child: Text('OR', style: ThemeFonts.bold.getTextStyle(size: 12, color: ThemeColors.white)),
                    ),
                  ),
                )
              ],
            ),
          ],
        )).paddingOnly(bottom: 8, top: 8),
  );
}
