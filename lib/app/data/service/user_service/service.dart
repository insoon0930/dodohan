import 'package:stamp_now/app/data/model/me_info.dart';
import 'package:stamp_now/app/data/service/user_service/repository.dart';
import '../../enums.dart';
import '../../model/user.dart';
import '../application_service/repository.dart';
import '../me_info_service/repository.dart';

class UserService {
  final UserRepository _userRepository = UserRepository();
  final ApplicationRepository _applicationRepository = ApplicationRepository();

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

  //@Get
  Future<List<User>> findWomen() async {
    return await _userRepository.findWomen();
  }

  //@Get
  Future<Map<String, int>> findUserNum({bool isDeleted = false}) async {
    return await _userRepository.findUserNum(isDeleted);
  }

  //@Patch
  Future<void> updateDeletedAt(String userId) async {
    await _applicationRepository.deleteMany(userId);
    return await _userRepository.updateDeletedAt(userId);
  }
}
