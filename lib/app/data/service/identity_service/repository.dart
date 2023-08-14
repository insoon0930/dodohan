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

  Future<Identity> create(Identity identity, WriteBatch? batch) async {
    try {
      final doc = firestore.collection('identities').doc();
      identity.id = doc.id;
      if (batch == null) {
        await doc.set(identity.toJson());
      } else {
        batch.set(doc, identity.toJson());
      }
      return identity;
    } catch (e) {
      rethrow;
    }
  }

  Future<Identity> findOneConfirmed(String user) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('identities')
          .where('user', isEqualTo: user)
          .get();
      List<Identity> identities = querySnapshot.docs.map((e) => Identity.fromJson(e.data() as Map<String, dynamic>)).toList();
      return identities.firstWhere((e) => e.status == IdStatus.confirmed);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Identity>> findWaiting() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('identities')
          .where('status', isEqualTo: IdStatus.waiting.name)
          .get();
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