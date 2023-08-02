import 'package:stamp_now/app/data/service/application_service/repository.dart';
import '../../enums.dart';
import '../../model/application.dart';
import '../../model/me_info.dart';
import '../../model/you_info.dart';
import '../me_info_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class ApplicationService {
  final ApplicationRepository _applicationRepository = ApplicationRepository();
  final UserRepository _userRepository = UserRepository();
  final MeInfoRepository _meInfoRepository = MeInfoRepository();
  final YouInfoRepository _youInfoRepository = YouInfoRepository();

  ApplicationService._privateConstructor();
  static final ApplicationService _instance = ApplicationService._privateConstructor();
  factory ApplicationService() {
    return _instance;
  }

  //@Post
  Future<Application> create(MeInfo meInfo, YouInfo youInfo) async {
    print('meInfo: $meInfo');
    print('youInfo: $youInfo');
    return await _applicationRepository.create(
        Application(user: meInfo.user, meInfo: meInfo, youInfo: youInfo));
  }

  // //@Get
  // Future<Application?> findOne(String id) async {
  //   return await _applicationRepository.findOne(id);
  // }
  //
  // //@Get
  // Future<List<Application>> findWaiting() async {
  //   return await _applicationRepository.findWaiting();
  // }
  //
  // //@Patch
  // Future<void> updateStatus(String id, IdStatus idStatus) async {
  //   return await _applicationRepository.updateStatus(id, idStatus);
  // }
  //
  // //@Patch
  // Future<void> confirmed(Application application) async {
  //   await _applicationRepository.updateStatus(application.id, IdStatus.confirmed);
  //   await _userRepository.confirmed(application);
  //   await _meInfoRepository.create(MeInfo(user: application.user, isMan: application.isMan));
  //   await _youInfoRepository.create(YouInfo(user: application.user));
  //   return;
  // }
  //
  // //@Patch
  // Future<void> rejected(Application application) async {
  //   await _applicationRepository.updateStatus(application.id, IdStatus.rejected);
  //   await _userRepository.rejected(application);
  //   return;
  // }
}
