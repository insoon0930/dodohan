import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stamp_now/app/data/provider/api_service.dart';

import '../../app/data/model/user.dart';
import '../../app/data/service/user_service/repository.dart';
import '../../app/data/service/user_service/service.dart';
import '../../routes/app_routes.dart';
import '../utils/utility.dart';

class AuthService extends ApiService {
  static AuthService get to => Get.find<AuthService>();

  final UserService _userService;

  AuthService(this._userService);

  Rx<User> user = User().obs;

  Future<User> updateUser(User newUser) async {
    user.value = newUser;
    return user.value;
  }

  Future<User> registerUser(User user, String uid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
    user.uid = uid;
    User res = await _userService.create(user);
    return await updateUser(res);
  }

  //todo 추후 회원 가입 단계에서 uid 저장하기
  Future<void> loginByUid(String uid) async {
    print('a');
    User? res = await _userService.findOneByUid(uid);
    print('a!@ : $res');
    final prefs = await SharedPreferences.getInstance();
    if(res == null) {
      //특이 케이스인듯? firebase auth 에는 있는데 디비에는 없는 (실수로 삭제?)
      User res = await registerUser(user.value, uid);
      prefs.setString('uid', res.uid);
    } else {
      updateUser(res);
      prefs.setString('uid', uid);
    }
    print('d: ');
    Get.offAllNamed(Routes.home);
    print('e: ');
    return;
  }
}