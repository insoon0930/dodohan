import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/provider/api_service.dart';
import '../../enums.dart';
import '../../model/identity.dart';
import '../../model/user.dart';
class UserRepository extends ApiService {

  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();
  factory UserRepository() {
    return _instance;
  }

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

  Future<User?> findOne(String id) async {
    try {
      DocumentSnapshot userSnapshot = await firestore.collection('users').doc(id).get();
      return User.fromJson(userSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<User?> findOneByUid(String uid) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('uid', isEqualTo: uid)
          .where('deletedAt', isNull: true)
          .get();
      return User.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<void> updateIdStatus(String userId, IdStatus idStatus) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      await ref.update({'idStatus': idStatus.name});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfileImage(String userId, String url) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      await ref.update({'profileImage': url});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateIsMan(String userId, bool isMan) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      await ref.update({'isMan': isMan});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> confirmed(Identity identity) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(identity.user);
      await ref.update({
        'idStatus': IdStatus.confirmed.name,
        'profileImage': identity.profileImage,
        'isMan': identity.isMan,
      });
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> rejected(Identity identity) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(identity.user);
      ref.update({'idStatus': IdStatus.rejected.name});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDeletedAt(String userId) async {
    try {
      final DocumentReference ref = firestore.collection('users').doc(userId);
      ref.update({'deletedAt': DateTime.now()});
      return;
    } catch (e) {
      rethrow;
    }
  }

}