import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/home/widgets/me_info_selector.dart';
import '../../../core/theme/paddings.dart';
import '../../data/utils.dart';
import 'me_info_controller.dart';

class MeInfoPage extends GetView<MeInfoController> {
  const MeInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _meInfoList(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _meInfoList() => Center(
    child: SizedBox(
      width: Get.width - ThemePaddings.mainPadding * 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            MeInfoSelector('학과', Utils.major),
            const Divider(height: 1),
            MeInfoSelector('키', Utils.height),
            const Divider(height: 1),
            MeInfoSelector('나이', Utils.age),
            const Divider(height: 1),
            MeInfoSelector('체형', controller.user.isMan
                        ? Utils.bodyShapeForMan
                        : Utils.bodyShapeForWoman),
            const Divider(height: 1),
            MeInfoSelector('흡연', Utils.smoke),
          ],
        ),
      ),
    ),
  );
}
