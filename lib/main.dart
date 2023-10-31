import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/provider/storage_service.dart';
import 'package:dodohan/routes/app_pages.dart';
import 'package:dodohan/routes/app_routes.dart';
import 'app/data/provider/api_service.dart';
import 'app/data/service/user_service/service.dart';
import 'app/modules/store/store_controller.dart';
import 'core/services/auth_service.dart';
import 'core/theme/main_theme.dart';
import 'firebase_options.dart';
import 'package:flutter_web_plugins/url_strategy.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // analytics.logAppOpen();
  // if (!kIsWeb) {
  //   await FirebaseAnalytics.instance.setDefaultEventParameters({});
  // }

  usePathUrlStrategy();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '두근두근캠퍼스',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.splash,
      initialBinding: BindingsBuilder(() {
        Get.put(ApiService(), permanent: true);
        Get.put(AuthService(UserService()), permanent: true);
        Get.put(StorageService(), permanent: true);
        Get.put(StoreService(), permanent: true);
      }),
      theme: MainTheme.light,
      // darkTheme: MainTheme.dark,
    );
  }
}