import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/paddings.dart';
import 'home_folder_list_item.dart';

class HomeFolderList extends StatelessWidget {
  const HomeFolderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width - ThemePaddings.mainPadding * 2,
        child: LiveList.options(
          options: options(),

          // Like ListView.builder, but also includes animation property
          itemBuilder: buildAnimatedItem,

          // Other properties correspond to the
          // `ListView.builder` / `ListView.separated` widget
          itemCount: 5,
        ),
      ),
    );
  }

  // Build animated item (helper for all examples)
  Widget buildAnimatedItem(BuildContext context,
      int index,
      Animation<double> animation,) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: const HomeFolderListItem(),
      ),
    );
  }

  LiveOptions options() {
    return const LiveOptions(
      // // Start animation after (default zero)
      // delay: Duration(seconds: 1),
      //
      // // Show each item through (default 250)
      showItemInterval: Duration(milliseconds: 150),
      //
      // // Animation duration (default 250)
      showItemDuration: Duration(seconds: 1),
      //
      // // Animations starts at 0.05 visible
      // // item fraction in sight (default 0.025)
      visibleFraction: 0.03,
      //
      // // Repeat the animation of the appearance
      // // when scrolling in the opposite direction (default false)
      // // To get the effect as in a showcase for ListView, set true
      // reAnimateOnVisibility: false,
    );
  }
}
