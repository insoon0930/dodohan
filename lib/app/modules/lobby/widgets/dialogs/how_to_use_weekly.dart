import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/services/auth_service.dart';
import '../../../../../core/theme/buttons.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../data/info_data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HowToUseWeeklyDialog extends StatefulWidget {
  const HowToUseWeeklyDialog({Key? key}) : super(key: key);

  @override
  State<HowToUseWeeklyDialog> createState() => _HowToUseWeeklyDialogState();
}

class _HowToUseWeeklyDialogState extends State<HowToUseWeeklyDialog> {
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
            Text('교내 소개팅 이용 방법', style: ThemeFonts.bold.getTextStyle(size: 20)),
            const SizedBox(height: 12),
            Text('인증된 동일 캠퍼스생 대상으로 서로의\n이상형 정보에 맞는 1:1 소개팅이 매주 진행돼요',
                style: ThemeFonts.medium
                    .getTextStyle(size: 14, color: ThemeColors.grayTextLight),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Container(
              // color: Colors.red,
              child: CarouselSlider(
                items: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/info_first_page_1.svg', width: 210),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/number_1.svg',),
                          const SizedBox(width: 6),
                          Text('내 프로필과 이상형을 설정해주세요', style: ThemeFonts.medium.getTextStyle(size: 14))
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/info_first_page_2.png', width: 210),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/number_2.svg').paddingOnly(top: 1),
                          const SizedBox(width: 6),
                          Text('교내 소개팅 신청 후\n매주 금요일 결과를 확인하세요!', style: ThemeFonts.medium.getTextStyle(size: 14))
                        ],
                      )
                    ],
                  ),
                ],
                options: CarouselOptions(
                    aspectRatio: 1.05,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() => _current = index);
                    }),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/info_first_page_1.svg'),
                SvgPicture.asset('assets/info_first_page_2.svg'),
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
