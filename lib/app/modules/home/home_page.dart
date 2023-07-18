import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/home/widgets/home_folder_list.dart';
import 'package:stamp_now/app/widgets/appbars/home_appbarr.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(height: 10),
          Expanded(child: HomeFolderList()),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
