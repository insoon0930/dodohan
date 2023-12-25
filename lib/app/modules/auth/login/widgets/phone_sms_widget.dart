import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/buttons.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/paddings.dart';
import '../login_controller.dart';


class PhoneSMSWidget extends StatelessWidget {
  final LoginController controller;
  const PhoneSMSWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfff7f7f7)),
          child: Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: controller.isCodeSent.value,
                    controller: controller.phoneTextController,
                    onChanged: (String newValue) =>
                        controller.phone.value = newValue,
                    style: ThemeFonts.medium.getTextStyle(),
                    maxLength: 13,
                    keyboardType: TextInputType.phone,
                    autofocus: true,
                    focusNode: controller.phoneFocusNode,
                    inputFormatters: [MaskedInputFormatter('###-####-####')],
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '010-1234-5678',
                      hintStyle: ThemeFonts.medium
                          .getTextStyle(color: ThemeColors.grayText),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).paddingSymmetric(horizontal: ThemePaddings.mainPadding),
        const SizedBox(height: 12),
        Obx(() {
          if (!controller.isCodeSent.value) {
            return const SizedBox();
          } else {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff7f7f7)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.codeTextController,
                      onChanged: (String newValue) =>
                          controller.code.value = newValue,
                      keyboardType: TextInputType.number,
                      style: ThemeFonts.medium.getTextStyle(),
                      maxLength: 6,
                      focusNode: controller.codeFocusNode,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        isDense: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: '123456',
                        hintStyle: ThemeFonts.medium
                            .getTextStyle(color: const Color(0xffb3b3b3)),
                      ),
                    ),
                  ),
                ],
              ),
            ).paddingSymmetric(horizontal: 16);
          }
        }),
        const Spacer(),
        Obx(
          () => ElevatedButton(
            style: BtStyle.standard(),
            onPressed: () => kIsWeb ? controller.onTapSMSButtonInWeb() : controller.onTapSMSButtonInMobile(),
            child: Center(
              child: controller.isCodeSent.value
                  ? const Text('인증 요청')
                  : const Text('로그인 및 가입 진행'),
            ),
          ).paddingAll(ThemePaddings.mainPadding),
        ),
      ],
    );
  }
}
