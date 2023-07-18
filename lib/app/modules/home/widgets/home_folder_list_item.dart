import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../album/album_page.dart';
import '../../navigation/navigation_controller.dart';

class HomeFolderListItem extends GetView<NavigationController> {
  const HomeFolderListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.tabIndex.value = 1,
      child: Column(
        children: [
          Container(
              height: 68,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xff273D60),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 17.0),
                      child: Text(
                        '전체 앨범',
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
