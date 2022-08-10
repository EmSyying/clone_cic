import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/utils/helper/container_partern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

class CustomInvestAmonutCard extends StatelessWidget {
  final String? title;
  final String? investAmount;
  final bool? isColors;
  final bool? isFromCreate;
  final String? textUsd;
  const CustomInvestAmonutCard(
      {Key? key,
      this.textUsd,
      this.title,
      this.investAmount,
      this.isColors = false,
      this.isFromCreate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: isColors! ? AppColor.mainColor : Colors.white,
            borderRadius: BorderRadius.circular(borderRaduis),
            border: Border.all(width: 1, color: Colors.grey.shade300)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRaduis),
          child: CustomPaint(
            painter: PathPainter(),
            child: Row(
              children: [
                const SizedBox(width: 30),
                isColors!
                    ? SvgPicture.asset(
                        'assets/images/svgfile/deposit_investment.svg')
                    : SvgPicture.asset('assets/images/svgfile/investfif.svg'),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: !isColors!
                            ? Theme.of(context).textTheme.headline5
                            : Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                      ),
                      Row(
                        children: [
                          isFromCreate == false
                              ? Text('$investAmount',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          fontSize: 20,
                                          color: !isColors!
                                              ? AppColor.mainColor
                                              : Colors.white))
                              : Text(
                                  FormatToK.digitNumber(
                                      num.parse(investAmount!)),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          fontSize: 20,
                                          color: !isColors!
                                              ? AppColor.mainColor
                                              : Colors.white)),
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              textUsd ?? 'USD',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.shader = ui.Gradient.linear(
      Offset(size.width * 0.85, 00),
      Offset(0, size.height * 0.5),
      [
        const Color(0xff133b6f).withOpacity(0.4),
        const Color(0xff0B3C7C).withOpacity(0.1)
      ],
    );

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.95);

    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.80, size.width * 0.85, 00);
    path.close();
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
}
