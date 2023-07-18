import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stamp_now/core/theme/size.dart';

class Picture extends StatelessWidget {
  final AssetEntity asset;
  const Picture({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ThemeSizes.picture,
        height: ThemeSizes.picture,
        color: Colors.orangeAccent,
        child: Image(
          image: AssetEntityImageProvider(asset),
          fit: BoxFit.cover,
        ));
  }
}
