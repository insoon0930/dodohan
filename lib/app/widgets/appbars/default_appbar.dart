import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/fonts.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  const DefaultAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
          onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
      title: Text(title, style: ThemeFonts.bold.getTextStyle(size: 17)),
      // actions: [Text('완료', style: ThemeFonts.medium.getTextStyle(size: 17)).paddingOnly(right: 16)],
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
