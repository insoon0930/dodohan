import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewBox extends StatelessWidget {
  final String url;
  double? width, height;

  ImageViewBox({Key? key, this.width, this.height, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width ?? Get.width * 0.4,
      height: height ?? Get.width * 0.4,
      fit: BoxFit.cover,
      errorBuilder: (context, url, error) => Container(
        width: width ?? Get.width * 0.4,
        height: height ?? Get.width * 0.4,
        color: Colors.purple.withOpacity(0.1),
        child: const Center(child: Text('error')),
      ),
    );
  }
}
