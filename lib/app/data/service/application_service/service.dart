import 'package:dodohan/app/data/dto/admin_application.dart';
import 'package:dodohan/app/data/service/application_service/repository.dart';
import '../../enums.dart';
import '../../model/application.dart';
import '../../model/me_info.dart';
import '../../model/user.dart';
import '../../model/you_info.dart';
import '../me_info_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class ApplicationService {
  final ApplicationRepository _applicationRepository = ApplicationRepository();
  final UserRepository _userRepository = UserRepository();

  ApplicationService._privateConstructor();
  static final ApplicationService _instance = ApplicationService._privateConstructor();
  factory ApplicationService() {
    return _instance;
  }

  //@Post
  Future<Application> create(MeInfo meInfo, YouInfo youInfo) async {
    return await _applicationRepository.create(
        Application(user: meInfo.user!, meInfo: meInfo, youInfo: youInfo));
  }

  //@Get
  Stream<int> getApplicantsNumStream() {
    return _applicationRepository.getApplicantsNumStream();
  }

  //@Get
  Future<bool> isAlreadyApplied(String user) async {
    Application? application = await _applicationRepository.findThisWeekOne(user);
    if(application == null) {
      return false;
    } else {
      return true;
    }
  }

  //@Get
  Future<List<AdminApplication>> findThisWeeks() async {
    List<Application> applications = await _applicationRepository.findThisWeekMany();
    List<AdminApplication> adminApplications = await Future.wait(applications.map((application) async {
      User? user = await _userRepository.findOne(application.user!);
      return AdminApplication(application: application, profileImage: user!.profileImage);
    }));
    return adminApplications;
  }

  //@Path
  Future<void> updateBodyShapeType() async {
    await _applicationRepository.updateBodyShapeType();
    return;
  }
}
