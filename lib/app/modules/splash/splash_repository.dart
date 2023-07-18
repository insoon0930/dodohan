import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/model/user.dart';
import '../../data/provider/api_service.dart';

class SplashRepository extends ApiService {
  Future<User> createUser(User user) async {
    try {
      final ref = await firestore.collection('users').add(user.toJson());
      await ref.update({'id': ref.id});
      final snapshot = await ref.get();
      return User.fromJson(snapshot.data()!);
    } catch (e) {
      print('create e: $e');
      rethrow;
    }
  }

  Future<User?> findOneByUid(String uid) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();
      return User.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      print('findOneByUid e: $e');
      return null;
    }
  }

//todo 회원가입을 firebase auth email로 진행하는건 어때? 혹은 전환번호
// final FirebaseAuth _auth = FirebaseAuth.instance;
//
// Future<AuthResult> loginWithEmailAndPassword(String email, String password) async {
//   try {
//     return await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   } catch (e) {
//     throw e;
//   }
// }
//
// Future<AuthResult> signUpWithEmailAndPassword(String email, String password) async {
//   try {
//     return await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   } catch (e) {
//     throw e;
//   }
// }
//
// Future<void> signOut() async {
//   try {
//     return await _auth.signOut();
//   } catch (e) {
//     throw e;
//   }
// }
}
