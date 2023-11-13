import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textController;
  final Function? onChanged;
  final FocusNode? focusNode;
  final String? hint;
  final double width;
  final int minLine;

  const MyTextField({Key? key, this.hint = '입력', this.width = 150, required this.textController, this.focusNode, this.minLine = 1, this.onChanged})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        style: ThemeFonts.regular.getTextStyle(),
        controller: textController,
        focusNode: focusNode,
        minLines: minLine,
        maxLines: null,
        onChanged: onChanged != null ? (text) => onChanged!(text) : null,
        decoration: InputDecoration(
          hintText: hint,
          counter: null,
          contentPadding: const EdgeInsets.all(8),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColors.grayDark, width: 0.5)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColors.main, width: 0.5)),
        ),
      ),
    );
  }
}