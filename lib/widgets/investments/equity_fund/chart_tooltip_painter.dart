import 'package:flutter/material.dart';

class ChartToolTipPainter extends CustomPainter {
  final Color? backgroundColor;
  final Color? strokeColor;
  final double moto;
  final bool enableArrow;
  final Offset? atemplateLocation;

  ChartToolTipPainter({
    this.atemplateLocation,
    this.moto = 0,
    this.enableArrow = true,
    this.backgroundColor,
    this.strokeColor,
  });

  // void _renderArrowAndTemplatePath(Canvas canvas, Offset location,
  //     Offset templateLocation, Size templateSize) {
  //   bool isOutOfBoundInTop = 1 == 2;
  //   // Size templateSize = const Size(100, 100);
  //   double borderRadius = 10;
  //   final Paint strokePaint = Paint()
  //     ..style = PaintingStyle.stroke
  //     ..color = Colors.red
  //     ..strokeWidth = 1;
  //   final Paint fillPaint = Paint()
  //     ..color = Colors.red
  //     ..style = PaintingStyle.fill;
  //   const double currentHeight = 5.0;
  //   const double arrowWidth = 8;
  //   const double padding = 0.1;
  //   final Size currentSize = Size(templateSize.width, currentHeight);
  //   final num templateHeight = templateSize.height;
  //   final num arrowHeight = currentSize.height + padding;
  //   final num centerTemplateY = isOutOfBoundInTop
  //       ? location.dy + currentSize.height + templateHeight / 2 + padding
  //       : location.dy - templateHeight / 2 - padding;
  //   double locationY = isOutOfBoundInTop
  //       ? centerTemplateY - (templateHeight / 2) - arrowHeight
  //       : centerTemplateY + templateHeight / 2;
  //   final num centerX = location.dx + currentSize.width / 2;
  //   final Path path = Path();
  //   final RRect rect = RRect.fromLTRBAndCorners(
  //       templateLocation.dx,
  //       templateLocation.dy,
  //       templateLocation.dx + templateSize.width,
  //       templateLocation.dy + templateSize.height,
  //       topLeft: Radius.circular(borderRadius),
  //       topRight: Radius.circular(borderRadius),
  //       bottomRight: Radius.circular(borderRadius),
  //       bottomLeft: Radius.circular(borderRadius));
  //   bool isVTypeArrow = true;
  //   final String side =
  //       (centerX < rect.left + rect.width / 2) ? 'left' : 'right';
  //   if (!isOutOfBoundInTop) {
  //     locationY += arrowHeight - padding;
  //   }
  //   path.moveTo(rect.left + rect.tlRadiusX, rect.top);
  //   path.arcToPoint(Offset(rect.left, rect.top + rect.tlRadiusY),
  //       radius: rect.tlRadius, clockwise: false);
  //   path.lineTo(rect.left, rect.bottom - rect.blRadiusY);
  //   path.arcToPoint(Offset(rect.left + rect.blRadiusX, rect.bottom),
  //       radius: rect.blRadius, clockwise: false);
  //   if ((centerX > rect.left + rect.blRadiusX + arrowWidth / 2) &&
  //       (centerX < rect.right - rect.brRadiusX - arrowWidth / 2)) {
  //     path.lineTo(centerX - arrowWidth / 2, rect.bottom);
  //   } else {
  //     isVTypeArrow = false;
  //     if (side == 'right') {
  //       path.lineTo(rect.right - rect.brRadiusX - arrowWidth * 2, rect.bottom);
  //     }
  //   }
  //   if (!isOutOfBoundInTop) {
  //     //bottom arrow
  //     path.lineTo(centerX.toDouble(), locationY);
  //     path.lineTo(
  //         isVTypeArrow
  //             ? (centerX + arrowWidth / 2)
  //             : side == 'left'
  //                 ? (rect.left + rect.blRadiusX + arrowWidth * 2)
  //                 : (rect.right - rect.brRadiusX),
  //         rect.bottom);
  //   }
  //   path.lineTo(rect.right - rect.brRadiusX, rect.bottom);
  //   path.arcToPoint(Offset(rect.right, rect.bottom - rect.brRadiusY),
  //       radius: rect.brRadius, clockwise: false);
  //   path.lineTo(rect.right, rect.top + rect.trRadiusY);
  //   path.arcToPoint(Offset(rect.right - rect.brRadiusX, rect.top),
  //       radius: rect.trRadius, clockwise: false);
  //   if (isVTypeArrow) {
  //     path.lineTo(centerX + arrowWidth / 2, rect.top);
  //   } else {
  //     if (side == 'left') {
  //       path.lineTo(rect.left + rect.tlRadiusX + arrowWidth * 2, rect.top);
  //     }
  //   }
  //   if (isOutOfBoundInTop) {
  //     //top arrow
  //     path.lineTo(centerX.toDouble(), locationY);
  //     path.lineTo(
  //         isVTypeArrow
  //             ? (centerX - arrowWidth / 2)
  //             : side == 'left'
  //                 ? (rect.left + rect.blRadiusX)
  //                 : (rect.right - rect.brRadiusX - arrowWidth * 2),
  //         rect.top);
  //   }
  //   path.lineTo(rect.left + rect.tlRadiusX, rect.top);

