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
        width: 24,
        height: 26,
        decoration: const BoxDecoration(
          color: Color(0xff0f50a4),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
