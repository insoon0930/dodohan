import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
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
        ImageViewBox(url: item.studentIdImage),
        ImageViewBox(url: item.profileImage),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () => controller.confirm(item), child: const Text('승인')),
            SizedBox(height: Get.width * 0.1),
            ElevatedButton(onPressed: () => controller.reject(item), child: const Text('거절')),
          ],
        ),
      ],
    ),
  );

}
