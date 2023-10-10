import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/dto/admin_application.dart';
import 'package:dodohan/app/widgets/appbars/default_appbar.dart';
import '../../../widgets/image/image_view_box.dart';
import 'application_controller.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('이번주 신청'),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('신청한 여성 수: ${controller.applications.length}'),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.applications.length,
                itemBuilder: (BuildContext context, int index) => _listIem(controller.applications[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listIem(AdminApplication item) => SizedBox(
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ImageViewBox(url: item.profileImage),
        Expanded(
          child: Column(
            children: [
              const Text('ME'),
              Text('${item.application.meInfo!.user}'),
              Text('${item.application.meInfo!.age}'),
              Text('${item.application.meInfo!.height}'),
              Text('${item.application.meInfo!.major}'),
              Text('${item.application.meInfo!.isSmoker}'),
              Text('${item.application.meInfo!.bodyShape}'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text('YOU'),
              Text('${item.application.youInfo!.minAge}'),
              Text('${item.application.youInfo!.maxAge}'),
              Text('${item.application.youInfo!.minHeight}'),
              Text('${item.application.youInfo!.maxHeight}'),
              Text('${item.application.youInfo!.exceptSameMajor}'),
              Text('${item.application.youInfo!.isSmoker}'),
              Text('${item.application.youInfo!.bodyShape}'),
            ],
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 4),
  );
}
