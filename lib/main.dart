import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/provider/storage_service.dart';
import 'package:stamp_now/app/modules/store/redirect/success/store_page.dart';
import 'package:stamp_now/routes/app_pages.dart';
import 'package:stamp_now/routes/app_routes.dart';
import 'app/data/provider/api_service.dart';
import 'app/data/service/user_service/service.dart';
import 'core/services/auth_service.dart';
import 'core/theme/main_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics.logAppOpen();
  // // Not supported on web
  // await FirebaseAnalytics.instance.setDefaultEventParameters({});

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
      onGenerateRoute: (RouteSettings settings) {

        // print current route for clarity.
        print('>>> ${settings.name} <<<');

        switch (settings.name) {
          case Routes.storeSuccess:
            return MaterialPageRoute(
              builder: (context) => const StoreSuccessPage(),
              settings: settings,
            );
        }
      },
      // initialRoute: Routes.splash,
      initialBinding: BindingsBuilder(() {
        Get.put(ApiService(), permanent: true);
        Get.put(AuthService(UserService()), permanent: true);
        Get.put(StorageService(), permanent: true);
      }),
      theme: MainTheme.light,
      // darkTheme: MainTheme.dark,
    );
  }
}