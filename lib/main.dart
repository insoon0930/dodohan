import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/service/user_service/repository.dart';
import 'package:stamp_now/routes/app_pages.dart';
import 'package:stamp_now/routes/app_routes.dart';

import 'app/data/provider/api_service.dart';
import 'app/data/service/user_service/service.dart';
import 'app/modules/home/me_info_controller.dart';
import 'app/modules/home/me_info_repository.dart';
import 'core/services/auth_service.dart';
import 'core/theme/main_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DoDoHan',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.splash,
      initialBinding: BindingsBuilder(() {
        Get.put(ApiService(), permanent: true);
        Get.put(AuthService(UserService(UserRepository())), permanent: true);
        Get.put(MeInfoController(repo: MeInfoRepository()), permanent: true);
      }),
      theme: MainTheme.light,
      // darkTheme: MainTheme.dark,
    );
  }
}