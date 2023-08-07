import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stamp_now/app/data/provider/api_service.dart';
import 'package:stamp_now/core/services/auth_service.dart';
import 'package:stamp_now/core/utils/utility.dart';
import '../enums.dart';
import 'dart:io' as io;

class StorageService extends ApiService {
  final AuthService authService = Get.find();

  // Future<List<String>> uploadFiles(List<XFile> files, StorageBucket bucket) async {
  //   List<String> resultList = [];
  //
  //   await Future.forEach(files, (XFile file) async {
  //     String? uploadedUrl;
  //     uploadedUrl = await uploadFile(
  //       filePath: file.path,
  //       randomString: Utility.randomString(10),
  //       bucket: bucket,
  //       id: authService.user.value.id,
  //     );
  //     resultList.add(uploadedUrl);
  //   });
  //   return Future.value(resultList);
  // }

  Future<String> uploadFile({
    required XFile file,
    required StorageBucket bucket,
    required String userId,
  }) async {
    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child(bucket.name)
        .child('/$userId-${Utility.randomString(8)}.jpg');
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      await ref.putData(await file.readAsBytes(), metadata);
    } else {
      //추후) 문제해결
      await ref.putFile(io.File(file.path), metadata);
    }
    return await ref.getDownloadURL();
  }
}