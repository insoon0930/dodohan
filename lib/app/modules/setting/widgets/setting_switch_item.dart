import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/paddings.dart';

class SettingSwitchItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  bool rxValue;

  SettingSwitchItem(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.rxValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 52,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: ThemePaddings.mainPadding),
            Text(text, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Switch(
              value: rxValue,
              onChanged: (bool value) => onTap(),
            ),
            const SizedBox(
                width: ThemePaddings.mainPadding - ThemePaddings.switchPadding),
          ],
        ),
      ),
    );
  }
}
