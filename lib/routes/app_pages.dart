import 'package:get/get.dart';
import '../app/modules/admin/admin_binding.dart';
import '../app/modules/admin/admin_page.dart';
import '../app/modules/auth/login/login_binding.dart';
import '../app/modules/auth/login/login_page.dart';
import '../app/modules/auth/register/register_binding.dart';
import '../app/modules/auth/register/register_page.dart';
import '../app/modules/auth/waiting/waiting_page.dart';
import '../app/modules/camera/camera_binding.dart';
import '../app/modules/camera/camera_page.dart';
import '../app/modules/home/home_binding.dart';
import '../app/modules/home/home_page.dart';
import '../app/modules/meInfo/me_info_binding.dart';
import '../app/modules/meInfo/me_info_page.dart';
import '../app/modules/navigation/navigation_binding.dart';
import '../app/modules/navigation/navigation_view.dart';
import '../app/modules/setting/setting_binding.dart';
import '../app/modules/setting/setting_page.dart';
import '../app/modules/splash/splash_binding.dart';
import '../app/modules/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {

  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.register,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.waiting,
        page: () => const WaitingPage()),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.admin,
        page: () => const AdminPage(),
        binding: AdminBinding()),
    GetPage(
        name: Routes.navigation,
        page: () => const NavigationView(),
        binding: NavigationBinding()),
    GetPage(
        name: Routes.meInfo,
        page: () => const MeInfoPage(),
        binding: MeInfoBinding()),
    // GetPage(
    //     name: Routes.album,
    //     page: () => const AlbumPage(),
    //     transition: Transition.rightToLeft,
    //     binding: AlbumBinding()),
    GetPage(
        name: Routes.setting,
        page: () => const SettingPage(),
        binding: SettingBinding()),
    GetPage(
        name: Routes.camera,
        page: () => const CameraPage(),
        binding: CameraBinding()),
  ];
}
