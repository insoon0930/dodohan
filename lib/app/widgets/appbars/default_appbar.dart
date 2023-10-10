import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/fonts.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final bool hasLeading;
  final List<Widget>? actions;
  const DefaultAppBar(this.title, {super.key, this.hasLeading = true, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: hasLeading ? GestureDetector(
          onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios_new_rounded, size: 19)) : null,
      title: Text(title, style: ThemeFonts.semiBold.getTextStyle(size: 18)),
      actions: actions,
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