  //   canvas.drawPath(path, fillPaint);
  //   canvas.drawPath(path, strokePaint);
  // }

  void cicToolTips(Canvas canvas, Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.003521127, size.height * 0.1481481);
    path_1.cubicTo(
        size.width * 0.003521127,
        size.height * 0.06888500,
        size.width * 0.05239141,
        size.height * 0.004629630,
        size.width * 0.1126761,
        size.height * 0.004629630);
    path_1.lineTo(size.width * 0.8873239, size.height * 0.004629630);
    path_1.cubicTo(
        size.width * 0.9476085,
        size.height * 0.004629630,
        size.width * 0.9964789,
        size.height * 0.06888500,
        size.width * 0.9964789,
        size.height * 0.1481481);
    path_1.lineTo(size.width * 0.9964789, size.height * 0.7270556);
    path_1.cubicTo(
        size.width * 0.9964789,
        size.height * 0.8063185,
        size.width * 0.9476085,
        size.height * 0.8705741,
        size.width * 0.8873239,
        size.height * 0.8705741);

    ///
    if (enableArrow) {
      path_1.lineTo(size.width * 0.6151972 + moto, size.height * 0.8705741);

      path_1.cubicTo(
          size.width * 0.5882099 + moto,
          size.height * 0.8705741,
          size.width * 0.5668183 + moto,
          size.height * 0.8861574,
          size.width * 0.5489662 + moto,
          size.height * 0.9088852);
      path_1.cubicTo(
          size.width * 0.5311915 + moto,
          size.height * 0.9315111,
          size.width * 0.5167423 + moto,
          size.height * 0.9614481,
          size.width * 0.5035507 + moto,
          size.height * 0.9906315);
      path_1.cubicTo(
          size.width * 0.5016268 + moto,
          size.height * 0.9948870,
          size.width * 0.5003465 + moto,
          size.height * 0.9953704,
          size.width * 0.5000000 + moto,
          size.height * 0.9953704);
      path_1.cubicTo(
          size.width * 0.4996535 + moto,
          size.height * 0.9953704,
          size.width * 0.4983732 + moto,
          size.height * 0.9948870,
          size.width * 0.4964493 + moto,
          size.height * 0.9906315);
      path_1.cubicTo(
          size.width * 0.4832577 + moto,
          size.height * 0.9614481,
          size.width * 0.4688085 + moto,
          size.height * 0.9315111,
          size.width * 0.4510338 + moto,
          size.height * 0.9088852);
      path_1.cubicTo(
          size.width * 0.4331817 + moto,
          size.height * 0.8861574,
          size.width * 0.4117901 + moto,
          size.height * 0.8705741,
          size.width * 0.3848028 + moto,
          size.height * 0.8705741);
    }

    ///
    path_1.lineTo(size.width * 0.1126761, size.height * 0.8705741);

    path_1.cubicTo(
        size.width * 0.05239141,
        size.height * 0.8705741,
        size.width * 0.003521127,
        size.height * 0.8063185,
        size.width * 0.003521127,
        size.height * 0.7270556);
    path_1.lineTo(size.width * 0.003521127, size.height * 0.1481481);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color =
        backgroundColor ?? const Color(0xff0F50A4).withOpacity(0.1);
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    paint2Stroke.color = strokeColor ?? const Color(0xff0F50A4);
    canvas.drawPath(path_1, paint0Fill);
    canvas.drawPath(path_1, paint1Fill);
    canvas.drawPath(path_1, paint2Stroke);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // _renderArrowAndTemplatePath(
    //     canvas, const Offset(100, 100), atemplateLocation!, size);
    cicToolTips(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
