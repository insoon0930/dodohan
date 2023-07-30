import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/theme/fonts.dart';
import '../../modules/navigation/navigation_controller.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {

  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
          onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
      title: Text('나', style: ThemeFonts.bold.getTextStyle(size: 17)),
      // actions: [Text('완료', style: ThemeFonts.medium.getTextStyle(size: 17)).paddingOnly(right: 16)],
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
