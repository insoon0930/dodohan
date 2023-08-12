import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/fonts.dart';
import '../../../core/theme/paddings.dart';
import '../../data/info_data.dart';
import '../../widgets/appbars/default_appbar.dart';
import '../../widgets/info_selector.dart';
import 'you_info_controller.dart';

class YouInfoPage extends GetView<YouInfoController> {
  const YouInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('이상형'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _youInfoList(),
            const SizedBox(height: 10),
            ElevatedButton(
              style: BtStyle.standard,
              onPressed: () => controller.updateYouInfo(),
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

  Widget _youInfoList() => Center(
        child: SizedBox(
          width: Get.width - ThemePaddings.mainPadding * 2,
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  InfoSelector(
                      title: '동일 학과 배제',
                      placeholder: '${controller.youInfo.value.exceptSameMajor}',
                      list: InfoData.exceptSameMajor,
                      changedCallback: (selected) =>
                          controller.youInfo.value.exceptSameMajor =
                              selected.value == 'true' ? true : false),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '키(이상)',
                      placeholder: '${controller.youInfo.value.minHeight}',
                      list: controller.maxHeight == null
                          ? InfoData.height
                          : List.generate(
                          controller.maxHeight! - 139,
                              (index) => S2Choice<String>(
                              value: '${140 + index}',
                              title: '${140 + index}')),
                      changedCallback: (selected) => controller.youInfo.update(
                          (val) => val!.minHeight = int.parse('${selected.value}'))),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '키(이하)',
                      placeholder: '${controller.youInfo.value.maxHeight}',
                      list: controller.minHeight == null
                          ? InfoData.height
                          : List.generate(
                          190 - controller.minHeight!,
                              (index) => S2Choice<String>(
                              value: '${controller.minHeight! + index}',
                              title: '${controller.minHeight! + index}')),
                      changedCallback: (selected) => controller.youInfo.update(
                          (val) => val!.maxHeight = int.parse('${selected.value}'))),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '나이(이상)',
                      placeholder: '${controller.youInfo.value.minAge}',
                      list: controller.maxAge == null
                          ? InfoData.age
                          : List.generate(
                          controller.maxAge! - 19,
                              (index) => S2Choice<String>(
                              value: '${20 + index}',
                              title: '${20 + index}')),
                      changedCallback: (selected) => controller.youInfo.update(
                          (val) =>
                              val!.minAge = int.parse('${selected.value}'))),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '나이(이하)',
                      placeholder: '${controller.youInfo.value.maxAge}',
                      list: controller.minAge == null
                          ? InfoData.age
                          : List.generate(
                          30 - controller.minAge!,
                              (index) => S2Choice<String>(
                              value: '${controller.minAge! + index}',
                              title: '${controller.minAge! + index}')),
                      changedCallback: (selected) => controller.youInfo.update(
                          (val) => val!.maxAge = int.parse('${selected.value}'))),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '체형',
                      placeholder: controller.youInfo.value.bodyShape,
                      list: controller.user.isMan!
                          ? InfoData.youBodyShapeForMan
                          : InfoData.youBodyShapeForWoman,
                      changedCallback: (selected) =>
                      controller.youInfo.value.bodyShape = selected.value),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '흡연',
                      placeholder: controller.youInfo.value.isSmoker,
                      list: InfoData.youSmoke,
                      changedCallback: (selected) =>
                          controller.youInfo.value.isSmoker = selected.value),
                ],
              ),
            ),
          ),
        ),
      );
}
