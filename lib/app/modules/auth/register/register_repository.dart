
import '../../../data/model/user.dart';
import '../../../data/provider/api_service.dart';

class RegisterRepository extends ApiService {
  Future<User> createUser(User user) async {
    try {
      final ref = await firestore.collection('users').add(user.toJson());
      await ref.update({'id': ref.id});
      final snapshot = await ref.get();
      return User.fromJson(snapshot.data()!);
    } catch (e) {
      rethrow;
    }
  }
}
