import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../data/model/me_info.dart';
import '../../../../../../data/model/self_introduction.dart';
import '../../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../../widgets/image/image_view_box.dart';
import '../self_introduction_item_controller.dart';

class CheckOppositeProfilePage extends GetView<SelfIntroductionItemController> {
  const CheckOppositeProfilePage({Key? key}) : super(key: key);

  SelfIntroduction get selfIntroduction => controller.selfIntroduction.value;
  MeInfo get meInfo => selfIntroduction.meInfo!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('상대방 프로필'),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageViewBox(url: selfIntroduction.profileImage, width: Get.width, height: Get.width),
                    //todo 내가 isOwner 아니면서 1차 수락이면, 2차 수락 버튼
                    //todo 내가 isOwner 아니면서 2차 수락이면, Owner 폰번호
                    //todo 내가 isOwner 이면서 1차 수락이면, 대기중 버튼
                    //todo 내가 isOwner 이면서 2차 수락이면, applicant 폰번호
                    const SizedBox(height: 16),
                    _infoForm('학교', meInfo.univ!),
                    const Divider(),
                    _infoForm('키', '${meInfo.height}cm'),
                    const Divider(),
                    _infoForm('나이', '${meInfo.age}살'),
                    const Divider(),
                    _infoForm('체형', meInfo.bodyShape ?? ''),
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
