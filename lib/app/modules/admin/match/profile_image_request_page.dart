import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/widgets/appbars/default_appbar.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/model/image_update_request.dart';
import '../../../widgets/image/image_view_box.dart';
import 'profile_image_request_controller.dart';

class MatchPage extends GetView<MatchController> {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('프로필 이미지 심사'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
                  () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.waitingRequests.length,
                itemBuilder: (BuildContext context, int index) =>
                    _listIem(controller.waitingRequests[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listIem(ImageUpdateRequest item) => SizedBox(
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            ImageViewBox(url: item.preProfileImage),
            Text('기존', style: ThemeFonts.medium.getTextStyle())
              ],
        ),
        Column(
          children: [
            ImageViewBox(url: item.newProfileImage),
            Text('신청', style: ThemeFonts.medium.getTextStyle())
          ],
        ),
        Flexible(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => controller.confirm(item),
                  child: const Text('승인')),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => controller.reject(item),
                  child: const Text('거절')),
            ],
          ),
        ),
      ],
    ),
  );
}
