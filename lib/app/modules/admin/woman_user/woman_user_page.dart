import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/widgets/appbars/default_appbar.dart';
import '../../../../core/theme/colors.dart';
import '../../../data/model/user.dart';
import '../../../widgets/image/image_view_box.dart';
import 'woman_user_controller.dart';

class WomanUserPage extends GetView<WomanUserController> {
  const WomanUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('유저'),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Text('총 유저 : ${controller.allUserNum}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('남성 : ${controller.manNum}'),
                  Text('여성 : ${controller.womanNum}'),
                  Text('성비 : ${controller.genderRatio}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('탈퇴 남성 : ${controller.deletedManNum}'),
                  Text('탈퇴 여성 : ${controller.deletedWomanNum}'),
                ],
              ),
              Obx(
                    () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.womanUsers.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _listIem(controller.womanUsers[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listIem(User item) => SizedBox(
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(children: [
          ImageViewBox(url: item.profileImage, width: Get.width * 0.5, height: Get.width * 0.5),
          if(item.deletedAt != null)
            Container(color: ThemeColors.redLight.withOpacity(0.3), width: Get.width * 0.5, height: Get.width * 0.5)
        ]),
        Column(
          children: [
            Text('${item.createdAt}'),
            //todo 해당 유저의 meInfo youInfo 들고오기
            // Text('${item.}'),
          ],
        ),
      ],
    ),
  );
}
