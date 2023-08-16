import 'package:stamp_now/app/data/service/match_service/repository.dart';
import '../../enums.dart';
import '../../model/match.dart';
import '../../model/user.dart';
import '../user_service/repository.dart';

class MatchService {
  final MatchRepository _matchRepository = MatchRepository();
  final UserRepository _userRepository = UserRepository();

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
  Future<List<Map<String, String>>> findTwoWeeks() async {
    List<Match> matches = await _matchRepository.findTwoWeeks();
    List<Map<String, String>> matchProfiles = await Future.wait(matches.map((match) async {
      User? man = await _userRepository.findOne(match.man);
      print('man: $man');
      User? woman = await _userRepository.findOne(match.woman);
      print('woman: $woman');
      return {'man': man!.profileImage, 'woman': woman!.profileImage};
    }));
    return matchProfiles;
  }

  //@Patch
  Future<void> updateMatchStatus(String docId, bool isMan, MatchStatus newStatus) async {
    return await _matchRepository.updateMatchStatus(docId, isMan, newStatus);
  }
}
