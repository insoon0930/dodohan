import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../../core/utils/utility.dart';
import '../dialogs/select/select_dialog.dart';
import '../dialogs/select/select_dialog_item.dart';

class ImagePickBox extends StatelessWidget {
  final XFile? file;
  final Function addedCallback;
  final Function deletedCallback;

  const ImagePickBox(
      {required this.file,
      required this.addedCallback,
      required this.deletedCallback,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _getDialog(),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: ThemeColors.grayLightest, width: 1),
            color: file == null ? ThemeColors.cream : Colors.transparent),
        child: file == null
            ? Center(child: SvgPicture.asset('assets/add.svg'))
            : _image(),
      ),
    );
  }

  Widget _image() => ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(9)),
      child: kIsWeb
          ? FutureBuilder<Uint8List>(
              future: file!.readAsBytes(),
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Image.memory(snapshot.data!,
                      fit: BoxFit.cover, filterQuality: FilterQuality.high);
                }
              },
            )
          : Image.file(File(file!.path),
              width: 150, height: 150, fit: BoxFit.cover));

  _getDialog() => Get.dialog(SelectDialog(itemHeight: 60, items: [
    SelectDialogItem(
        text: '카메라',
        onTap: () async {
          Get.back();
          XFile? result = await Utility.getImage(source: ImageSource.camera);
          if (result != null) {
            addedCallback(result);
            // added(result);
            // controller.profileImage.value = file;
          }
        },
        first: true,
        style: ThemeFonts.semiBold.getTextStyle(size: 15)),
    SelectDialogItem(
        text: '사진',
        onTap: () async {
          Get.back();
          XFile? result = await Utility.getImage(source: ImageSource.gallery);
          if (result != null) {
            addedCallback(result);
            // added(result);
          }
        },
        style: ThemeFonts.semiBold.getTextStyle(size: 15)),
    SelectDialogItem(
        text: '삭제',
        onTap: () {
          Get.back();
          deletedCallback();
        },
        last: true,
        style: ThemeFonts.medium.getTextStyle(size: 15, color: ThemeColors.redLight)),
  ]));
}
