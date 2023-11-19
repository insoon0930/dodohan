import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_item/widgets/applicant_card.dart';
import 'package:dodohan/app/widgets/disabled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../core/theme/buttons.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../data/enums.dart';
import '../../../../../data/model/self_application.dart';
import '../../../../../data/model/self_introduction.dart';
import '../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../widgets/dialogs/action_dialog.dart';
import '../../../../../widgets/dialogs/report_dialog.dart';
import '../../../../../widgets/dialogs/select/select_dialog.dart';
import '../../../../../widgets/dialogs/select/select_dialog_item.dart';
import '../../../../../widgets/dividers/divider_with_text.dart';
import '../../../../../widgets/dividers/my_divider_2.dart';
import '../../../../../widgets/image/image_view_box.dart';
import 'self_introduction_item_controller.dart';

class SelfIntroductionItemPage extends GetView<SelfIntroductionItemController> {
  const SelfIntroductionItemPage({super.key});
  SelfIntroduction get selfIntroduction => controller.selfIntroduction.value;
  SelfApplication? get selfApplication => controller.selfApplication.value;
  List<SelfApplication> get applications => controller.applications.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('셀프 소개'),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        ImageViewBox(url: selfIntroduction.image, width: Get.width, height: Get.width),
                        Positioned(
                          top: 12,
                          right: 4,
                          child: GestureDetector(
                              onTap: () => selfIntroduction.isMine
                                  ? Get.dialog(SelectDialog(itemHeight: 60, items: [
                                SelectDialogItem(
                                    text: '삭제하기',
                                    onTap: () => controller.delete(selfIntroduction.id),
                                    first: true,
                                    last: true,
                                    style: ThemeFonts.semiBold.getTextStyle(size: 15)),
                              ]))
                                  : Get.dialog(ReportDialog(
                                      hasBlock: false,
                                      reportCallback: () async {},
                                      blockCallback: () async {},
                                    )),
                              child: Container(
                                width: 40,
                                height: 20,
                                color: Colors.transparent,
                                child: SvgPicture.asset('assets/dots.svg', color: Colors.white70).paddingOnly(left: 20),
                              )).paddingOnly(right: 16),
                        )
                      ]),
                      Text('${selfIntroduction.meInfo?.univ ?? '학교명(오류)'}${selfIntroduction.sameUnivOnly ? ' (동일 캠퍼스만 신청 가능)' : ''}',
                          style: ThemeFonts.regular.getTextStyle(size: 15, color: ThemeColors.mainLight))
                          .paddingOnly(top: 16),
                      Text(selfIntroduction.title, style: ThemeFonts.semiBold.getTextStyle(size: 20)).paddingOnly(top: 8, bottom: 16),
                      const MyDivider2(),
                      Text(selfIntroduction.text, style: ThemeFonts.medium.getTextStyle(size: 15)).paddingSymmetric(vertical: 16),
                      if (selfIntroduction.isMine)
                        Column(
                          children: [
                            const DividerWithText('받은 신청').paddingOnly(top: 4, bottom: 8),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: applications.length,
                              itemBuilder: (context, index) => GestureDetector(
                                  onTap: () => applications[index].status == SelfApplicationStatus.closed
                                      ? Get.dialog(ActionDialog(title: '상대방 확인 하기',
                                      text: '프로필 확인은 상대가 알 수 없습니다\n\n하트가 1개 소모됩니다',
                                      confirmCallback: () => controller.openClosedCard(index, applications[index])))
                                      : controller.goToCheckOppositeProfile(applications[index]),
                                  child: ApplicantCard(selfApplication: applications[index])),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                childAspectRatio: 1,
                              ),
                            ),
                            const SizedBox(height: 8)
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const MyDivider2().paddingOnly(bottom: 8),
              if (selfIntroduction.isMine || selfIntroduction.hasUnivIssue || controller.loading.value)
                Container()
              else if (selfApplication == null)
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: BtStyle.standard(color: ThemeColors.main),
                          onPressed: () => Get.dialog(ActionDialog(
                              title: '신청하기',
                              text: '내 프로필을 보내며\n상대방이 유료로 수락 할 경우\n상대방 프로필이 공개됩니다',
                              confirmCallback: () => controller.applyForFree(),
                              buttonText: '무료 신청')),
                          child: const Text('무료 신청')),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                          style: BtStyle.standard(color: ThemeColors.orangeLight),
                          onPressed: () => Get.dialog(ActionDialog(
                              title: '신청하기',
                              text: '내 프로필을 보내며\n상대방이 무료로 수락 할 경우\n상대방 프로필이 공개됩니다\n\n하트 3개가 소모됩니다',
                              confirmCallback: () => controller.applyWithCharge(),
                              buttonText: '유료 신청')),
                          child: const Text('유료 신청')),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 75,
                      child: ElevatedButton(
                          style: BtStyle.standard(color: Colors.black),
                          onPressed: () => Get.toNamed(Routes.previewMyProfile),
                          child: const Icon(Icons.account_box)),
                    ),
                  ],
                ).paddingOnly(bottom: 8)
              else if (selfApplication!.canSeeProfile)
                ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.checkOppositeProfile),
                    style: BtStyle.standard(color: ThemeColors.blueLight),
                    child: const Text('상대방 프로필 확인'))
              else if(selfIntroduction.applied)
                const DisabledButton(text: '신청 완료'),
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
      ),
    );
  }
}
