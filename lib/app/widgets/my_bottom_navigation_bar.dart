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
      height: GetPlatform.isAndroid ? 65 : 83,
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: controller.selectedTabIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: ThemeFonts.regular.getTextStyle(),
          unselectedLabelStyle: ThemeFonts.regular.getTextStyle(size: 15),
          // type: BottomNavigationBarType.fixed,
          backgroundColor: ThemeColors.main,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 0), label: '교내 소개팅'),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 0), label: '오늘의 카드'),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 0), label: '셀프 소개'),
          ],
        ),
      ),
    ));
  }
}
