import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/lobby/lobby_controller.dart';

class MyBottomNavigationBar extends GetView<LobbyController> {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: controller.selectedTabIndex.value,
      onTap: controller.changeIndex,
      selectedItemColor: context.theme.colorScheme.onBackground,
      unselectedItemColor: context.theme.colorScheme.onSurfaceVariant,
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      selectedLabelStyle: const TextStyle(fontSize: 10),
      // type: BottomNavigationBarType.fixed,
      backgroundColor: context.theme.colorScheme.background,
      // Bar에 보여질 요소. icon과 label로 구성.
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Daily'),
      ],
    ));
  }
}
