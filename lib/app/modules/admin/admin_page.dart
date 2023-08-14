import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/widgets/appbars/default_appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../../core/theme/paddings.dart';
import '../../../routes/app_routes.dart';
import '../../data/enums.dart';
import '../../data/model/identity.dart';
import '../../widgets/image/image_view_box.dart';
import 'admin_controller.dart';

class AdminPage extends GetView<AdminController> {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('관리자'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                Flexible(
                  child: ElevatedButton(
                      style: BtStyle.standard(color: ThemeColors.mainLight),
                      onPressed: () => Get.toNamed(Routes.test),
                      child: Text('테스트', style: ThemeFonts.medium.getTextStyle(color: Colors.white))),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: ElevatedButton(
                      style: BtStyle.standard(color: ThemeColors.main),
                      onPressed: () => Get.toNamed(Routes.profileImageRequest),
                      child: Text('프로필 심사', style: ThemeFonts.medium.getTextStyle(color: Colors.white))),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 16),
            Text('심사', style: ThemeFonts.medium.getTextStyle(size: 17)),
            const SizedBox(height: 8),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.waitingIds.length,
                itemBuilder: (BuildContext context, int index) =>
                    _listIem(controller.waitingIds[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listIem(Identity item) => SizedBox(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => controller.launchDefaultUrl(item.studentIdImage),
                child: ImageViewBox(url: item.studentIdImage)),
            GestureDetector(
                onTap: () => controller.launchDefaultUrl(item.profileImage),
                child: ImageViewBox(url: item.profileImage)),
            Flexible(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => controller.confirm(item),
                      child: const Text('승인')),
                  const SizedBox(height: 10),
                  Text(item.isMan ? '남' : '여', style: ThemeFonts.bold.getTextStyle()),
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
