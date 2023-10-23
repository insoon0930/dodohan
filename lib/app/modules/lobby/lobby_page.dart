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
              children: [
                const HomeView(),
                if(AuthService.to.isAdmin)
                  const DailyView()
                else
                  const DailyUpdatingView(),
              ]),
        ),
        // body: Obx(() => tabPages[controller.selectedTabIndex.value]),
        //todo 개발시, 다시 열기
        bottomNavigationBar: AuthService.to.isAdmin ? const MyBottomNavigationBar() : null,
    );
  }
}
