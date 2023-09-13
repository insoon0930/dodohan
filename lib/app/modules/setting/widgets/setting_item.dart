import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/paddings.dart';

class SettingItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SettingItem(this.text, {Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 52,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text, style: const TextStyle(fontSize: 16)),
            const Icon(Icons.arrow_forward_ios_rounded, size: 12)
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
