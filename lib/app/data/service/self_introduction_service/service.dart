import 'package:dodohan/app/data/model/daily_opened_card.dart';
import 'package:dodohan/app/data/service/daily_card_service/repository.dart';
import 'package:dodohan/app/data/service/self_introduction_service/repository.dart';
import '../../enums.dart';
import '../../model/daily_card.dart';
import '../../model/me_info.dart';
import '../../model/self_application.dart';
import '../../model/self_introduction.dart';
import '../../model/user.dart';
import '../../provider/api_service.dart';
import '../coin_receipt_service/repository.dart';
import '../daily_opened_card_service/repository.dart';
import '../self_application_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class SelfIntroductionService extends ApiService  {
  final SelfIntroductionRepository _selfIntroductionRepository = SelfIntroductionRepository();
  final SelfApplicationRepository _selfApplicationRepository = SelfApplicationRepository();

  SelfIntroductionService._privateConstructor();
  static final SelfIntroductionService _instance = SelfIntroductionService._privateConstructor();
  factory SelfIntroductionService() {
    return _instance;
  }

  //@Post
  Future<SelfIntroduction> create(SelfIntroduction selfIntroduction) async {
    return await _selfIntroductionRepository.create(selfIntroduction);
  }

  //@Patch
  Future<SelfApplication> applyForFree(User user, MeInfo meInfo, String selfIntroductionId) async {
    final SelfApplication selfApplication = await _selfApplicationRepository.create(SelfApplication(
        selfIntroductionId: selfIntroductionId,
        profileImage: user.profileImage,
        phoneNum: user.phoneNum,
        meInfo: meInfo));
    await _selfIntroductionRepository.addSelfApplication(selfIntroductionId, selfApplication);
    return selfApplication;
  }

  //@Patch
  Future<SelfApplication> applyWithCharge(User user, MeInfo meInfo, String selfIntroductionId) async {
    final SelfApplication selfApplication = await _selfApplicationRepository.create(SelfApplication(
        selfIntroductionId: selfIntroductionId,
        profileImage: user.profileImage,
        phoneNum: user.phoneNum,
        meInfo: meInfo,
        status: SelfApplicationStatus.openedByApplicant,
        isPremium: true));
    await _selfIntroductionRepository.addSelfApplication(selfIntroductionId, selfApplication);
    return selfApplication;
  }
}
