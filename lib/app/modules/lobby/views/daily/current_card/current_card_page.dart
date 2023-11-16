import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/current_card/widgets/current_card_item.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../data/model/daily_card.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/dividers/divider_with_text.dart';
import 'current_card_controller.dart';

class CurrentCardPage extends GetView<CurrentCardController> {
  const CurrentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('오늘의 카드'),
      body: Obx(
        () => Stack(
          children: [
            if (!controller.loading.value)
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        const DividerWithText('보낸 신청').paddingOnly(top: 4, bottom: 8),
                        if (controller.sentCards.isEmpty)
                          Text(
                            '보낸 신청이 없습니다',
                            style: ThemeFonts.regular.getTextStyle(color: ThemeColors.greyText, size: 14),
                          ).paddingOnly(top: 58, bottom: 50),
                        _gridView(controller.sentCards),
                      ],
                    ),
                    Column(
                      children: [
                        const DividerWithText('받은 신청').paddingOnly(top: 12, bottom: 8),
                        if (controller.receivedCards.isEmpty)
                          Text(
                            '받은 신청이 없습니다',
                            style: ThemeFonts.regular.getTextStyle(color: ThemeColors.greyText, size: 14),
                          ).paddingOnly(top: 58, bottom: 50),
                        _gridView(controller.receivedCards),
                      ],
                    ),
                  ],
                ).paddingAll(16),
              ),
            if (controller.loading.value)
              const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: ThemeColors.main,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _gridView(List<DailyCard> cardList) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: cardList.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () => controller.tapCard(index, cardList[index]),
            child: CurrentCardItem(dailyCard: cardList[index])),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 0.8,
        ),
      );
}
