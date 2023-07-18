import 'package:auto_animated/auto_animated.dart';
import 'package:camera/camera.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/camera/camera_controller.dart';
import 'package:stamp_now/app/modules/camera/widgets/camera_album_grid_item.dart';
import 'package:stamp_now/app/modules/camera/widgets/camera_preview.dart';
import '../../../core/theme/size.dart';
import '../../widgets/appbars/camera_appbar.dart';

class CameraPage extends GetView<CameraPageController> {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DraggableHome(
        // alwaysShowLeadingAndAction: true,
        // alwaysShowTitle: true,
        leading: Container(),
        // leading: GestureDetector(
        //     onTap: () => Get.back(),
        //     child: SvgPicture.asset('assets/go_back.svg')),
        title: const Text('앨범', style: TextStyle(fontSize: 17, height: 1)),
        // title: const Text("Draggable Home"),
        stretchMaxHeight: 0.94,
        headerExpandedHeight: (Get.width +
                ThemeSizes.cameraButtonHeight +
                ThemeSizes.materialAppBarHeight +
                2) / // 2: 혹시 모를 여분..
            (Get.height),
        // headerExpandedHeight: 0.9,
        curvedBodyRadius: 0,
        headerWidget: controller.cameraController.value == null
            ? SizedBox(width: Get.width, height: Get.height,)
            : headerWidget(),
        body: [
          Column(
            children: [
              Container(height: 1,),
              gridView(),
              Container(height: 1,),
            ],
          )
        ],
        fullyStretchable: true,
        // expandedBody: const CameraPreviewScreen(),
        backgroundColor: Colors.white,
        appBarColor: Colors.white,
      ),
    );
  }

  Widget headerWidget() {
    return Scaffold(
        appBar: CameraAppBar(),
        body: Column(
          children: [
            CameraPreviewScreen(controller: controller),
            Expanded(
              child: SizedBox(
                height: ThemeSizes.cameraButtonHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () => controller.flipOnTap(),
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset('assets/camera_flip.svg'),
                          ),
                        )),
                    SvgPicture.asset('assets/camera_shot.svg'),
                    GestureDetector(
                        onTap: () => controller.flashOnTap(),
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset('assets/camera_flash.svg'),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget gridView() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.pictures.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => CameraAlbumGridItem(controller.pictures[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
    );
  }
}