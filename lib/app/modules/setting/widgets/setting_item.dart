import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/paddings.dart';

class SettingItem extends StatelessWidget {
  final String text;
  const SettingItem(this.text, {Key? key, onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 52,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: ThemePaddings.mainPadding),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
