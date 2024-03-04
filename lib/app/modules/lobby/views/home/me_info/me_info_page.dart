import 'package:dodohan/app/widgets/my_text_field.dart';
import 'package:dodohan/core/utils/time_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../../core/theme/paddings.dart';
import '../../../../../data/info_data.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/single_selector.dart';
import 'me_info_controller.dart';

class MeInfoPage extends GetView<MeInfoController> {
  const MeInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('나'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _meInfoList(),
            const SizedBox(height: 10),
            ElevatedButton(
              style: BtStyle.standard(),
              onPressed: () => controller.updateMeInfo(),
              child: const Text('저장'),
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
                  SingleSelector(
                      title: '학과',
                      placeholder: controller.meInfo.value.major,
                      list: InfoData.univInfo[controller.user.univ]?.major??[],
                      changedCallback: (selected) =>
                          controller.meInfo.value.major = selected.value),
                  const SizedBox(height: 12),
                  SingleSelector(
                      title: '키',
                      placeholder: '${controller.meInfo.value.height}',
                      list: InfoData.height,
                      changedCallback: (selected) => controller
                          .meInfo.value.height = int.parse('${selected.value}')),
                  const SizedBox(height: 12),
                  SingleSelector(
                      title: '나이',
                      placeholder: controller.meInfo.value.age == null ? '필수' : '${controller.meInfo.value.age} (${TimeUtility.birthYear(age: controller.meInfo.value.age??0)}년생)',
                      list: InfoData.ageWithYear,
                      changedCallback: (selected) => controller.meInfo.value.age =
                          int.parse('${selected.value.split(' ')[0] ?? 0}')),
                  const SizedBox(height: 12),
                  SingleSelector(
                      title: '체형',
                      placeholder: controller.meInfo.value.bodyShape,
                      list: controller.user.isMan!
                          ? InfoData.manBodyShape
                          : InfoData.womanBodyShape,
                      changedCallback: (selected) =>
                      controller.meInfo.value.bodyShape = selected.value),
                  const SizedBox(height: 12),
                  SingleSelector(
                      title: '흡연',
                      placeholder: '${controller.meInfo.value.isSmoker}',
                      list: InfoData.meSmoke,
                      changedCallback: (selected) => controller.meInfo.value
                          .isSmoker = selected.value == 'true' ? true : false),
                  const SizedBox(height: 12),
                  SingleSelector(
                      title: 'MBTI',
                      placeholder: controller.meInfo.value.mbti == null ? '(선택)' : '${controller.meInfo.value.mbti}',
                      list: InfoData.mbti,
                      changedCallback: (selected) => controller.meInfo.value.mbti = selected.value),
                  const SizedBox(height: 12),
                  MyTextField(
                      textController: TextEditingController(text: controller.meInfo.value.introduction),
                      width: Get.width,
                      hint: '자신에 대한 소개를 작성해주세요 (선택)',
                      minLine: 4,
                      onChanged: (text) => controller.meInfo.value.introduction = text),
                ],
              ),
            ),
          ),
        ),
      );
}
