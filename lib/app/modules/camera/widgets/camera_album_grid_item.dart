import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../routes/app_routes.dart';
import '../../album/album_page.dart';
import '../../navigation/navigation_controller.dart';

class CameraAlbumGridItem extends GetView<NavigationController> {
  final AssetEntity picture;
  const CameraAlbumGridItem(this.picture, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.tabIndex.value = 1,
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1)),
            color: Color(0xff273D60),
          ),
          child: AssetEntityImage(
            picture,
            isOriginal: false, // Defaults to `true`.
            thumbnailSize: const ThumbnailSize.square(200), // Preferred value.
            thumbnailFormat: ThumbnailFormat.jpeg, // Defaults to `jpeg`.
            fit: BoxFit.fill,
          )),
    );
  }
}
