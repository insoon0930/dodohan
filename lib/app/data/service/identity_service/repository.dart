import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/enums.dart';

import '../../../data/provider/api_service.dart';
import '../../model/identity.dart';
class IdentityRepository extends ApiService {

  IdentityRepository._privateConstructor();
  static final IdentityRepository _instance = IdentityRepository._privateConstructor();
  factory IdentityRepository() {
    return _instance;
  }

  Future<Identity> create(Identity identity) async {
    try {
      final ref = await firestore.collection('identities').add(identity.toJson());
      await ref.update({'id': ref.id});
      final snapshot = await ref.get();
      return Identity.fromJson(snapshot.data()!);
    } catch (e) {
      rethrow;
    }
  }

  Future<Identity?> findOne(String id) async {
    try {
      DocumentSnapshot identitySnapshot = await firestore.collection('identities').doc(id).get();
      return Identity.fromJson(identitySnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<List<Identity>> findWaiting() async {
    try {
      print('findWaiting');
      QuerySnapshot querySnapshot = await firestore
          .collection('identities')
          .where('status', isEqualTo: IdStatus.waiting.name)
          .get();
      print('querySnapshot.docs : ${querySnapshot.docs}');
      print('??????????? : ${querySnapshot.docs.map((e) => Identity.fromJson(e.data() as Map<String, dynamic>)).toList()}');
      return querySnapshot.docs.map((e) => Identity.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> updateStatus(String id, IdStatus idStatus) async {
    try {
      final DocumentReference ref = firestore.collection('identities').doc(id);
      await ref.update({'status': idStatus.name});
      return;
    } catch (e) {
      rethrow;
    }
  }
}