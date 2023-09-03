import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/lobby/lobby_controller.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';

class MyBottomNavigationBar extends GetView<LobbyController> {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: controller.selectedTabIndex.value,
      onTap: controller.changeIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      selectedLabelStyle: ThemeFonts.regular.getTextStyle(),
      unselectedLabelStyle: ThemeFonts.regular.getTextStyle(size: 15),
      // type: BottomNavigationBarType.fixed,
      backgroundColor: ThemeColors.main,
      // Bar에 보여질 요소. icon과 label로 구성.
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 0), label: '두두한'),
        BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 0), label: '오늘의 카드'),
      ],
    ));
  }
}
