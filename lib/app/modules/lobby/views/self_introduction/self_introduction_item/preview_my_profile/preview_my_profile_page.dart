
import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_item/preview_my_profile/preview_my_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/services/auth_service.dart';
import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../data/model/me_info.dart';
import '../../../../../../data/model/user.dart';
import '../../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../../widgets/dividers/my_divider_2.dart';
import '../../../../../../widgets/image/image_view_box.dart';

class PreviewMyProfilePage extends GetView<PreviewMyProfileController> {
  const PreviewMyProfilePage({Key? key}) : super(key: key);
  User get user => AuthService.to.user.value;
  MeInfo get meInfo => controller.meInfo.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('내 프로필 미리 보기'),
      body: Obx(
            () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageViewBox(url: user.profileImage, width: Get.width, height: Get.width),
                    const SizedBox(height: 16),
                    _infoForm('학교', user.univ),
                    const Divider(),
                    _infoForm('키', '${meInfo.height}cm'),
                    const Divider(),
                    _infoForm('나이', '${meInfo.age}살'),
                    const Divider(),
                    _infoForm('체형', meInfo.bodyShape??''),
                    const Divider(),
                    _infoForm('흡연', meInfo.isSmoker ?? false ? '흡연' : '비흡연'),
                    const Divider(),
                    _infoForm('MBTI', ''),
                    const Divider(),
                    _infoForm('소개', ''),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
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
          height: 35,
          alignment: Alignment.centerLeft,
          child: Text(value, style: ThemeFonts.medium.getTextStyle()).paddingOnly(left: 8),
        ),
      ],
    );
  }
}
