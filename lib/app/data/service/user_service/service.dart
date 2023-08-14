import 'package:stamp_now/app/data/model/me_info.dart';
import 'package:stamp_now/app/data/service/user_service/repository.dart';
import '../../enums.dart';
import '../../model/user.dart';
import '../me_info_service/repository.dart';

class UserService {
  final UserRepository _userRepository = UserRepository();

  UserService._privateConstructor();
  static final UserService _instance = UserService._privateConstructor();
  factory UserService() {
    return _instance;
  }

  //@Post
  Future<User> create(User user) async {
    return await _userRepository.create(user);
  }

  //@Get
  Future<User?> findOne(String id) async {
    User? user = await _userRepository.findOne(id);
    return user;
  }

  //@Get
  Future<User?> findOneByUid(String uid) async {
    return await _userRepository.findOneByUid(uid);
  }

  //@Patch
  Future<void> updateDeletedAt(String userId) async {
    return await _userRepository.updateDeletedAt(userId);
  }
}
