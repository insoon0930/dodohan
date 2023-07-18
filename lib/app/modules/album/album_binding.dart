import 'package:get/get.dart';
import 'album_controller.dart';
import 'album_repository.dart';

class AlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AlbumController(repo: AlbumRepository()));
  }
}