import 'package:get/get.dart';
import '../../data/model/user.dart';
import '../../../core/controllers/auth_controller.dart';
import 'home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repo;
  HomeController({required this.repo});

}

