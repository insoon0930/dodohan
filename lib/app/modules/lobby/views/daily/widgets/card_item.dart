import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/enums.dart';
import 'package:stamp_now/app/data/model/daily_card.dart';

import '../../../../../../core/theme/colors.dart';
import '../../../../../widgets/image/image_view_box.dart';
import '../daily_controller.dart';

class CardItem extends GetView<DailyController> {
  int index;

  CardItem({required this.index, Key? key}) : super(key: key);

  DailyCard get dailyCard => controller.todayCards[index];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.tapCard(index, dailyCard),
      child: Card(
        margin: const EdgeInsets.all(4.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        elevation: 3,
        child: Obx(
          () => Stack(
            children: [
              Container(
                width: (Get.width - 64) / 2,
                height: (Get.width - 64) / 2 * 1.4,
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageViewBox(
                        url: dailyCard.youProfileImage,
                        width: (Get.width - 64) / 2 - 8,
                        height: (Get.width - 64) / 2 - 8,
                        isBlurred: true),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('${dailyCard.youInfo!.height}cm'),
                        Text('${dailyCard.youInfo!.age}살'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(dailyCard.youInfo!.bodyShape!),
                        Text(dailyCard.youInfo!.isSmoker! ? '흡연' : '비흡연'),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              if (controller.todayCards[index].meStatus ==
                  MatchStatus.unChecked)
                _cardCover(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardCover() => Positioned.fill(
      child: Card(
          color: ThemeColors.main,
          margin: const EdgeInsets.all(4.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          elevation: 0,
          child: SvgPicture.asset('assets/love.svg',
                  color: ThemeColors.mainLightest)
              .paddingAll((Get.width - 64) / 7)));
}
