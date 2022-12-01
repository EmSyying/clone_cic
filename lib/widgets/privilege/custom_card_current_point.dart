import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Utils/helper/color.dart';
import 'dart:ui' as ui;

class CardCurrentPoints extends StatelessWidget {
  const CardCurrentPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline2!;
    return Container(
      height: 110,
      //padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: CustomPaint(
        painter: PathPainter(),
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current Points',
                    style: textStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '1,000',
                    style: textStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/images/svgfile/Union.svg',
                fit: BoxFit.cover,
                width: 38,
                height: 38,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.shader = ui.Gradient.linear(
      Offset(w * 0.9, h * 0.9),
      Offset(0, h * 0.5),
      [const Color(0xff3588E8), const Color(0xff384593).withOpacity(0)],
    );

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h * 0.85);

    path.quadraticBezierTo(w * 0.55, h * 0.8, w * 0.75, 0);
    path.close();
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
}
