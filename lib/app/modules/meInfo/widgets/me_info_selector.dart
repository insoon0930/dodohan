import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../data/utils.dart';
import '../../album/album_page.dart';
import '../../navigation/navigation_controller.dart';
import '../me_info_controller.dart';

class MeInfoSelector extends GetView<MeInfoController> {
  final String _title;
  final List<S2Choice<String>> _list;
  const MeInfoSelector(this._title, this._list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SmartSelect<String?>.single(
            title: _title,
            placeholder: '선택',
            choiceDirection: Axis.vertical,
            choiceGrouped: _title == '학과' ? true : false,
            selectedValue: null,
            choiceItems: _list,
            onChange: (selected) {
              switch (_title){
                case '학과' :
                  controller.meInfo.major = selected.value ?? '';
                  break;
                case '키' :
                  controller.meInfo.height = int.parse('${selected.value ?? 0}');
                  break;
                case '나이' :
                  controller.meInfo.age = int.parse('${selected.value ?? 0}');
                  break;
                case '체형' :
                  controller.meInfo.bodyShape = selected.value ?? '';
                  break;
                case '흡연' :
                  controller.meInfo.isSmoker =
                      selected.value == 'true' ? true : false;
                  break;
              }
            },
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
