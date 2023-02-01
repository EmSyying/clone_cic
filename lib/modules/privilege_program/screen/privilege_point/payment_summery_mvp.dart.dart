import 'dart:io';
import 'dart:ui';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_route_snackbar.dart';
import '../../../../widgets/wallets/custom_positioned_boxshape_circle.dart';

class PaymentSummeryMVP extends StatelessWidget {
  final String? totalMVP;
  final String? accountMVP;
  final String? transactionID;
  final String? date;
  final String? reference;
  final String? fromAccount;
  final String? seller;
  final String? originalAmount;
  final String? remark;

  const PaymentSummeryMVP(
      {super.key,
      this.totalMVP,
      this.accountMVP,
      this.transactionID,
      this.date,
      this.reference,
      this.fromAccount,
      this.seller,
      this.originalAmount,
      this.remark});
  static GlobalKey printScreenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LottieBuilder.asset(
                      "assets/images/animation/done_animation.json",
                      height: 140,
                      repeat: false,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      frameRate: FrameRate(60),
                      options: LottieOptions(enableMergePaths: true),
                    ),
                    Text(
                      "Success",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        RepaintBoundary(
                          key: printScreenKey,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 0.1,
                                    offset: const Offset(0, 2),
                                    blurRadius: 8),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            colors: [
                                              Color.fromARGB(235, 56, 70, 147),
                                              Color.fromARGB(235, 53, 137, 232),
                                            ],
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/svgfile/Union.svg',
                                            fit: BoxFit.cover,
                                            width: 18.9,
                                            height: 25.65,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: totalMVP ?? '612',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                  ),
                                              children: [
                                                TextSpan(
                                                  text: ' MVP',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 18,
                                                      ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4.0,
                                          ),
                                          Text(
                                            accountMVP ?? 'Kim Oan',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: DottedDecoration(
                                    strokeWidth: 2,
                                    shape: Shape.line,
                                    color: const Color(0xffDBDBDB),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    summeryLabel(
                                      context,
                                      label: 'Transaction ID',
                                      value: accountMVP ?? '0002346',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Date',
                                      value: date ?? '02 Jan 2022',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Reference #',
                                      value: reference ?? '456723456754',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'From account',
                                      value: fromAccount ?? 'Kim Oan',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Seller',
                                      value: seller ?? 'Champei Toul Kork',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Original Amount',
                                      value: originalAmount ?? '612 MVP',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Remark',
                                      value: remark ?? 'Use at Champei Spa',
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //PositionedBoxShapCircle shap border

                        const CustomPositionedBoxShapCircle(
                          boxShapCircleColor: true,
                          top: 76,
                          left: 6,
                        ),
                        const CustomPositionedBoxShapCircle(
                          boxShapCircleColor: true,
                          top: 76,
                          right: 6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color:
                                    AppColor.backgroundColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/share.svg',
                                color: AppColor.arrowforwardColor['dark'],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Share',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          _onPaymentSummerySave();
                          debugPrint('hany test payment===');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color:
                                    AppColor.backgroundColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/save.svg',
                                color: AppColor.arrowforwardColor['dark'],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Save',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  // loading while user sumitting updated by Chhany
                  CustomButton(
                    width: double.infinity,
                    backgroundColor: Colors.white,
                    colorText: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDisable: false,
                    isOutline: false,
                    title: 'Done',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summeryLabel(BuildContext context, {String? label, String? value}) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Row(
        children: [
          Text(
            label ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xff464646),
                ),
          ),
          const Spacer(),
          Text(
            value ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
          ),
        ],
      ),
    );
  }

  //Function Save
  Future<void> _onPaymentSummerySave() async {
    try {
      RenderRepaintBoundary boundary = printScreenKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 5);
      var byteData = await image.toByteData(
        format: ImageByteFormat.png,
      );
      var pngBytes = byteData!.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/screenshot.png');
      await file.writeAsBytes(pngBytes);
      await [Permission.storage].request();
      final time = DateTime.now()
          .toIso8601String()
          .replaceAll(".", "-")
          .replaceAll(":", "-");
      final name = 'MMA-$time';

      final result = await ImageGallerySaver.saveFile(file.path,
          name: name, isReturnPathOfIOS: true);
      // final result = await ImageGallerySaver
      // .saveImage(
      //   pngBytes,
      //   name: name,
      //   isReturnImagePathOfIOS: true,
      // );
      if (result != null) {
        customRouterSnackbar(
            description: 'Payment Summery Saved.', suffix: false, prefix: true);
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
