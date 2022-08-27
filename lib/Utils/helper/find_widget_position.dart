import 'package:flutter/material.dart';

Offset getWidgetInfo(GlobalKey key) {
  final RenderBox renderBox =
      key.currentContext?.findRenderObject() as RenderBox;

  final Offset offset = renderBox.localToGlobal(Offset.zero);
  return offset;
}
