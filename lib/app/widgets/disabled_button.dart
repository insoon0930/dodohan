import 'package:flutter/material.dart';

import '../../core/theme/buttons.dart';
import '../../core/theme/colors.dart';

class DisabledButton extends StatelessWidget {
  final String text;
  const DisabledButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: BtStyle.standard(color: ThemeColors.grayLightest),
        child: Text(text));
  }
}
