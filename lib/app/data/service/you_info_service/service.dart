import 'package:dodohan/app/data/service/you_info_service/repository.dart';
import '../../model/you_info.dart';

class YouInfoService {
  final YouInfoRepository _youInfoRepository = YouInfoRepository();

  YouInfoService._privateConstructor();
  static final YouInfoService _instance = YouInfoService._privateConstructor();
  factory YouInfoService() {
    return _instance;
  }

  // Future<YouInfo> create(YouInfo youInfo) async {
  //   return await _youInfoRepository.create(youInfo);
  // }

  //@Get
  Future<YouInfo> findOne(String user) async {
    YouInfo youInfo = await _youInfoRepository.findOne(user);
    return youInfo;
  }

  //@Patch
  Future<void> updateOne(String docId, YouInfo newYouInfo) async {
    await _youInfoRepository.updateOne(docId, newYouInfo);
    return;
  }

  //@Patch
  Future<void> updateBodyShapeType() async {
    await _youInfoRepository.updateBodyShapeType();
    return;
  }
}
