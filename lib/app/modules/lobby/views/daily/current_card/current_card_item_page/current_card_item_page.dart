import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:dodohan/app/widgets/disabled_button.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:dodohan/core/utils/time_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/image/image_view_box.dart';
import '../../../../../../../core/theme/buttons.dart';
import '../../../../../../../core/theme/fonts.dart';
import '../../../../../../../core/utils/utility.dart';
import '../../../../../../data/enums.dart';
import '../../../../../../widgets/appbars/default_appbar.dart';
import '../../../../../../widgets/dialogs/report_dialog.dart';
import '../../../../../../widgets/selectable_phone_num.dart';
import 'current_card_item_controller.dart';

class CurrentCardItemPage extends GetView<CurrentCardItemController> {
  const CurrentCardItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('오늘의 카드', actions: [
        GestureDetector(
            onTap: () => Get.dialog(ReportDialog(
                  reportCallback: () async {
                    return;
                  },
                  blockText: '차단하기(카드 삭제)',
                  blockCallback: () async => await controller.block(),
                )),
            child: Container(
              width: 40,
              height: 20,
              color: Colors.transparent,
              child: SvgPicture.asset('assets/dots.svg', color: ThemeColors.grayDark).paddingOnly(left: 20),
            )).paddingOnly(right: 16),
      ]),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.center, children: [
                ImageViewBox(
                    url: controller.dailyCard.value.oppositeProfileImage,
                    isBlurred: controller.dailyCard.value.isNotBlurred ? false : true,
                    blurValue: 24,
                    width: Get.width - 32,
                    height: Get.width - 32),
                if (!controller.dailyCard.value.isNotBlurred)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        Text('1차 매칭에 성공시 공개됩니다', style: ThemeFonts.medium.getTextStyle(color: Colors.white, size: 14)),
                  ),
              ]),
              //거절함
              if (controller.myStatus == CardStatus.rejected1st || controller.myStatus == CardStatus.rejected2nd)
                const DisabledButton(text: '거절한 카드입니다').paddingOnly(top: 16)
              //1차 선택
              else if (controller.myStatus == CardStatus.checked || controller.myStatus == CardStatus.unChecked)
                _firstChoice()
              //거절됨
              else if (controller.yourStatus == CardStatus.rejected1st)
                const DisabledButton(text: '매칭 실패').paddingOnly(top: 16)
              //2차 선택
              else if (controller.myStatus == CardStatus.confirmed1st && (controller.youMadeAFirstChoice || controller.youMadeASecondChoice))
                _secondChoice()
              //거절됨
              else if (controller.yourStatus == CardStatus.rejected2nd)
                const DisabledButton(text: '매칭 실패').paddingOnly(top: 16)
              //매칭 성공
              else if (controller.myStatus == CardStatus.confirmed2nd && controller.yourStatus == CardStatus.confirmed2nd)
                SelectablePhoneNum(phoneNum: controller.dailyCard.value.yourPhoneNum).paddingOnly(top: 16),
              if (controller.dailyCard.value.meStatus != CardStatus.checked) const SizedBox(height: 16),
              _infoForm('학교', controller.youInfo.univ!),
              const Divider(),
              _infoForm('키', '${controller.youInfo.height ?? ''}cm'),
              const Divider(),
              _infoForm('나이', '${controller.youInfo.age ?? ''}살 (${TimeUtility.birthYear(age: controller.youInfo.age??0)}년생)'),
              const Divider(),
              _infoForm('체형', controller.youInfo.bodyShape!),
              const Divider(),
              _infoForm('흡연', controller.youInfo.isSmoker! ? '흡연' : '비흡연'),
              const Divider(),
              _infoForm('MBTI', controller.youInfo.mbti ?? ''),
              const Divider(),
              _infoForm('간단소개', controller.youInfo.introduction ?? ''),
              const Divider(),
            ],
          ).paddingAll(16),
        ),
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

  Widget _firstChoice() => Row(
        children: [
          Flexible(
            child: ElevatedButton(
              style: BtStyle.standard(color: ThemeColors.main),
              onPressed: () => Get.dialog(ActionDialog(
                  title: '1차 수락',
                  text: '하트 ${controller.user.isMan! ? 2 : 1}개가 소모됩니다',
                  confirmCallback: () =>
                      controller.confirm(coin: controller.user.isMan! ? 2 : 1, cardStatus: CardStatus.confirmed1st),
                  buttonText: '수락하기')),
              child: const Text('수락'),
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: ElevatedButton(
              style: BtStyle.standard(color: ThemeColors.mainLight),
              onPressed: () => Get.dialog(ActionDialog(
                  title: '거절',
                  text: '하트 ${controller.user.isMan! ? 1 : 1}개를 지급받습니다',
                  confirmCallback: () => controller.reject(cardStatus: CardStatus.rejected1st),
                  buttonText: '거절하기')),
              child: const Text('거절'),
            ),
          ),
        ],
      ).paddingSymmetric(vertical: 16);

  Widget _secondChoice() => Row(
        children: [
          Flexible(
            child: ElevatedButton(
              style: BtStyle.standard(color: ThemeColors.main),
              onPressed: () => Get.dialog(ActionDialog(
                  title: '최종 수락',
                  text: '하트 ${controller.user.isMan! ? 6 : 3}개가 소모됩니다',
                  subText: '* 수락한 경우에만 상대방의\n최종 선택을 확인할 수 있습니다',
                  confirmCallback: () =>
                      controller.confirm(coin: controller.user.isMan! ? 6 : 3, cardStatus: CardStatus.confirmed2nd),
                  buttonText: '수락하기')),
              child: const Text('수락'),
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: ElevatedButton(
              style: BtStyle.standard(color: ThemeColors.mainLight),
              onPressed: () => Get.dialog(ActionDialog(
                  title: '거절',
                  text: '하트 ${controller.user.isMan! ? 1 : 1}개를 지급받습니다',
                  confirmCallback: () => controller.reject(cardStatus: CardStatus.rejected2nd),
                  buttonText: '거절하기')),
              child: const Text('거절'),
            ),
          ),
        ],
      ).paddingSymmetric(vertical: 16);
}
