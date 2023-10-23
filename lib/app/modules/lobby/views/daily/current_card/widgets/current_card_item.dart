import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/app/data/model/daily_card.dart';

import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../widgets/image/image_view_box.dart';
import '../current_card_controller.dart';

class CurrentCardItem extends StatelessWidget {
  final DailyCard dailyCard;

  const CurrentCardItem({super.key, required this.dailyCard});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0))),
      elevation: 3,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                        ImageViewBox(
                        url: dailyCard.youProfileImage,
                        borderRadius: 8,
                        width: (Get.width - 64) / 3 - 4,
                        height: (Get.width - 64) / 3 - 4,
                        isBlurred: true),
                      ],
                ),
                const Spacer(),
                Text('${dailyCard.youInfo!.univ}', style: ThemeFonts.medium.getTextStyle()),
                const Spacer(),
              ],
            ),
          ),
          if (dailyCard.meStatus == CardStatus.unChecked)
            _cardCover(),
          if (dailyCard.meStatus != CardStatus.unChecked || dailyCard.meStatus != CardStatus.checked)
            Positioned(top: 8, right: 8, child: _tag()),
        ],
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

  //todo 1차 성사, 1차 실패, 최종 성사, 최종 실패, 대기중, (내가 선택 안함)
  Widget _tag() {
    Color color;
    String text;
    if(dailyCard.youStatus == CardStatus.confirmed1st) {
     color = ThemeColors.blueLight.withOpacity(0.9);
     text = '1차 수락';
    } else if(dailyCard.youStatus == CardStatus.rejected1st) {
      color = ThemeColors.redLight.withOpacity(0.9);
      text = '1차 거절';
    } else if(dailyCard.youStatus == CardStatus.confirmed2nd) {
      color = ThemeColors.blueLight.withOpacity(0.9);
      text = '매칭 성공';
    } else if(dailyCard.youStatus == CardStatus.rejected2nd) {
      color = ThemeColors.redLight.withOpacity(0.9);
      text = '매칭 실패';
    } else {
      return Container();
    }
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(text,
          style: ThemeFonts.medium.getTextStyle(color: Colors.white, size: 10),
          textAlign: TextAlign.center)
          .paddingSymmetric(horizontal: 7, vertical: 1),
    );
  }
}
