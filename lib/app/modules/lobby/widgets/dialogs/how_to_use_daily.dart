import 'package:carousel_slider/carousel_slider.dart';
import 'package:dodohan/core/theme/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';

class HowToUseDailyDialog extends StatefulWidget {
  const HowToUseDailyDialog({Key? key}) : super(key: key);

  @override
  State<HowToUseDailyDialog> createState() => _HowToUseDailyDialogState();
}

class _HowToUseDailyDialogState extends State<HowToUseDailyDialog> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding:
        const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(33)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('오늘의 카드 이용 방법', style: ThemeFonts.bold.getTextStyle(size: 20)),
            const SizedBox(height: 20),
            CarouselSlider(
              items: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset('assets/info_second_page_1.png', width: 240),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/number_1.svg'),
                        const SizedBox(width: 6),
                        Text('추천받은 이성카드 중 선택한\n한명의 이성에게 내 프로필이 전달돼요', style: ThemeFonts.medium.getTextStyle(size: 14)),
                      ],
                    ),
                    const Spacer(),
                    Text('안심하세요!\n내 사진은 블러처리 되어 전달돼요', style: ThemeFonts.medium.getTextStyle(size: 12, color: ThemeColors.skyBlueDark), textAlign: TextAlign.center)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Image.asset('assets/info_second_page_2.png', width: 100),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/number_2.svg').paddingOnly(top: 1),
                            const SizedBox(height: 6),
                            Text('상대방이 내 프로필을\n수락하면 서로의\n사진이 공개돼요', style: ThemeFonts.medium.getTextStyle(size: 14))
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset('assets/number_2.svg').paddingOnly(top: 1),
                            const SizedBox(height: 6),
                            Text('최종매칭이 되면\n전화번호가 공개돼요', style: ThemeFonts.medium.getTextStyle(size: 14), textAlign: TextAlign.right),
                            const SizedBox(height: 6),
                            Text('매칭참여 또는\n거절의사 표현만 해도\n보상이 주어져요!', style: ThemeFonts.medium.getTextStyle(size: 12, color: ThemeColors.skyBlueDark), textAlign: TextAlign.right)
                          ],
                        ),
                        const Spacer(),
                        Image.asset('assets/info_second_page_3.png', width: 110),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ],
              options: CarouselOptions(
                  aspectRatio: 0.9,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() => _current = index);
                  }),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/info_second_page_1.png'),
                Image.asset('assets/info_second_page_2.png'),
              ].asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => {}, // 필요한 경우 페이지를 변경하는 로직 추가
                  child: Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColors.main
                            .withOpacity(_current == entry.key ? 0.9 : 0.3)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: BtStyle.standard(),
                onPressed: () => Get.back(),
                child: Text('확인', style: ThemeFonts.medium.getTextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}