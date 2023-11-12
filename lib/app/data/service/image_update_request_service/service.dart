import 'package:dodohan/app/data/service/image_update_request_service/repository.dart';
import '../../enums.dart';
import '../../model/image_update_request.dart';
import '../../provider/api_service.dart';
import '../user_service/repository.dart';

class ImageUpdateRequestService extends ApiService  {
  final ImageUpdateRequestRepository _imageUpdateRequestRepository = ImageUpdateRequestRepository();
  final UserRepository _userRepository = UserRepository();

  ImageUpdateRequestService._privateConstructor();
  static final ImageUpdateRequestService _instance = ImageUpdateRequestService._privateConstructor();
  factory ImageUpdateRequestService() {
    return _instance;
  }

  //@Post
  Future<ImageUpdateRequest> create(ImageUpdateRequest imageUpdateRequest) async {
    ImageUpdateRequest res = await _imageUpdateRequestRepository.create(imageUpdateRequest);
    //todo 코인 차감 해줄껀데 코인영수증 처리도해야지, 반려하면 반환해주자

    //영수증 하나 생성
    return res;
  }

  //@Get
  Future<ImageUpdateRequest?> findOneWaiting(String user) async {
    return await _imageUpdateRequestRepository.findOneWaiting(user);
  }

  //@Get
  Future<List<ImageUpdateRequest>> findWaiting() async {
    return await _imageUpdateRequestRepository.findWaiting();
  }

  //@Patch
  Future<void> updateStatus(String id, IdStatus idStatus) async {
    return await _imageUpdateRequestRepository.updateStatus(id, idStatus);
  }

  //@Patch
  Future<void> confirmed(ImageUpdateRequest imageUpdateRequest) async {
    await _imageUpdateRequestRepository.updateStatus(imageUpdateRequest.id, IdStatus.confirmed);
    await _userRepository.updateProfileImage(imageUpdateRequest.user, imageUpdateRequest.newProfileImage);
    return;
  }

  //@Patch
  Future<void> rejected(ImageUpdateRequest imageUpdateRequest) async {
    await _imageUpdateRequestRepository.updateStatus(imageUpdateRequest.id, IdStatus.rejected);
    return;
  }
}
