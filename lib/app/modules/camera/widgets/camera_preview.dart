import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/camera/camera_controller.dart';

class CameraPreviewScreen extends StatelessWidget {
  final CameraPageController controller;
  const CameraPreviewScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller.controllerInitializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Future가 완료된 경우, 화면에 표시될 위젯 반환
          return Obx(() {
            //todo 이거 처리를 obs 로 해주면 될 듯 ㅇㅇ
            // if (controller.cameraController.value. == false) {
            //   return const Center(child: CircularProgressIndicator());
            // }
            // if (!controller.controllerInitializeFuture. == null) {
            //   return const Center(child: CircularProgressIndicator());
            // }

            // final size = MediaQuery.of(context).size;
            // final deviceRatio = size.width / size.height;
            // final previewRatio = controller.cameraPreviewAspectRatio;
            // final scale = deviceRatio / previewRatio;

            return AspectRatio(
              aspectRatio: controller.cameraPreviewAspectRatio,
              child: CameraPreview(controller.cameraController!.value!),
            );
          });
        } else {
          // Future가 아직 완료되지 않은 경우, 로딩 표시
          return CircularProgressIndicator();
        }
      },
    );
  }
}
