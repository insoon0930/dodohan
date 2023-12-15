import 'package:dodohan/app/data/model/self_application.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:dodohan/app/widgets/disabled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/theme/buttons.dart';
import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../data/enums.dart';
import '../../../../../../data/model/me_info.dart';
import '../../../../../../data/model/self_introduction.dart';
import '../../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../../widgets/image/image_view_box.dart';
import '../../../../../../widgets/selectable_phone_num.dart';
import '../self_introduction_item_controller.dart';

class CheckOppositeProfilePage extends GetView<SelfIntroductionItemController> {
  const CheckOppositeProfilePage({Key? key}) : super(key: key);

  SelfIntroduction get selfIntroduction => controller.selfIntroduction.value;
  SelfApplication get selfApplication => controller.selfApplication.value!;
  MeInfo get meInfo => selfIntroduction.isMine ? selfApplication.meInfo : selfIntroduction.meInfo!;
  String get profileImage => selfIntroduction.isMine ? selfApplication.profileImage : selfIntroduction.profileImage;
  bool get needSecondConfirm => !selfIntroduction.isMine && selfApplication.status == SelfApplicationStatus.confirmed1st;
  bool get needFirstConfirmForFree => selfIntroduction.isMine && selfApplication.status == SelfApplicationStatus.openedByApplicant;
  bool get needFirstConfirmWithCharge => selfIntroduction.isMine && selfApplication.status == SelfApplicationStatus.openedByOwner;
  String get phoneNum => selfIntroduction.isMine ? selfApplication.phoneNum : selfIntroduction.phoneNum;

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
                    ImageViewBox(url: profileImage, width: Get.width, height: Get.width),
                    const SizedBox(height: 16),
                    //무료 수락 / 유료 수락 / 최종 수락
                    if (needSecondConfirm)
                      ElevatedButton(
                        onPressed: () => Get.dialog(ActionDialog(
                              title: '최종 수락',
                              text: '수락시 서로의 연락처가 공개됩니다\n\n하트 3개가 소모됩니다',
                              confirmCallback: () => controller.confirm2nd())),
                          style: BtStyle.standard(color: ThemeColors.blueLight),
                        child: const Text('수락하기')),
                    if (needFirstConfirmForFree)
                      ElevatedButton(
                          onPressed: () => Get.dialog(ActionDialog(
                              title: '수락하기',
                              text: '상대의 최종 수락시\n서로의 연락처가 공개됩니다',
                              confirmCallback: () => controller.confirm1stForFree())),
                          style: BtStyle.standard(color: ThemeColors.blueLight),
                          child: const Text('무료로 수락하기')),
                    if (needFirstConfirmWithCharge)
                      ElevatedButton(
                          onPressed: () => Get.dialog(ActionDialog(
                              title: '수락하기',
                              text: '상대의 최종 수락시\n서로의 연락처가 공개됩니다\n\n하트 3개가 소모됩니다',
                              confirmCallback: () => controller.confirm1stWithCharge())),
                          style: BtStyle.standard(color: ThemeColors.blueLight),
                          child: const Text('수락하기')),
                    if (selfIntroduction.isMine && selfApplication.status == SelfApplicationStatus.confirmed1st)
                      const DisabledButton(text: '대기중'),
                    if(selfApplication.status == SelfApplicationStatus.confirmed2nd)
                      Center(child: SelectablePhoneNum(phoneNum: phoneNum)),
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
                    _infoForm('MBTI', meInfo.mbti ?? ''),
                    const Divider(),
                    _infoForm('간단소개', meInfo.introduction ?? ''),
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
          // height: 35,
          alignment: Alignment.centerLeft,
          child: Text(value, style: ThemeFonts.medium.getTextStyle()).paddingOnly(left: 8),
        ),
      ],
    );
  }
}
