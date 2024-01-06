import 'package:awesome_select/awesome_select.dart';
import 'package:dodohan/core/utils/time_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../../core/theme/paddings.dart';
import '../../../../../data/info_data.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/multi_selector.dart';
import '../../../../../widgets/single_selector.dart';
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
              style: BtStyle.standard(),
              onPressed: () => controller.updateYouInfo(),
              child: const Center(child: Text('저장')),
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
                  SingleSelector(
                      title: '동일 학과 배제',
                      placeholder: '${controller.youInfo.value.exceptSameMajor}',
                      list: InfoData.exceptSameMajor,
                      changedCallback: (selected) =>
                          controller.youInfo.value.exceptSameMajor =
                              selected.value == 'true' ? true : false),
                  const Divider(height: 1),
                  SingleSelector(
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
                  SingleSelector(
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
                          (val) => val!.maxHeight = int.parse('${selected.value.split(' ')[0] ?? 0}'))),
                  const Divider(height: 1),
                  SingleSelector(
                      title: '나이(이상)',
                      placeholder: controller.maxAge == null
                          ? '필수'
                          : '${controller.youInfo.value.minAge} (${TimeUtility.birthYear(age: controller.youInfo.value.minAge ?? 0)}년생)',
                      list: controller.maxAge == null
                          ? InfoData.ageWithYear
                          : List.generate(
                          controller.maxAge! - 19,
                              (index) => S2Choice<String>(
                              value: '${20 + index} (${TimeUtility.birthYear(age: 20 + index)}년생)',
                              title: '${20 + index} (${TimeUtility.birthYear(age: 20 + index)}년생)')),
                      changedCallback: (selected) => controller.youInfo.update(
                          (val) =>
                              val!.minAge = int.parse('${selected.value.split(' ')[0] ?? 0}'))),
                  const Divider(height: 1),
                  SingleSelector(
                      title: '나이(이하)',
                      placeholder: controller.minAge == null
                          ? '필수'
                          : '${controller.youInfo.value.maxAge} (${TimeUtility.birthYear(age: controller.youInfo.value.maxAge ?? 0)}년생)',
                      list: controller.minAge == null
                          ? InfoData.ageWithYear
                          : List.generate(
                          31 - controller.minAge!,
                              (index) => S2Choice<String>(
                              value: '${controller.minAge! + index} (${TimeUtility.birthYear(age: controller.minAge! + index)}년생)',
                              title: '${controller.minAge! + index} (${TimeUtility.birthYear(age: controller.minAge! + index)}년생)')),
                      changedCallback: (selected) => controller.youInfo.update(
                          (val) => val!.maxAge = int.parse('${selected.value.split(' ')[0] ?? 0}'))),
                  const Divider(height: 1),
                  MultiSelector(
                      title: '체형',
                      selected: controller.youInfo.value.bodyShape,
                      list: controller.user.isMan!
                          ? InfoData.womanBodyShape
                          : InfoData.manBodyShape,
                      changedCallback: (S2MultiSelected<String?> selected) => controller
                          .youInfo.value.bodyShape = selected.title),
                  const Divider(height: 1),
                  SingleSelector(
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
