import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'dart:ui' as ui;
import '../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../Utils/helper/color.dart';
import '../custom_showbottomsheet.dart';

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
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: CustomPaint(
        painter: PathPainter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Spacer(),
                // InkWell(
                //   onTap: () {
                //     onShowBottomSheet(
                //         icondata: Icons.close,
                //         isLoading: false,
                //         title: 'Available Information',
                //         context: context,
                //         child: Column(
                //           children: const [
                //             Padding(
                //               padding: EdgeInsets.symmetric(
                //                   horizontal: 20, vertical: 20),
                //               child: Text("Available Balance"),
                //             )
                //           ],
                //         ));
                //   },
                // child: Padding(
                //   padding: const EdgeInsets.only(top: 13.0, right: 15.0),
                //   child: SvgPicture.asset(
                //     'assets/images/svgfile/questicon.svg',
                //     color: Colors.white,
                //     width: 24.0,
                //     height: 20.0,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                // ),
                GetBuilder<SettingController>(
                  init: SettingController(),
                  builder: (controller) {
                    return InkWell(
                      onTap: () {
                        onShowBottomSheet(
                          icondata: Icons.close,
                          isLoading: controller.isloading,
                          title: 'Available Balance',
                          context: context,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: controller
                                            .uiSettingData.availableBalance !=
                                        null
                                    ? HtmlWidget(
                                        "${controller.uiSettingData.availableBalance!.description}",
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14))
                                    : Container(),
                              )
                            ],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13.0, right: 15.0),
                        child: SvgPicture.asset(
                          'assets/images/svgfile/questicon.svg',
                          color: Colors.white,
                          width: 24.0,
                          height: 20.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ??
                    SvgPicture.asset(
                      'assets/images/mma_wallet.svg',
                      color: Colors.white,
                      fit: BoxFit.cover,
                      width: 36,
                      height: 25,
                    ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? 'Available Balance',
                      style: textStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: amount ?? '0.00',
                        style: textStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 21,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
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
