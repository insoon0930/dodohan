import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:dodohan/app/modules/lobby/views/daily/widgets/updating_view.dart';
import 'package:dodohan/app/modules/lobby/views/home/home_view.dart';
import 'package:dodohan/core/services/auth_service.dart';
import '../../widgets/appbars/home_appbar.dart';
import '../../widgets/my_bottom_navigation_bar.dart';
import 'lobby_controller.dart';
import 'views/daily/daily_view.dart';

class LobbyPage extends GetView<LobbyController> {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LobbyAppBar(),
        body: Obx(
          () => LazyLoadIndexedStack(
              index: controller.selectedTabIndex.value,
              children: const [
                HomeView(),
                DailyView()
              ]),
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => controller.selectedTabIndex.value == 0
              ? controller.showHowToUseWeekly()
              : controller.showHowToUseDaily(),
          mini: true,
          elevation: 3,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(46.0))),
          child: const Icon(Icons.question_mark, color: Colors.white)),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
