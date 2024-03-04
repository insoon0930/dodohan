import 'package:awesome_select/awesome_select.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:dodohan/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SingleSelector extends StatelessWidget {
  final String title;
  final String? placeholder;
  final List<S2Choice<String>> list;
  final Function changedCallback;

  const SingleSelector(
      {required this.title,
      required this.placeholder,
      required this.list,
      required this.changedCallback,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartSelect<String?>.single(
      title: title,
      placeholder: (placeholder == null || placeholder == 'null') ? '필수' : placeholder!,
      choiceDirection: Axis.vertical,
      choiceGrouped: title == '학과' ? true : false,
      groupCounter: false,
      groupSelector: false,
      selectedValue: placeholder,
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
      },
    );
  }
}
