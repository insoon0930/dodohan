import 'package:stamp_now/app/data/service/user_service/repository.dart';
import '../../model/user.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<User?> findOneByUid(String uid) async {
    return await _userRepository.findOneByUid(uid);
  }
}
