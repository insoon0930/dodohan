import 'package:dodohan/app/modules/lobby/views/self_introduction/create_self_introduction/preview_self_introduction/preview_self_introduction_page.dart';
import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_item/preview_my_profile/preview_my_profile_page.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/setting/business_info/page.dart';
import '../app/modules/admin/admin_binding.dart';
import '../app/modules/admin/admin_page.dart';
import '../app/modules/admin/analytics/analytics_binding.dart';
import '../app/modules/admin/analytics/analytics_page.dart';
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
import '../app/modules/auth/agree_pages/privacy.dart';
import '../app/modules/auth/agree_pages/terms_of_use.dart';
import '../app/modules/auth/login/login_binding.dart';
import '../app/modules/auth/login/login_page.dart';
import '../app/modules/auth/login_by/login_by_binding.dart';
import '../app/modules/auth/login_by/login_by_page.dart';
import '../app/modules/auth/register/register_binding.dart';
import '../app/modules/auth/register/register_page.dart';
import '../app/modules/auth/waiting/waiting_binding.dart';
import '../app/modules/auth/waiting/waiting_page.dart';
import '../app/modules/lobby/lobby_binding.dart';
import '../app/modules/lobby/lobby_page.dart';
import '../app/modules/lobby/views/daily/current_card/current_card_binding.dart';
import '../app/modules/lobby/views/daily/current_card/current_card_item_page/current_card_item_binding.dart';
import '../app/modules/lobby/views/daily/current_card/current_card_item_page/current_card_item_page.dart';
import '../app/modules/lobby/views/daily/current_card/current_card_page.dart';
import '../app/modules/lobby/views/daily/daily_card/daily_card_binding.dart';
import '../app/modules/lobby/views/daily/daily_card/daily_card_page.dart';
import '../app/modules/lobby/views/home/me_info/me_info_binding.dart';
import '../app/modules/lobby/views/home/me_info/me_info_page.dart';
import '../app/modules/lobby/views/home/you_info/you_info_binding.dart';
import '../app/modules/lobby/views/home/you_info/you_info_page.dart';
import '../app/modules/lobby/views/self_introduction/create_self_introduction/create_self_introduction_binding.dart';
import '../app/modules/lobby/views/self_introduction/create_self_introduction/create_self_introduction_page.dart';
import '../app/modules/lobby/views/self_introduction/my_self_introduction/my_self_introduction_binding.dart';
import '../app/modules/lobby/views/self_introduction/my_self_introduction/my_self_introduction_page.dart';
import '../app/modules/lobby/views/self_introduction/self_introduction_item/check_opposite_profile/check_opposite_profile_page.dart';
import '../app/modules/lobby/views/self_introduction/self_introduction_item/preview_my_profile/preview_my_profile_binding.dart';
import '../app/modules/lobby/views/self_introduction/self_introduction_item/self_introduction_item_binding.dart';
import '../app/modules/lobby/views/self_introduction/self_introduction_item/self_introduction_item_page.dart';
import '../app/modules/setting/inquire/page.dart';
import '../app/modules/setting/questions/page.dart';
import '../app/modules/setting/setting_page.dart';
import '../app/modules/setting/updates/page.dart';
import '../app/modules/splash/splash_binding.dart';
import '../app/modules/splash/splash_page.dart';
import '../app/modules/store/store_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.loginBy,
        page: () => const LoginByPage(),
        binding: LoginByBinding()),
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
        page: () => const WaitingPage(),
        binding: WaitingBinding()),
    GetPage(
        name: Routes.lobby,
        page: () => const LobbyPage(),
        binding: LobbyBinding()),
    GetPage(
        name: Routes.admin,
        page: () => const AdminPage(),
        binding: AdminBinding(),
        children: [
          GetPage(
              name: Paths.test,
              page: () => const TestPage(),
              binding: TestBinding()),
          GetPage(
              name: Paths.profileImageRequest,
              page: () => const ProfileImageRequestPage(),
              binding: ProfileImageRequestBinding()),
          GetPage(
              name: Paths.womanUser,
              page: () => const WomanUserPage(),
              binding: WomanUserBinding()),
          GetPage(
              name: Paths.match,
              page: () => const MatchPage(),
              binding: MatchBinding()),
          GetPage(
              name: Paths.application,
              page: () => const ApplicationPage(),
              binding: ApplicationBinding()),
          GetPage(
              name: Paths.analytics,
              page: () => const AnalyticsPage(),
              binding: AnalyticsBinding()),
        ]),
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
        page: () => const DailyCardPage(),
        binding: DailyCardBinding()),
    GetPage(
        name: Routes.currentCard,
        page: () => const CurrentCardPage(),
        binding: CurrentCardBinding(),
        children: [
          GetPage(
              name: Paths.item,
              page: () => const CurrentCardItemPage(),
              binding: CurrentCardItemBinding())
        ]),
    GetPage(
        name: Routes.createSelfIntroduction,
        page: () => const CreateSelfIntroductionPage(),
        binding: CreateSelfIntroductionBinding(),
        children: [
          GetPage(
              name: Paths.preview,
              page: () => const PreviewSelfIntroductionPage())
        ]),
    GetPage(
        name: Routes.selfIntroductionItem,
        page: () => const SelfIntroductionItemPage(),
        binding: SelfIntroductionItemBinding(),
        children: [
          GetPage(
              name: Paths.previewMyProfile,
              page: () => const PreviewMyProfilePage(),
              binding: PreviewMyProfileBinding(),)
        ]),
    GetPage(
        name: Routes.mySelfIntroduction,
        page: () => const MySelfIntroductionPage(),
        binding: MySelfIntroductionBinding(),
        children: [
          GetPage(
            name: Paths.checkOppositeProfile,
            page: () => const CheckOppositeProfilePage())
        ]),
    GetPage(name: Routes.termsOfUse, page: () => const TermsOfUsePage()),
    GetPage(name: Routes.privacy, page: () => const PrivacyPage()),
    GetPage(name: Routes.setting, page: () => const SettingPage(), children: [
      GetPage(name: Paths.businessInfo, page: () => const BusinessInfoPage()),
      GetPage(name: Paths.inquire, page: () => const InquirePage()),
      GetPage(name: Paths.updates, page: () => const UpdatesPage()),
      GetPage(name: Paths.questions, page: () => const QuestionsPage()),
    ]),
    GetPage(
        name: Routes.store,
        page: () => const StorePage(),
        // children: [
        //   GetPage(
        //       name: Paths.success,
        //       page: () => const StoreSuccessPage(),
        //       binding: StoreSuccessBinding()),
        //   GetPage(
        //       name: Paths.fail,
        //       page: () => const StoreFailPage(),
        //       binding: StoreFailBinding()),
        //   GetPage(
        //       name: Paths.history,
        //       page: () => const StoreHistoryPage(),
        //       binding: StoreHistoryBinding()),
        // ]
    ),
  ];
}
