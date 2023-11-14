import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/fonts.dart';

class ImageViewBox extends StatelessWidget {
  final String url;
  final double? width, height;
  final bool isBlurred;
  final double borderRadius;
  final double blurValue;

  const ImageViewBox(
      {Key? key,
      this.width,
      this.height,
      required this.url,
      this.isBlurred = false,
      this.borderRadius = 10,
      this.blurValue = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //필터에 clip 처리 어케할지 봐바 web, mobile 차이 때문에 웹에서 일단 뺌
    return kIsWeb
        ? ImageFiltered(
            imageFilter: ImageFilter.blur(
                sigmaX: isBlurred ? 25.0 : 0, sigmaY: isBlurred ? 25.0 : 0),
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
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Blur(
                blur: isBlurred ? blurValue : 0,
                colorOpacity: isBlurred ? 0.2 : 0,
                // blurColor: Colors.white,
                child: CachedNetworkImage(
                  imageUrl: url,
                  width: width ?? Get.width * 0.4,
                  height: height ?? Get.width * 0.4,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    width: width ?? Get.width * 0.4,
                    height: height ?? Get.width * 0.4,
                    color: Colors.purple.withOpacity(0.1),
                    child: const Center(child: Text('error')),
                  ),
                )),
          );
  }
}
