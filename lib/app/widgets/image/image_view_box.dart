import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewBox extends StatelessWidget {
  final String url;

  const ImageViewBox({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('url?? :$url');
    return Image.network(
      url,
      width: Get.width * 0.4,
      height: Get.width * 0.4,
      fit: BoxFit.cover,
      errorBuilder: (context, url, error) => Container(
        width: Get.width * 0.4,
        height: Get.width * 0.4,
        color: Colors.purple.withOpacity(0.1),
        child: const Text('error'),
      ),
    );
  }
}
