import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/core/theme/fonts.dart';
import '../../../../core/theme/paddings.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Get.focusScope?.unfocus(),
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 72.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('성별을 선택해주세요.', style: ThemeFonts.bold.getTextStyle(size: 24)))
                    .paddingOnly(left: ThemePaddings.mainPadding),
                const SizedBox(height: 30.0),
                // Obx(
                //       () => Row(
                //         children: [
                //           FAButton(
                //             onTap: () => controller.isMan.value = false,
                //             width: 71,
                //             height: 71,
                //             borderRadius: BorderRadius.circular(10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(
                //                     color: controller.isMan.value == false
                //                         ? const Color(0xffff6565)
                //                         : const Color(0xfff7f7f7),
                //                     width: 1),
                //                 color: controller.isMan.value == false
                //                     ? const Color(0xffffe0e0)
                //                     : const Color(0xfff7f7f7)),
                //             isShadow: true,
                //             child: Center(
                //               child: SvgPicture.asset('assets/woman_symbol.svg',
                //                   color: controller.isMan.value == false
                //                       ? const Color(0xffff6565)
                //                       : const Color(0xff979797)),
                //             ),
                //           ),
                //           const SizedBox(width: 12),
                //           FAButton(
                //             onTap: () => controller.isMan.value = true,
                //             width: 71,
                //             height: 71,
                //             borderRadius: BorderRadius.circular(10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(
                //                     color: controller.isMan.value == true
                //                         ? const Color(0xff4b8dff)
                //                         : const Color(0xfff7f7f7),
                //                     width: 1),
                //                 color: controller.isMan.value == true
                //                     ? const Color(0xffdbe9ff)
                //                     : const Color(0xfff7f7f7)),
                //             isShadow: true,
                //             child: Center(
                //               child: SvgPicture.asset('assets/man_symbol.svg',
                //                   color: controller.isMan.value == true
                //                       ? const Color(0xff4b8dff)
                //                       : const Color(0xff979797)),
                //             ),
                //           ),
                //         ],
                //       ).paddingOnly(bottom: 24)
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
