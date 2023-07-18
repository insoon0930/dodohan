import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stamp_now/routes/app_routes.dart';

import '../../setting/setting_controller.dart';
import '../navigation_controller.dart';

class MyBottomNavigationBar extends GetView<NavigationController> {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: 113,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
          boxShadow: [
            BoxShadow(
                color: Color(0x1a000000), offset: Offset(0, -2), blurRadius: 12)
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => controller.tabIndex.value = 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/navigation_album.svg'),
                  const Text(
                    '앨범',
                    style: TextStyle(color: Color(0xff273D60), fontSize: 10),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () => Get.toNamed(Routes.camera),
                child: SvgPicture.asset('assets/navigation_camera.svg')),
            GestureDetector(
              onTap: () {
                Get.put(SettingController());
                controller.tabIndex.value = 2;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/navigation_setting.svg'),
                  const Text(
                    '설정',
                    style: TextStyle(color: Color(0xff273D60), fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
