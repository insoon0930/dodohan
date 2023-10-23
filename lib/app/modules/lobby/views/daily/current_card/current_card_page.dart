import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/current_card/widgets/current_card_item.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../data/model/daily_card.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import 'current_card_controller.dart';

class CurrentCardPage extends GetView<CurrentCardController> {
  const CurrentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('오늘의 카드'),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _divider('보낸 신청').paddingOnly(top: 4, bottom: 8),
                  if(controller.sentCards.isEmpty)
                    Text('보낸 신청이 없습니다', style: ThemeFonts.regular.getTextStyle(color: ThemeColors.greyText, size: 14)).paddingOnly(top: 8),
                  _gridView(controller.sentCards),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  _divider('받은 신청').paddingOnly(top: 4, bottom: 8),
                  if(controller.sentCards.isEmpty)
                    Text('받은 신청이 없습니다', style: ThemeFonts.regular.getTextStyle(color: ThemeColors.greyText, size: 14)).paddingOnly(top: 8),
                  _gridView(controller.receivedCards),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }

  Widget _gridView(List<DailyCard> cardList) => GridView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    itemCount: cardList.length,
    itemBuilder: (context, index) =>
        GestureDetector(
            onTap: () => controller.tapCard(index, cardList[index]),
            child: CurrentCardItem(dailyCard: cardList[index])),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      childAspectRatio: 0.8,
    ),
  );

  Widget _divider(String text) => Row(
    children: [
      const Expanded(child: Divider()),
      Text(text, style: ThemeFonts.semiBold.getTextStyle()).paddingSymmetric(horizontal: 8),
      const Expanded(child: Divider()),
    ],
  );
}
