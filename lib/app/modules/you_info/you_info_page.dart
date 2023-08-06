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
                      list: InfoData.height,
                      changedCallback: (selected) => controller
                          .youInfo.value.minHeight = int.parse('${selected.value}')),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '키(이하)',
                      placeholder: '${controller.youInfo.value.maxHeight}',
                      list: InfoData.height,
                      changedCallback: (selected) => controller
                          .youInfo.value.maxHeight = int.parse('${selected.value}')),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '나이(이상)',
                      placeholder: '${controller.youInfo.value.minAge}',
                      list: InfoData.age,
                      changedCallback: (selected) => controller.youInfo.value.minAge =
                          int.parse('${selected.value ?? 0}')),
                  const Divider(height: 1),
                  InfoSelector(
                      title: '나이(이하)',
                      placeholder: '${controller.youInfo.value.maxAge}',
                      list: InfoData.age,
                      changedCallback: (selected) => controller.youInfo.value.maxAge =
                          int.parse('${selected.value ?? 0}')),
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
