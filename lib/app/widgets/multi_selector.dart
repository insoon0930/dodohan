import 'package:awesome_select/awesome_select.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/fonts.dart';

class MultiSelector extends StatelessWidget {
  final String title;
  final List<String>? selected;
  final List<S2Choice<String>> list;
  final Function changedCallback;

  const MultiSelector(
      {required this.title,
      required this.selected,
      required this.list,
      required this.changedCallback,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartSelect<String?>.multiple(
      title: title,
      placeholder: selected?.join(', ') ?? '선택',
      choiceDirection: Axis.vertical,
      choiceGrouped: false,
      groupCounter: false,
      groupSelector: false,
      selectedValue: selected ?? [],
      choiceItems: list,
      onChange: (selected) => changedCallback(selected),
      modalType: S2ModalType.popupDialog,
        tileBuilder: (context, state) {
          return ListTile(
            title: Text('${state.title}', style: ThemeFonts.medium.getTextStyle(size: 16)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${state.selected}', style: ThemeFonts.medium.getTextStyle(size: 16, color: ThemeColors.main)),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/arrow_right.svg', color: ThemeColors.blackTextLight),
              ],
            ),
            onTap: state.showModal,
            tileColor: ThemeColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(width: 1, color: ThemeColors.chip),
            ),
          );
        }
    );
  }
}
