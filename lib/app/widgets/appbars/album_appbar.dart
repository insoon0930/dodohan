import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../modules/navigation/navigation_controller.dart';

class AlbumAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final NavigationController navigationController = Get.find();

  AlbumAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22, height: 1)),
      titleSpacing: 0,
      elevation: 0,
      leading: GestureDetector(
          onTap: () => navigationController.tabIndex.value = 0,
          child: SvgPicture.asset('assets/go_back.svg')),
      leadingWidth: 40,
      actions: [
        SvgPicture.asset('assets/album_edit.svg'),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
