import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/me_info/widgets/me_info_selector.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/fonts.dart';
import '../../../core/theme/paddings.dart';
import '../../data/utils.dart';
import '../../widgets/appbars/setting_appbar.dart';
import 'me_info_controller.dart';

class MeInfoPage extends GetView<MeInfoController> {
  const MeInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _meInfoList(),
            const SizedBox(height: 10),
            ElevatedButton(
              style: BtStyle.standard,
              onPressed: () => controller.updateMeInfo(),
              child: Center(
                child: Text('저장',
                    style:
                    ThemeFonts.medium.getTextStyle(color: Colors.white)),
              ),
            ).paddingSymmetric(horizontal: 16)
          ],
        ),
      ),
    );
  }

  Widget _meInfoList() => Center(
        child: SizedBox(
          width: Get.width - ThemePaddings.mainPadding * 2,
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  MeInfoSelector(
                      title: '학과',
                      placeholder: controller.meInfo.value.major,
                      list: Utils.major,
                      changedCallback: (selected) =>
                          controller.meInfo.value.major = selected.value),
                  const Divider(height: 1),
                  MeInfoSelector(
                      title: '키',
                      placeholder: '${controller.meInfo.value.height}',
                      list: Utils.height,
                      changedCallback: (selected) => controller
                          .meInfo.value.height = int.parse('${selected.value}')),
                  const Divider(height: 1),
                  MeInfoSelector(
                      title: '나이',
                      placeholder: '${controller.meInfo.value.age}',
                      list: Utils.age,
                      changedCallback: (selected) => controller.meInfo.value.age =
                          int.parse('${selected.value ?? 0}')),
                  const Divider(height: 1),
                  MeInfoSelector(
                      title: '체형',
                      placeholder: controller.meInfo.value.bodyShape,
                      list: controller.user.isMan!
                          ? Utils.meBodyShapeForMan
                          : Utils.meBodyShapeForWoman,
                      changedCallback: (selected) =>
                      controller.meInfo.value.bodyShape = selected.value),
                  const Divider(height: 1),
                  MeInfoSelector(
                      title: '흡연',
                      placeholder: '${controller.meInfo.value.isSmoker}',
                      list: Utils.meSmoke,
                      changedCallback: (selected) => controller.meInfo.value
                          .isSmoker = selected.value == 'true' ? true : false),
                ],
              ),
            ),
          ),
        ),
      );
}
