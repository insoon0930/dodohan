import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/app/data/model/daily_card.dart';

import '../../../../../../../core/services/auth_service.dart';
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
                        url: dailyCard.oppositeProfileImage,
                        borderRadius: 8,
                        width: (Get.width - 64) / 3 - 4,
                        height: (Get.width - 64) / 3 - 4,
                        isBlurred: dailyCard.isNotBlurred ? false : true),
                    // if (dailyCard.meStatus != CardStatus.unChecked || dailyCard.meStatus != CardStatus.checked)
                    Positioned(bottom: 4, right: 4, child: _leftDayTag()),
                  ],
                ),
                const Spacer(),
                Text('${dailyCard.yourInfo!.univ}', style: ThemeFonts.medium.getTextStyle()),
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

  //1차 성사, 1차 실패, 최종 성사, 최종 실패, 대기중, (내가 선택 안함)
  Widget _tag() {
    Color color;
    String text;
    //내가 선택안하고 있는 경우 빈칸 보내주자 어떰(내가1confirm인데 상대가 2conf or 2rej 인경우)
    //내가 선택안하고 있는 경우 빈칸 보내주자 어떰(내가unchecked or checked인데 상대가 1conf 인경우)
      //내 상태 판단
    if (dailyCard.myStatus == CardStatus.rejected1st || dailyCard.myStatus == CardStatus.rejected2nd) {
      color = ThemeColors.redLight.withOpacity(0.4);
      text = '거절 완료';
    } else if ((dailyCard.myStatus == CardStatus.unChecked || dailyCard.myStatus == CardStatus.checked) && dailyCard.yourStatus == CardStatus.confirmed1st) {
      return Container();
    } else if (dailyCard.myStatus == CardStatus.confirmed1st && (dailyCard.yourStatus == CardStatus.confirmed2nd || dailyCard.yourStatus == CardStatus.rejected2nd)) {
      return Container();
    } else if (dailyCard.myStatus == CardStatus.confirmed1st &&
        (dailyCard.yourStatus == CardStatus.unChecked || dailyCard.yourStatus == CardStatus.checked)) {
      color = ThemeColors.yellowLight.withOpacity(0.5);
      text = '대기중'; //1차
    } else if (dailyCard.myStatus == CardStatus.confirmed2nd && dailyCard.yourStatus == CardStatus.confirmed1st) {
      color = ThemeColors.yellowLight.withOpacity(0.5);
      text = '대기중'; //2차
      //상대방 상태만 판단
    } else if (dailyCard.yourStatus == CardStatus.confirmed1st) {
      color = ThemeColors.blueLight.withOpacity(0.5);
      text = '1차 수락';
    } else if (dailyCard.yourStatus == CardStatus.rejected1st) {
      color = ThemeColors.redLight.withOpacity(0.5);
      text = '1차 거절';
    } else if (dailyCard.yourStatus == CardStatus.confirmed2nd) {
      color = ThemeColors.main.withOpacity(0.6);
      text = '매칭 성공';
    } else if (dailyCard.yourStatus == CardStatus.rejected2nd) {
      color = ThemeColors.redLight.withOpacity(0.5);
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

  Widget _leftDayTag() {
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(dailyCard.leftDay,
          style: ThemeFonts.medium.getTextStyle(color: Colors.black, size: 10),
          textAlign: TextAlign.center)
          .paddingSymmetric(horizontal: 7, vertical: 1),
    );
  }
}
