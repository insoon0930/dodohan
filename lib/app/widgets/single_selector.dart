import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';

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
      placeholder: (placeholder == null || placeholder == 'null') ? '선택' : placeholder!,
      choiceDirection: Axis.vertical,
      choiceGrouped: title == '학과' ? true : false,
      groupCounter: false,
      groupSelector: false,
      selectedValue: placeholder,
      choiceItems: list,
      onChange: (selected) => changedCallback(selected),
      modalType: S2ModalType.popupDialog,
      tileBuilder: (context, state) => S2Tile.fromState(
        state,
        // leading: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
