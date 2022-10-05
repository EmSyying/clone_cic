import 'package:flutter/material.dart';

class CustomPositionedBoxShapCircle extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  const CustomPositionedBoxShapCircle(
      {Key? key, this.top, this.bottom, this.right, this.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: 26,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
