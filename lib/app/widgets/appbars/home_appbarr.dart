import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('앨범'),
      elevation: 0,
      actions: [
        SvgPicture.asset('assets/plus.svg'),
        const SizedBox(width: 16),
        SvgPicture.asset('assets/dots.svg'),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
