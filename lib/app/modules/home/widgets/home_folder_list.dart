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
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HomeFolderListItem('학과'),
              Divider(height: 1),
              HomeFolderListItem('성별'),
              Divider(height: 1),
              HomeFolderListItem('키'),
              Divider(height: 1),
              HomeFolderListItem('나이'),
              Divider(height: 1),
              HomeFolderListItem('체형'),
              Divider(height: 1),
              HomeFolderListItem('흡연'),
            ],
          ),
        ),
      ),
    );
  }

}
