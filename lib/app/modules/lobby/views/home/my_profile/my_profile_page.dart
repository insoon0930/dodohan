import 'package:dodohan/app/modules/lobby/views/home/my_profile/my_profile_controller.dart';
import 'package:dodohan/app/widgets/image/image_view_box.dart';
import 'package:dodohan/core/theme/fonts.dart';
import 'package:dodohan/core/utils/time_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/appbars/default_appbar.dart';

class MyProfilePage extends GetView<MyProfileController> {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('내 프로필 보기'),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () => controller.isBlurred.value = !controller.isBlurred.value,
                  child: Stack(alignment: Alignment.center, children: [
                    ImageViewBox(
                        url: controller.meInfoController.user.profileImage,
                        isBlurred: controller.isBlurred.value ? true : false,
                        blurValue: 24,
                        width: Get.width - 32,
                        height: Get.width - 32),
                    if (controller.isBlurred.value)
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('블러 효과 풀린 사진 보기', style: ThemeFonts.medium.getTextStyle(color: Colors.white, size: 14)),
                      ),
                  ]),
                ),
              ),
              const SizedBox(height: 16),
              _infoForm('학교', controller.meInfoController.meInfo.value.univ!),
              const Divider(),
              _infoForm('키', '${controller.meInfoController.meInfo.value.height ?? ''}cm'),
              const Divider(),
              _infoForm('나이',
                  '${controller.meInfoController.meInfo.value.age ?? ''}살 (${TimeUtility.birthYear(age: controller.meInfoController.meInfo.value.age ?? 0)}년생)'),
              const Divider(),
              _infoForm('체형', controller.meInfoController.meInfo.value.bodyShape!),
              const Divider(),
              _infoForm('흡연', controller.meInfoController.meInfo.value.isSmoker! ? '흡연' : '비흡연'),
              const Divider(),
              _infoForm('MBTI', controller.meInfoController.meInfo.value.mbti ?? ''),
              const Divider(),
              _infoForm('간단소개', controller.meInfoController.meInfo.value.introduction ?? ''),
              const Divider(),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }

  Widget _infoForm(String category, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: Get.width * 0.25,
          height: 35,
          alignment: Alignment.centerLeft,
          child: Text(category, style: ThemeFonts.medium.getTextStyle(color: Colors.black45)).paddingOnly(left: 8),
        ),
        Container(
          width: Get.width * 0.65,
          // height: 35,
          alignment: Alignment.centerLeft,
          child: Text(value, style: ThemeFonts.medium.getTextStyle()).paddingOnly(left: 8),
        ),
      ],
    );
  }
}
