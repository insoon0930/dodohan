import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../modules/navigation/navigation_controller.dart';

class CameraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final NavigationController navigationController = Get.find();

  CameraAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('카메라',
          style: TextStyle(fontSize: 17, height: 1)),
      titleSpacing: 0,
      centerTitle: true,
      elevation: 0,
      leading: GestureDetector(
          onTap: () => Get.back(),
          child: SvgPicture.asset('assets/go_back.svg')),
      leadingWidth: 40,
      actions: [
        SvgPicture.asset('assets/check.svg'),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
