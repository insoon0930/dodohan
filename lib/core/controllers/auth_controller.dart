import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/provider/api_service.dart';

import '../../app/data/model/user.dart';
import '../../routes/app_routes.dart';

enum CameraSetting { saveOriginal, saveImmediately, cameraImmediately }
enum StampSetting { color, stamp, time, format }

class AuthController extends ApiService {
  static AuthController get to => Get.find<AuthController>();

  Rx<User> user = User().obs;

  void updateUser(User newUser) {
    user.value = newUser;
  }

  // Future<User> createUser(User user) async {
  //   try {
  //     //todo phoneNum, uid, isMan 이렇게 세개 넣자 그리고 이거 다음으로 isMan 설정하면 가입완료 ㄱㄱ
  //     final ref = await firestore.collection('users').add(user.toJson());
  //     await ref.update({'id': ref.id});
  //     final snapshot = await ref.get();
  //     return User.fromJson(snapshot.data()!);
  //   } catch (e) {
  //     print('create e: $e');
  //     rethrow;
  //   }
  // }

  Future<User?> findOneByUid(String uid) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();
      return User.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      print('findOneByUid e: $e');
      return null;
    }
  }

  //todo 추후 회원 가입 단계에서 uid 저장하기
  Future<void> loginByUid(String uid, {Function? callback}) async {
    User? user = await findOneByUid(uid);
    if (user != null) {
      updateUser(user);
      Get.offAllNamed(Routes.meInfo);
    } else {
      Get.offAllNamed(Routes.meInfo);
    }
    return;
  }

}