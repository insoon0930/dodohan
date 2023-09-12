import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/model/identity.dart';
import 'package:stamp_now/core/services/auth_service.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/enums.dart';
import '../../../data/info_data.dart';
import '../../../data/model/user.dart';
import '../../../data/provider/storage_service.dart';
import '../../../data/service/identity_service/service.dart';
import '../../../widgets/dialogs/error_dialog.dart';
import '../../splash/splash_controller.dart';

class WaitingController extends GetxController {
  @override
  Future<void> onInit() async {
    print('RegisterController onInit');
    Get.put(SplashController());
    super.onInit();
  }
}
