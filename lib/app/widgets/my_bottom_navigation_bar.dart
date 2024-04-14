import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/lobby_controller.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';

class MyBottomNavigationBar extends GetView<LobbyController> {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: GetPlatform.isAndroid ? 65 : 90,
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: controller.selectedTabIndex.value,
          onTap: controller.changeIndex,
          elevation: 5,
          // selectedItemColor: ThemeColors.main,
          // unselectedItemColor: ThemeColors.bottomNavigationBar,
          selectedLabelStyle: ThemeFonts.regular.getTextStyle(size: 11, color: ThemeColors.main),
          unselectedLabelStyle: ThemeFonts.regular.getTextStyle(size: 11, color: ThemeColors.bottomNavigationBar),
          type: BottomNavigationBarType.fixed,
          backgroundColor: ThemeColors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/bottom_navigation_1.svg', color: controller.selectedTabIndex.value == 0 ? ThemeColors.main : ThemeColors.bottomNavigationBar).paddingOnly(bottom: 6), label: '교내 소개팅'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/bottom_navigation_2.svg', color: controller.selectedTabIndex.value == 1 ? ThemeColors.main : ThemeColors.bottomNavigationBar).paddingOnly(bottom: 6), label: '오늘의 카드'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/bottom_navigation_3.svg', color: controller.selectedTabIndex.value == 2 ? ThemeColors.main : ThemeColors.bottomNavigationBar).paddingOnly(bottom: 6), label: '셀프 소개'),
          ],
        ),
      ),
    ));
  }
}
