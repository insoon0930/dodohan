import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../album/album_page.dart';
import '../../navigation/navigation_controller.dart';

class HomeFolderListItem extends GetView<NavigationController> {
  final String title;
  const HomeFolderListItem(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<S2Choice<String>> fruits = [
      S2Choice<String>(value: 'app', title: 'Apple'),
      S2Choice<String>(value: 'ore', title: 'Orange'),
      S2Choice<String>(value: 'mel', title: 'Melon'),
    ];
    String? _fruit = 'mel';
    String? _framework = 'flu';
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SmartSelect<String?>.single(
            title: 'Fruit',
            selectedValue: _fruit,
            choiceItems: fruits,
            onChange: (selected) => _fruit = selected.value,
            modalType: S2ModalType.popupDialog,
            tileBuilder: (context, state) {
              return S2Tile.fromState(
                state,
                leading: const Icon(Icons.shopping_cart),
              );
            },
          ),
          SizedBox(
              height: 68,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: Text(
                        title,
                        maxLines: 1,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17.0),
                    child: Row(
                      children: const [
                        Text('33', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17)),
                        SizedBox(width: 2,),
                        Text('장', style: TextStyle(
                            color: Colors.white,
                            fontSize: 11)),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 4)
        ],
      ),
    );
  }
}
