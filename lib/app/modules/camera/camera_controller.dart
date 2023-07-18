import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class CameraPageController extends GetxController {
  // final CameraRepository repo;
  // CameraPageController({required this.repo});
  late final Rxn<CameraController> cameraController = Rxn<CameraController>(null);
  late final Future<void> controllerInitializeFuture;
  final RxList<AssetEntity> pictures = <AssetEntity>[].obs;
  final camerasFuture = availableCameras(); // 카메라 목록 가져오기

  @override
  Future<void> onInit() async {
    // 첫 번째 카메라 선택
    camerasFuture.then((cameras) {
      cameraController.value = CameraController(cameras[0], ResolutionPreset.medium);
      controllerInitializeFuture = cameraController.value!.initialize();
      update();
    });

    // 앨범 사진들 가져오기
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(type: RequestType.image);
    AssetPathEntity album = albums[0];
    final int count = await PhotoManager.getAssetCount();
    List<AssetEntity> assets = await album.getAssetListPaged(page: 0, size: count);
    pictures.value = assets;
    super.onInit();
  }

  void handleLifecycleEvent(AppLifecycleState state) {
    // 앱이 포그라운드로 진입할 때, 카메라 재개
    if (state == AppLifecycleState.resumed) {
      controllerInitializeFuture.then((_) {
        cameraController.value!.setFlashMode(FlashMode.off);
        cameraController.value!.setExposureMode(ExposureMode.auto);
        cameraController.value!.setFocusMode(FocusMode.auto);
        cameraController.value!.startImageStream((image) {
          // 이미지 스트림 처리
        });
        cameraController.value!.resumePreview();
      });
    }

    // 앱이 백그라운드로 진입할 때, 카메라 정지
    if (state == AppLifecycleState.paused) {
      cameraController.value!.stopImageStream();
      cameraController.value!.pausePreview();
    }
  }

  double get cameraPreviewAspectRatio {
    if (cameraController.value!.value.isInitialized) {
      return cameraController.value!.value.aspectRatio;
    }
    return 1.0;
  }

  void shutterOnTap() {
    // 카메라 촬영 처리
  }

  Future<void> flipOnTap() async {
    // 현재 사용 중인 카메라의 렌즈 방향을 확인합니다.
    final lensDirection = cameraController.value!.description.lensDirection;
    print('lensDirection: $lensDirection');
    // 다음 카메라 렌즈 방향으로 전환합니다.
    final newDirection = lensDirection == CameraLensDirection.front
        ? CameraLensDirection.back
        : CameraLensDirection.front;

    camerasFuture.then((cameras) {
      cameraController.value = CameraController(cameras[1], ResolutionPreset.medium);
      controllerInitializeFuture = cameraController.value!.initialize();
      update();
    });

    // cameraController.value = CameraController(cameras[1], ResolutionPreset.medium);

    // // cameraController.value!.description.lensDirection = newDirection;
    //
    // // 카메라 전환을 위해 현재 카메라를 dispose 합니다.
    // await cameraController.value!.dispose();
    // // 새로운 카메라를 생성하고 초기화합니다.
    // cameraController.value = CameraController(
    //   // 새로운 렌즈 방향을 사용하여 CameraController를 생성합니다.
    //   CameraDescription(
    //       lensDirection: newDirection, name: 'newCamera', sensorOrientation: 0),
    //   // 카메라 해상도를 설정합니다.
    //   ResolutionPreset.high,
    // );
    //
    // // 카메라를 초기화하고 카메라 미리보기를 시작합니다.
    // await cameraController.value!.initialize();
    // await cameraController.value!.resumePreview();
  }

  void flashOnTap() {
    print('flashOnTap: ${cameraController.value!.value.flashMode}');
    if(cameraController.value!.value.flashMode == FlashMode.off) {
      cameraController.value!.setFlashMode(FlashMode.torch);
    } else {
      cameraController.value!.setFlashMode(FlashMode.off);
    }
  }
}