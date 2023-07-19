import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../data/utils.dart';
import '../../album/album_page.dart';
import '../../navigation/navigation_controller.dart';

class HomeFolderListItem extends GetView<NavigationController> {
  final String title;
  const HomeFolderListItem(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _fruit = 'mel';
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SmartSelect<String?>.single(
            title: title,
            selectedValue: null,
            choiceItems: Utils.gender,
            onChange: (selected) => _fruit = selected.value,
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
