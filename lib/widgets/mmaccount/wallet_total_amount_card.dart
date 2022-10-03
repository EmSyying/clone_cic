import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import '../../Utils/helper/color.dart';

class WalletTotalCard extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? amount;
  const WalletTotalCard({
    Key? key,
    this.icon,
    this.title,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline2!;
    return Container(
      height: 110,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomPaint(
        painter: PathPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const SizedBox(width: 30),
              icon ??
                  SvgPicture.asset(
                    'assets/images/mma_wallet.svg',
                    color: Colors.white,
                  ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? 'Available Balance',
                      style: textStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    RichText(
                      text: TextSpan(
                        text: amount ?? '0.00',
                        style: textStyle.copyWith(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    )
                  ],
                ),
              )
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
      [const Color(0xff133B6F), const Color(0xff0B3C7C).withOpacity(0)],
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
