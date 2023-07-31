import 'package:stamp_now/app/data/service/identity_service/repository.dart';
import '../../enums.dart';
import '../../model/identity.dart';
import '../../model/me_info.dart';
import '../../model/you_info.dart';
import '../me_info_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class IdentityService {
  final IdentityRepository _identityRepository = IdentityRepository();
  final UserRepository _userRepository = UserRepository();
  final MeInfoRepository _meInfoRepository = MeInfoRepository();
  final YouInfoRepository _youInfoRepository = YouInfoRepository();

  IdentityService._privateConstructor();
  static final IdentityService _instance = IdentityService._privateConstructor();
  factory IdentityService() {
    return _instance;
  }

  //@Post
  Future<Identity> create(Identity identity) async {
    Identity res = await _identityRepository.create(identity);
    await _userRepository.updateIdStatus(identity.user, IdStatus.waiting);
    return res;
  }

  //@Get
  Future<Identity?> findOne(String id) async {
    return await _identityRepository.findOne(id);
  }

  //@Get
  Future<List<Identity>> findWaiting() async {
    return await _identityRepository.findWaiting();
  }

  //@Patch
  Future<void> updateStatus(String id, IdStatus idStatus) async {
    return await _identityRepository.updateStatus(id, idStatus);
  }

  //@Patch
  Future<void> confirmed(Identity identity) async {
    await _identityRepository.updateStatus(identity.id, IdStatus.confirmed);
    await _userRepository.confirmed(identity);
    await _meInfoRepository.create(MeInfo(user: identity.user, isMan: identity.isMan));
    await _youInfoRepository.create(YouInfo(user: identity.user));
    return;
  }

  //@Patch
  Future<void> rejected(Identity identity) async {
    await _identityRepository.updateStatus(identity.id, IdStatus.rejected);
    await _userRepository.rejected(identity);
    return;
  }
}
