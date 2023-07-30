import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../data/utils.dart';
import '../../album/album_page.dart';
import '../../navigation/navigation_controller.dart';
import '../me_info_controller.dart';

class MeInfoSelector extends GetView<MeInfoController> {
  final String title;
  final String? placeholder;
  final List<S2Choice<String>> list;
  final Function changedCallback;

  const MeInfoSelector(
      {required this.title,
      required this.placeholder,
      required this.list,
      required this.changedCallback,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SmartSelect<String?>.single(
            title: title,
            placeholder: placeholder ?? '선택',
            choiceDirection: Axis.vertical,
            choiceGrouped: title == '학과' ? true : false,
            selectedValue: null,
            choiceItems: list,
            onChange: (selected) => changedCallback(selected),
            // onChange: (selected) {
            //   switch (title){
            //     case '학과' :
            //       controller.meInfo.value.major = selected.value ?? '';
            //       break;
            //     case '키' :
            //       controller.meInfo.value.height = int.parse('${selected.value ?? 0}');
            //       break;
            //     case '나이' :
            //       controller.meInfo.value.age = int.parse('${selected.value ?? 0}');
            //       break;
            //     case '체형' :
            //       controller.meInfo.value.bodyShape = selected.value ?? '';
            //       break;
            //     case '흡연' :
            //       controller.meInfo.value.isSmoker =
            //           selected.value == 'true' ? true : false;
            //       break;
            //   }
            // },
            modalType: S2ModalType.popupDialog,
            tileBuilder: (context, state) => S2Tile.fromState(
              state,
              leading: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
    );
  }
}
