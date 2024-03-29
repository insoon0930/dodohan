import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_view.dart';
import 'package:dodohan/app/modules/lobby/widgets/dialogs/how_to_use_self_introduction.dart';
import 'package:dodohan/app/modules/lobby/widgets/expandable_fab.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:dodohan/app/modules/lobby/views/home/home_view.dart';
import '../../../core/theme/fonts.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/appbars/home_appbar.dart';
import '../../widgets/my_bottom_navigation_bar.dart';
import 'lobby_controller.dart';
import 'views/daily/daily_view.dart';

class LobbyPage extends GetView<LobbyController> {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isFirstPage ? ThemeColors.background : null,
        appBar: LobbyAppBar(),
        body: LazyLoadIndexedStack(index: controller.selectedTabIndex.value, children: [
          HomeView(),
          const DailyView(),
          const SelfIntroductionView(),
        ]),
        floatingActionButton: (controller.selectedTabIndex.value == 2) ? ExpandableFab(
          distance: 112,
          children: [
            ActionButton(
              onPressed: () => controller.goToCreateSelfIntroduction(),
              icon: const Icon(Icons.create),
            ),
            ActionButton(
              onPressed: () => Get.toNamed(Routes.mySelfIntroduction),
              icon: Text('MY', style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
            ),
            ActionButton(
              onPressed: () => Get.dialog(const HowToUseSelfIntroductionDialog()),
              icon: const Icon(Icons.question_mark),
            ),
          ],
        ) : Container(),
        // floatingActionButton: (controller.selectedTabIndex.value == 0 || controller.selectedTabIndex.value == 1)
        //     ? FloatingActionButton(
        //         onPressed: () => controller.fabTapped(),
        //         mini: true,
        //         elevation: 3,
        //         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(46.0))),
        //         child: const Icon(Icons.question_mark, color: Colors.white)).paddingOnly(bottom: controller.selectedTabIndex.value == 1 && controller.user.hasFourDailyCards ? 60 : 0)
        //     : ExpandableFab(
        //         distance: 112,
        //         children: [
        //           ActionButton(
        //             onPressed: () => controller.goToCreateSelfIntroduction(),
        //             icon: const Icon(Icons.create),
        //           ),
        //           ActionButton(
        //             onPressed: () => Get.toNamed(Routes.mySelfIntroduction),
        //             icon: Text('MY', style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
        //           ),
        //           ActionButton(
        //             onPressed: () => Get.dialog(const HowToUseSelfIntroductionDialog()),
        //             icon: const Icon(Icons.question_mark),
        //           ),
        //         ],
        //       ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
