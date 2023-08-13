import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stamp_now/app/data/enums.dart';

import '../../../data/provider/api_service.dart';
import '../../model/image_update_request.dart';
class ImageUpdateRequestRepository extends ApiService {

  ImageUpdateRequestRepository._privateConstructor();
  static final ImageUpdateRequestRepository _instance = ImageUpdateRequestRepository._privateConstructor();
  factory ImageUpdateRequestRepository() {
    return _instance;
  }

  Future<ImageUpdateRequest> create(ImageUpdateRequest imageUpdateRequest) async {
    try {
      final doc = firestore.collection('imageUpdateRequests').doc();
      imageUpdateRequest.id = doc.id;
      await doc.set(imageUpdateRequest.toJson());
      return imageUpdateRequest;
    } catch (e) {
      rethrow;
    }
  }

  Future<ImageUpdateRequest?> findOneWaiting(String user) async {
    try {
      QuerySnapshot querySnapshot =
      await firestore.collection('imageUpdateRequests')
          .where('user', isEqualTo: user)
          .where('status', isEqualTo: IdStatus.waiting.name)
          .get();
      return ImageUpdateRequest.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<List<ImageUpdateRequest>> findWaiting() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('imageUpdateRequests')
          .where('status', isEqualTo: IdStatus.waiting.name)
          .get();
      return querySnapshot.docs.map((e) => ImageUpdateRequest.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> updateStatus(String id, IdStatus idStatus) async {
    try {
      final DocumentReference ref = firestore.collection('imageUpdateRequests').doc(id);
      await ref.update({'status': idStatus.name});
      return;
    } catch (e) {
      rethrow;
    }
  }
}