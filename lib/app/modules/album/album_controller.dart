import '../../../core/controllers/auth_controller.dart';
import 'album_repository.dart';

class AlbumController extends AuthController {
  final AlbumRepository repo;
  AlbumController({required this.repo});

}

