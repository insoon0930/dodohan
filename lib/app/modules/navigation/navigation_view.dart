import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/album/album_page.dart';
import 'package:stamp_now/app/modules/setting/setting_page.dart';
import '../../widgets/appbars/album_appbar.dart';
import '../../widgets/appbars/home_appbarr.dart';
import '../../widgets/appbars/setting_appbar.dart';
import '../me_info/me_info_page.dart';
import 'navigation_controller.dart';
import 'widgets/lazy_indexed_stack.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: [
          const HomeAppBar() as PreferredSizeWidget,
          AlbumAppBar(title: '유럽 여행 기록') as PreferredSizeWidget,
          SettingAppBar() as PreferredSizeWidget,
        ][controller.tabIndex.value],
        body: LazyIndexedStack(
          index: controller.tabIndex.value,
          children: const [
            MeInfoPage(),
            AlbumPage(),
            SettingPage(),
          ],
        ),
        // bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;

  SlidePageRoute({required this.child})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return child;
    },
    transitionsBuilder:
        (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}