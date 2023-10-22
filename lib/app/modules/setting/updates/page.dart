import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/appbars/default_appbar.dart';
import '../../../widgets/expandableBox.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('공지사항'),
      body: const Column(
        children: [
          ExpandableBox(title: '웹 버전 출시', body: '웹 버전이 최초로 출시되었습니다.', createdAt: '2023-08-08'),
        ],
      ).paddingAll(16),
    );
  }
}
