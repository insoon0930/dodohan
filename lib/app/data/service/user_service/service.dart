import 'package:stamp_now/app/data/service/user_service/repository.dart';
import '../../model/user.dart';

class UserService {
  final UserRepository _userRepository = UserRepository();

  UserService._privateConstructor();
  static final UserService _instance = UserService._privateConstructor();
  factory UserService() {
    return _instance;
  }

  // Future<User?> findOne(String id) async {
  //   User? user = await _userRepository.findOne(id);
  //   return user;
  // }

  Future<User?> findOneByUid(String uid) async {
    return await _userRepository.findOneByUid(uid);
  }

  Future<User> create(User user) async {
    return await _userRepository.create(user);
  }
}
