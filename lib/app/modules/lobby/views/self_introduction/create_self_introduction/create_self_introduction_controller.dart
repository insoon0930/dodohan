import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../data/model/self_introduction.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/model/you_info.dart';
import '../../../../../data/service/you_info_service/service.dart';

class CreateSelfIntroductionPageController extends GetxController {
  final Rxn<XFile> image = Rxn<XFile>();
  final Rx<SelfIntroduction> selfIntroduction = SelfIntroduction().obs;

  // final YouInfoService _youInfoService = YouInfoService();
  //
  // Rx<YouInfo> youInfo = YouInfo().obs;
  //
  // User get user => AuthService.to.user.value;
  // int? get minHeight => youInfo.value.minHeight;
  // int? get maxHeight => youInfo.value.maxHeight;
  // int? get minAge => youInfo.value.minAge;
  // int? get maxAge => youInfo.value.maxAge;
  //
  // @override
  // Future<void> onInit() async {
  //   youInfo.value = await _youInfoService.findOne(user.id);
  //   super.onInit();
  // }
  //
  // Future<void> updateYouInfo() async {
  //   await _youInfoService.updateOne(youInfo.value.id!, youInfo.value);
  //   Get.back();
  //   return;
  // }
}

