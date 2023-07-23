import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/album/widgets/album_picture_grid.dart';
import '../../widgets/appbars/album_appbar.dart';
import '../../widgets/appbars/home_appbarr.dart';
import 'album_controller.dart';

class AlbumPage extends GetView<AlbumController> {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: AlbumPictureGrid()),
        ],
      ),
    );
  }
}
