import 'package:dodohan/app/data/service/me_info_service/repository.dart';
import '../../model/me_info.dart';

class MeInfoService {
  final MeInfoRepository _meInfoRepository = MeInfoRepository();

  MeInfoService._privateConstructor();
  static final MeInfoService _instance = MeInfoService._privateConstructor();
  factory MeInfoService() {
    return _instance;
  }

  // Future<MeInfo> create(MeInfo meInfo) async {
  //   return await _meInfoRepository.create(meInfo);
  // }

  //@Get
  Future<MeInfo> findOne(String user) async {
    MeInfo meInfo = await _meInfoRepository.findOne(user);
    return meInfo;
  }

  //@Patch
  Future<void> updateOne(String docId, MeInfo newMeInfo) async {
    await _meInfoRepository.updateOne(docId, newMeInfo);
    return;
  }

}
