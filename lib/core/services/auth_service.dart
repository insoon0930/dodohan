import 'dart:io';

import 'package:dodohan/core/services/push_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dodohan/app/data/provider/api_service.dart';
import '../../app/data/enums.dart';
import '../../app/data/model/user.dart';
import '../../app/data/service/user_service/service.dart';
import '../../app/widgets/dialogs/force_update_dialog.dart';
import '../../routes/app_routes.dart';

class AuthService extends ApiService {
  static AuthService get to => Get.find<AuthService>();

  final UserService _userService;

  AuthService(this._userService);

  Rx<User> user = User().obs;

  bool get isAdmin => user.value.phoneNum =='+821066192550';
  // bool get isAdmin => user.value.phoneNum =='+821012341234' || user.value.phoneNum =='+821066192550';

  Future<User> updateUser(User newUser) async {
    user.value = newUser;
    return user.value;
  }

  Future<User> registerUser(User user, String uid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
    user.uid = uid;
    user.coin = 10;
    user.isAndroid = Platform.isAndroid;
    User res = await _userService.create(user);
    return await updateUser(res);
  }

  Future<void> loginByUid(String uid) async {
    bool needForceUpdate = await checkForceUpdate();
    if(needForceUpdate) {
      Get.dialog(const ForceUpdateDialog());
      return;
    }

    User? res = await _userService.findOneByUid(uid);
    final prefs = await SharedPreferences.getInstance();
    if (res == null) {
      //특이 케이스인듯? firebase auth 에는 있는데 디비에는 없는 (실수로 삭제?)
      User res = await registerUser(user.value, uid);
      prefs.setString('uid', res.uid);
    } else {
      updateUser(res);
      prefs.setString('uid', uid);
    }

    _userService.updateLastVisitedAt(user.value.id);
    Get.back();
    if (user.value.idStatus == null ||
        user.value.idStatus == IdStatus.rejected) {
      Get.offAllNamed(Routes.register);
      return;
    } else if (user.value.idStatus == IdStatus.waiting) {
      Get.offAllNamed(Routes.waiting);
      return;
    } else if (user.value.idStatus == IdStatus.confirmed) {
      FcmService.to.init();
      Get.offAllNamed(Routes.lobby);
      1.delay().then((value) => _reviewRequest(user.value));
      return;
    }
    return;
  }

  Future<void> logOut() async {
    user.value = User();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('uid');
    Get.offAllNamed(Routes.loginBy);
    return;
  }

  Future<void> withdraw() async {
    await _userService.updateDeletedAt(user.value.id);
    await logOut();
    return;
  }

  Future<FirebaseRemoteConfig> remoteConfigFetchAndActivate() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 20),
      minimumFetchInterval: const Duration(hours: 6),
    ));
    await remoteConfig.fetchAndActivate();
    return remoteConfig;
  }

  Future<bool> checkForceUpdate() async {
    final FirebaseRemoteConfig remoteConfig = await remoteConfigFetchAndActivate();
    String minVersion = remoteConfig.getString('minVersion');
    // String latestAppVersion = remoteConfig.getString('latest_version'); //업데이트 권유 넣을꺼면 사용

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;
    String currentvDashremoved = currentVersion.split('-')[0];
    List<String> currentV = currentvDashremoved.split('.');
    List<String> minAppV = minVersion.split('.');
    bool needForceUpdate = false;

    for (var i = 0 ; i <= 2; i++) {
      needForceUpdate = int.parse(minAppV[i]) > int.parse(currentV[i]);
      if (int.parse(minAppV[i]) != int.parse(currentV[i])) break;
    }

    return needForceUpdate;
  }

  Future<void> _reviewRequest(User user) async {
    final InAppReview inAppReview = InAppReview.instance;
    bool isAvailable = await inAppReview.isAvailable();
    Duration diff = DateTime.now().difference(user.reviewRequestedAt ?? user.createdAt!);
    if(isAvailable && diff.inDays > 7) {
      inAppReview.requestReview();
      _userService.updateReviewRequestedAt(user.id);
    }
  }
}
