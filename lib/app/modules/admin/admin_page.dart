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
                const SizedBox(width: 16),
                Flexible(
                  child: ElevatedButton(
                    style: BtStyle.info,
                    onPressed: () => controller.updateYouInfoBodyShapeType(),
                    child: Text('youInfo',
                        style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: ElevatedButton(
                    style: BtStyle.info,
                    onPressed: () => controller.updateApplicationBodyShapeType(),
                    child: Text('application',
                        style: ThemeFonts.medium.getTextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 16),
                Flexible(
                  child: ElevatedButton(
                    style: BtStyle.info,
                    onPressed: () => controller.createManApplicationDummy(),
                    child: Text('남자 신청',
                        style:
                        ThemeFonts.medium.getTextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: ElevatedButton(
                    style: BtStyle.info,
                    onPressed: () => controller.createWomanApplicationDummy(),
                    child: Text('여자 신청',
                        style:
                        ThemeFonts.medium.getTextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16),
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
                    _listIem(controller.waitingIds[index]).paddingSymmetric(horizontal: 16, vertical: 8),
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
            Column(
              children: [
                ElevatedButton(
                    onPressed: () => controller.confirm(item),
                    child: const Text('승인')),
                Text(item.isMan ? '남' : '여', style: ThemeFonts.bold.getTextStyle()).paddingSymmetric(vertical: 32),
                ElevatedButton(
                    onPressed: () => controller.reject(item),
                    child: const Text('거절')),
              ],
            ),
          ],
        ),
      );
}
