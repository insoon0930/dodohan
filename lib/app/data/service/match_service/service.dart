import 'package:dodohan/app/data/service/match_service/repository.dart';
import '../../dto/admin_match.dart';
import '../../enums.dart';
import '../../model/application.dart';
import '../../model/match.dart';
import '../../model/user.dart';
import '../application_service/repository.dart';
import '../user_service/repository.dart';

class MatchService {
  final MatchRepository _matchRepository = MatchRepository();
  final UserRepository _userRepository = UserRepository();
  final ApplicationRepository _applicationRepository = ApplicationRepository();

  MatchService._privateConstructor();
  static final MatchService _instance = MatchService._privateConstructor();
  factory MatchService() {
    return _instance;
  }

  //@Get
  Future<Match?> findOne(String user, bool isMan) async {
    return await _matchRepository.findOne(user, isMan);
  }

  //@Get
  Future<List<AdminMatch>> findTwoWeeks() async {
    List<Match> matches = await _matchRepository.findTwoWeeks();
    List<AdminMatch> matchProfiles = await Future.wait(matches.map((match) async {
      User? man = await _userRepository.findOne(match.man);
      User? woman = await _userRepository.findOne(match.woman);
      Application? manApplication = await _applicationRepository.findThisWeekOne(match.man);
      Application? womanApplication = await _applicationRepository.findThisWeekOne(match.woman);
      return AdminMatch(
          match: match,
          nextWeekManApplication: manApplication,
          nextWeekWomanApplication: womanApplication,
          manProfileImage: man!.profileImage,
          womanProfileImage: woman!.profileImage);
    }));
    return matchProfiles;
  }

  //@Patch
  Future<void> updateMatchStatus(String docId, bool isMan, MatchStatus newStatus) async {
    return await _matchRepository.updateMatchStatus(docId, isMan, newStatus);
  }
}
