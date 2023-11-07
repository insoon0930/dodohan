import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/appbars/default_appbar.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../../routes/app_routes.dart';
import '../../data/model/identity.dart';
import '../../widgets/image/image_view_box.dart';
import 'admin_controller.dart';

class AdminPage extends GetView<AdminController> {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('관리자'),
      body: Column(
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
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 8),
              Flexible(
                child: ElevatedButton(
                    style: BtStyle.standard(color: ThemeColors.main),
                    onPressed: () => Get.toNamed(Routes.womanUser),
                    child: Text('유저', style: ThemeFonts.medium.getTextStyle(color: Colors.white))),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: ElevatedButton(
                    style: BtStyle.standard(color: ThemeColors.main),
                    onPressed: () => Get.toNamed(Routes.match),
                    child: Text('매치', style: ThemeFonts.medium.getTextStyle(color: Colors.white))),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 8),
              Flexible(
                child: ElevatedButton(
                    style: BtStyle.standard(color: ThemeColors.mainLight),
                    onPressed: () => Get.toNamed(Routes.application),
                    child: Text('이번주 신청', style: ThemeFonts.medium.getTextStyle(color: Colors.white))),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 16),
          Text('심사', style: ThemeFonts.medium.getTextStyle(size: 17)),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.waitingIds.length,
                itemBuilder: (BuildContext context, int index) =>
                    _listIem(controller.waitingIds[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listIem(Identity item) => Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: item.isMan
                ? ThemeColors.blueLight.withOpacity(0.1)
                : ThemeColors.redLight.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: item.isMan
                ? ThemeColors.blueLight
                : ThemeColors.redLight)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => controller.openFullImage(item.studentIdImage),
                    child: ImageViewBox(url: item.studentIdImage)),
                GestureDetector(
                    onTap: () => controller.openFullImage(item.profileImage),
                    child: ImageViewBox(url: item.profileImage)),
              ],
            ).paddingOnly(bottom: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => controller.confirm(item),
                    child: const Text('승인')),
                Text(item.univ, style: ThemeFonts.bold.getTextStyle()),
                ElevatedButton(
                    onPressed: () => controller.reject(item),
                    child: const Text('거절')),
              ],
            )
          ],
        ).paddingSymmetric(vertical: 8),
      ).paddingSymmetric(vertical: 8);
}
