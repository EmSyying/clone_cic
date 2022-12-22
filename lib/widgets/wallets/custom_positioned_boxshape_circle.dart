import 'package:flutter/material.dart';

class CustomPositionedBoxShapCircle extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final bool boxShapCircleColor;

  const CustomPositionedBoxShapCircle({
    Key? key,
    this.top,
    this.bottom,
    this.right,
    this.left,
    this.boxShapCircleColor = false,
  }) : super(key: key);

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
        decoration: BoxDecoration(
          color: boxShapCircleColor
              ? Theme.of(context).primaryColor
              : Colors.grey[50],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
