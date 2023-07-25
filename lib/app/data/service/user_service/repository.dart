import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/provider/api_service.dart';
import '../../model/user.dart';
class UserRepository extends ApiService {
  static UserRepository get to => Get.find<UserRepository>();

  Future<User> create(User user) async {
    try {
      final ref = await firestore.collection('users').add(user.toJson());
      await ref.update({'id': ref.id});
      final snapshot = await ref.get();
      return User.fromJson(snapshot.data()!);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> findOneByUid(String uid) async {
    try {
      print('???: $uid');
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();
      print('!!!: $querySnapshot');
      print('!!!: ${querySnapshot.docs}');
      print('!!!: ${querySnapshot.docs.first}');
      return User.fromJson(querySnapshot.docs.first as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }
}