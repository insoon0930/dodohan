import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/service/identity_service/repository.dart';
import '../../enums.dart';
import '../../model/identity.dart';
import '../../model/me_info.dart';
import '../../model/you_info.dart';
import '../../provider/api_service.dart';
import '../me_info_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class IdentityService extends ApiService  {
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
    final WriteBatch batch = firestore.batch();
    Identity res = await _identityRepository.create(identity, batch);
    await _userRepository.updateIdStatus(identity.user, IdStatus.waiting, batch);
    await batch.commit();
    return res;
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
    await _userRepository.idConfirmed(identity);
    await _meInfoRepository.create(MeInfo(user: identity.user, isMan: identity.isMan, univ: identity.univ));
    await _youInfoRepository.create(YouInfo(user: identity.user, univ: identity.univ));
    return;
  }

  //@Patch
  Future<void> rejected(Identity identity) async {
    await _identityRepository.updateStatus(identity.id, IdStatus.rejected);
    await _userRepository.idRejected(identity);
    return;
  }
}
