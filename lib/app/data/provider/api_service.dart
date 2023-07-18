import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get firestore => _firestore;

  // @override
  // void onReady() {
  //   // Initialize the instance of FirebaseFirestore
  // }
}