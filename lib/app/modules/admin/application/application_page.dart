import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/widgets/appbars/default_appbar.dart';
import '../../../../core/theme/fonts.dart';
import '../../../widgets/image/image_view_box.dart';
import 'application_controller.dart';
import '../../../data/model/match.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('매치'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
                  () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.matchProfiles.length,
                itemBuilder: (BuildContext context, int index) => _listIem(controller.matchProfiles[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listIem(Map<String, String> item) => SizedBox(
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ImageViewBox(url: item['man']!),
        ImageViewBox(url: item['woman']!),
      ],
    ),
  );
}
