import '../../data/model/me_info.dart';
import '../../data/provider/api_service.dart';

class MeInfoRepository extends ApiService {
  Future<MeInfo?> create(MeInfo meInfo) async {
    try {
      final ref = await firestore.collection('meInfo').add(meInfo.toJson());
      final snapshot = await ref.get();
      return MeInfo.fromJson(snapshot.data()!);
    } catch (e) {
      print('e: $e');
      return null;
    }
  }
  //
  // Future<User?> findOneByUid(String uid) async {
  //   try {
  //     QuerySnapshot querySnapshot = await firestore
  //         .collection('users')
  //         .where('uid', isEqualTo: uid)
  //         .get();
  //     return User.fromJson(querySnapshot.docs.first as Map<String, dynamic>);
  //   } catch (e) {
  //     print('e: $e');
  //     return null;
  //   }
  // }
}
