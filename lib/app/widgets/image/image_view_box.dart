import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewBox extends StatelessWidget {
  final String url;
  final double? width, height;
  final bool isBlurred;

  const ImageViewBox({Key? key, this.width, this.height, required this.url, this.isBlurred = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Image.network(
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
        ),
      ),
    );
  }
}
