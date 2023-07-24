import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  late final RxInt tabIndex;
  final RxInt appBarIndex = 0.obs;
  final pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    //todo 추후, default 로 카메라 페이지 가기 기능 추가 작업
    tabIndex = 0.obs;
    super.onInit();
  }
}

