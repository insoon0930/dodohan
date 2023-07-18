import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../album/album_page.dart';
import '../../navigation/navigation_controller.dart';

class AlbumPictureGridItem extends GetView<NavigationController> {
  const AlbumPictureGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => controller.tabIndex.value = 1,
      child: Container(
        // width: Get.width * 0.33,
        // height: Get.width * 0.33,
        color: Colors.purpleAccent,

      ),
    );
  }
}
