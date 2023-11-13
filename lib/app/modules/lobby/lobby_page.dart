import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_view.dart';
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
                DailyView(),
                SelfIntroductionView(),
              ]),
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => controller.selectedTabIndex.value == 0
              ? controller.showHowToUseWeekly()
              : controller.selectedTabIndex.value == 1
                  ? controller.showHowToUseDaily()
                  : controller.showHowToUseSelfIntroductionDialog(),
          mini: true,
          elevation: 3,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(46.0))),
          child: const Icon(Icons.question_mark, color: Colors.white)),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
