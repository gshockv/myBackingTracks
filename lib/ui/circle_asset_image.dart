import 'package:flutter/material.dart';

class CircleAssetImage extends StatelessWidget {
  final String imageAssetPath;
  final double width;
  final double height;

  CircleAssetImage(
      {Key key,
      @required this.imageAssetPath,
      this.width = 120.0,
      this.height = 120.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(this.imageAssetPath))),
    );
  }
}
