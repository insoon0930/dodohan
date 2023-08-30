import 'package:get/get.dart';
import '../app/modules/admin/admin_binding.dart';
import '../app/modules/admin/admin_page.dart';
import '../app/modules/admin/application/application_binding.dart';
import '../app/modules/admin/application/application_page.dart';
import '../app/modules/admin/match/match_binding.dart';
import '../app/modules/admin/match/match_page.dart';
import '../app/modules/admin/profile_image_request/profile_image_request_binding.dart';
import '../app/modules/admin/profile_image_request/profile_image_request_page.dart';
import '../app/modules/admin/test/test_binding.dart';
import '../app/modules/admin/test/test_page.dart';
import '../app/modules/admin/woman_user/woman_user_binding.dart';
import '../app/modules/admin/woman_user/woman_user_page.dart';
import '../app/modules/auth/login/login_binding.dart';
import '../app/modules/auth/login/login_page.dart';
import '../app/modules/auth/login_by/login_by_page.dart';
import '../app/modules/auth/register/register_binding.dart';
import '../app/modules/auth/register/register_page.dart';
import '../app/modules/auth/waiting/waiting_page.dart';
import '../app/modules/lobby/lobby_binding.dart';
import '../app/modules/lobby/lobby_page.dart';
import '../app/modules/me_info/me_info_binding.dart';
import '../app/modules/me_info/me_info_page.dart';
import '../app/modules/splash/splash_binding.dart';
import '../app/modules/splash/splash_page.dart';
import '../app/modules/you_info/you_info_binding.dart';
import '../app/modules/you_info/you_info_page.dart';
import 'app_routes.dart';

class AppPages {

  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.loginBy,
        page: () => const LoginByPage()),
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
        name: Routes.lobby,
        page: () => const LobbyPage(),
        binding: LobbyBinding()),
    GetPage(
        name: Routes.admin,
        page: () => const AdminPage(),
        binding: AdminBinding()),
    GetPage(
        name: Routes.test,
        page: () => const TestPage(),
        binding: TestBinding()),
    GetPage(
        name: Routes.profileImageRequest,
        page: () => const ProfileImageRequestPage(),
        binding: ProfileImageRequestBinding()),
    GetPage(
        name: Routes.womanUser,
        page: () => const WomanUserPage(),
        binding: WomanUserBinding()),
    GetPage(
        name: Routes.match,
        page: () => const MatchPage(),
        binding: MatchBinding()),
    GetPage(
        name: Routes.application,
        page: () => const ApplicationPage(),
        binding: ApplicationBinding()),
    GetPage(
        name: Routes.meInfo,
        page: () => const MeInfoPage(),
        binding: MeInfoBinding()),
    GetPage(
        name: Routes.youInfo,
        page: () => const YouInfoPage(),
        binding: YouInfoBinding()),
    GetPage(
        name: Routes.dailyCard,
        page: () => const YouInfoPage(),
        binding: YouInfoBinding()),
  ];
}
