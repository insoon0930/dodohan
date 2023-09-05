import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/colors.dart';

class DummyCardItem extends StatelessWidget {
  const DummyCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0))),
      elevation: 5,
      child: Stack(
        children: [
          Container(
            width: (Get.width - 64) / 2,
            height: (Get.width - 64) / 2 * 1.4,
            padding: const EdgeInsets.all(4.0),
          ),
          Positioned.fill(
              child: Card(
                  color: ThemeColors.main,
                  margin: const EdgeInsets.all(4.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  elevation: 0,
                  child: SvgPicture.asset('assets/love.svg',
                      color: ThemeColors.mainLightest)
                      .paddingAll((Get.width - 64) / 7))),
        ],
      ),
    );
  }
}
