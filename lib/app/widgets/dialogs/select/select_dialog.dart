import 'package:flutter/material.dart';

class SelectDialog extends StatelessWidget {
  final List<Widget> items;
  final double itemHeight;

  const SelectDialog({Key? key, required this.items, required this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: itemHeight * items.length,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            boxShadow: [BoxShadow(color: Color(0x1a000000), offset: Offset(2, 2), blurRadius: 8, spreadRadius: 0)],
            color: Color(0xfffefffe)),
        child: Column(mainAxisSize: MainAxisSize.min, children: items),
      ),
    );
  }
}