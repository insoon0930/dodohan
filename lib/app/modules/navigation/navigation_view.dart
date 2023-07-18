import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/album/album_page.dart';
import 'package:stamp_now/app/modules/home/home_page.dart';
import 'package:stamp_now/app/modules/setting/setting_page.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/appbars/album_appbar.dart';
import '../../widgets/appbars/home_appbarr.dart';
import '../../widgets/appbars/setting_appbar.dart';
import 'navigation_controller.dart';
import 'widgets/lazy_indexed_stack.dart';
import 'widgets/my_bottom_navigation_bar.dart';

enum AppBarType { home, album }

const mainAppBarList = [AppBarType.home, AppBarType.album];

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: [
          HomeAppBar() as PreferredSizeWidget,
          AlbumAppBar(title: '유럽 여행 기록') as PreferredSizeWidget,
          SettingAppBar() as PreferredSizeWidget,
        ][controller.tabIndex.value],
        body: LazyIndexedStack(
          index: controller.tabIndex.value,
          children: const [
            HomePage(),
            AlbumPage(),
            SettingPage(),
            // Navigator(
            //   onGenerateRoute: (settings) {
            //     Widget page = const HomePage();
            //     print('settings.name: ${settings.name}');
            //     if (settings.name == 'album') page = const AlbumPage();
            //     return MaterialPageRoute(builder: (_) => page);
            //   },
            // ),
          ],
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
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