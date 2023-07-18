import '../../data/provider/api_service.dart';

class HomeRepository extends ApiService {
  // Future<User?> create(User user) async {
  //   try {
  //     final ref = await firestore.collection('users').add(user.toJson());
  //     final snapshot = await ref.get();
  //     return User.fromJson(snapshot.data()!);
  //   } catch (e) {
  //     print('e: $e');
  //     return null;
  //   }
  // }
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
