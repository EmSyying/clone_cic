import 'dart:io';
import 'dart:ui';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_route_snackbar.dart';
import '../../../../widgets/wallets/custom_positioned_boxshape_circle.dart';

class PaymentSummeryMVP extends StatelessWidget {
  final String? amount;
  final String? accountMVP;
  final String? transactionID;
  final String? date;
  final String? reference;
  final String? fromAccount;
  final String? seller;
  final String? originalAmount;
  final String? remark;
  final String? marchant;
  final GestureTapCallback? onPressed;

  const PaymentSummeryMVP(
      {super.key,
      this.amount,
      this.accountMVP,
      this.transactionID,
      this.date,
      this.reference,
      this.fromAccount,
      this.seller,
      this.originalAmount,
      this.remark,
      this.onPressed,
      this.marchant});
  static GlobalKey printScreenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Center(
          child: Text(
            'Redeem successfully',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: RepaintBoundary(
                  key: printScreenKey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 60.0,
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
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 50.0, bottom: 34.0),
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: amount ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 26,
                                              ),
                                          children: [
                                            TextSpan(
                                              text: ' MVP',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w400,
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
                                        accountMVP ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
                                              color: AppColor.chartLabelColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: DottedDecoration(
                                    strokeWidth: 1,
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
                                      value: accountMVP ?? '',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Date',
                                      value: date ?? '',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Reference #',
                                      value: reference ?? '',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'From account',
                                      value: fromAccount ?? '',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Merchant',
                                      value: marchant ?? '',
                                    ),
                                    // summeryLabel(
                                    //   context,
                                    //   label: 'Seller',
                                    //   value: seller ?? '',
                                    // ),
                                    summeryLabel(
                                      context,
                                      label: 'Original Amount',
                                      value: originalAmount ?? '',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Remark',
                                      value: remark ?? '',
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //PositionedBoxShapCircle shap border
                          const CustomPositionedBoxShapCircle(
                            top: 186,
                            left: 6,
                          ),
                          const CustomPositionedBoxShapCircle(
                            top: 186,
                            right: 6,
                          ),
                          //IconsCover
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 30,
                            child: Container(
                              width: 58,
                              height: 58,
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
                                  width: 25,
                                  height: 31,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/share.svg',
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
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
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
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/save.svg',
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
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
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
                    onPressed: onPressed,
                    backgroundColor: AppColor.mainColor,
                    colorText: AppColor.arrowforwardColor['dark'],
                    isDisable: false,
                    isOutline: true,
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
