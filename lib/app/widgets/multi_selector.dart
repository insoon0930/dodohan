import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';

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
      tileBuilder: (context, state) => S2Tile.fromState(
        state,
        // leading: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
