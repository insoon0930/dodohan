import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stamp_now/app/data/provider/api_service.dart';

import '../../app/data/model/user.dart';
import '../../app/data/service/user_service/repository.dart';
import '../../app/data/service/user_service/service.dart';
import '../../routes/app_routes.dart';

class AuthService extends ApiService {
  static AuthService get to => Get.find<AuthService>();

  final UserService _userService;

  AuthService(this._userService);

  Rx<User> user = User().obs;

  void updateUser(User newUser) {
    user.value = newUser;
  }

  Future<User> createUser(User user) async {
    try {
      //todo phoneNum, uid, isMan 이렇게 세개 넣자 그리고 이거 다음으로 isMan 설정하면 가입완료 ㄱㄱ
      return await _userService.create(user);
    } catch (e) {
      print('create e: $e');
      rethrow;
    }
  }

  //todo 추후 회원 가입 단계에서 uid 저장하기
  Future<void> loginByUid(String uid, {Function? callback}) async {
    print('a');
    User? user = await _userService.findOneByUid(uid);
    print('b: $user');
    updateUser(user!);
    print('c: ');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
    print('d: ');
    Get.offAllNamed(Routes.meInfo);
    print('e: ');
    return;
  }
}