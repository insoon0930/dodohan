import 'package:stamp_now/app/data/service/identity_service/repository.dart';
import '../../eums.dart';
import '../../model/identity.dart';

class IdentityService {
  final IdentityRepository _identityRepository = IdentityRepository();

  IdentityService._privateConstructor();
  static final IdentityService _instance = IdentityService._privateConstructor();
  factory IdentityService() {
    return _instance;
  }

  //@Post
  Future<Identity> create(Identity identity) async {
    return await _identityRepository.create(identity);
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
}
