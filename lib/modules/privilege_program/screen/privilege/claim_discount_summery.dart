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

class ClaimDiscountSummery extends StatelessWidget {
  final String? decription;
  final String? rateDiscount;
  final String? coverImage;
  final String? status;
  final String? nameAcount;
  final String? merchant;
  final String? paymentOn;
  final String? digitsCode;
  final GestureTapCallback? onPressedClaimDis;

  const ClaimDiscountSummery({
    super.key,
    this.decription,
    this.rateDiscount,
    this.status,
    this.nameAcount,
    this.merchant,
    this.paymentOn,
    this.digitsCode,
    this.coverImage,
    this.onPressedClaimDis,
  });
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
                    Text(
                      "Claim Discount",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                            fontSize: 20,
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
                              children: [
                                LottieBuilder.asset(
                                  "assets/images/50465-done.json",
                                  height: 140,
                                  repeat: false,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  frameRate: FrameRate(60),
                                  options:
                                      LottieOptions(enableMergePaths: true),
                                ),
                                Text(
                                  "Success",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                SizedBox(
                                  width: 264,
                                  child: Text(
                                    decription ??
                                        'Congratulations! You just received a discount of',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 18.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: rateDiscount ?? '40',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          color:
                                              AppColor.statusColor['pending'],
                                          fontWeight: FontWeight.w700,
                                          fontSize: 28,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: ' %',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                              color: AppColor
                                                  .statusColor['pending'],
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  decoration: DottedDecoration(
                                    strokeWidth: 2,
                                    shape: Shape.line,
                                    color: const Color(0xffDBDBDB),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 46,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: AppColor.backgroundColor
                                            .withOpacity(0.4),
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: SvgPicture.asset(
                                          coverImage ??
                                              'assets/images/contact_us.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          status ?? 'Recipient',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: const Color(0xff464646),
                                              ),
                                        ),
                                        Text(
                                          nameAcount ?? 'Korng Kim Oan',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    summeryLabel(
                                      context,
                                      label: 'Merchant',
                                      value: merchant ?? 'Champei Spa',
                                    ),
                                    summeryLabel(
                                      context,
                                      label: 'Payment on',
                                      value: paymentOn ?? '30 Jan 2023',
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  height: 1,
                                  color: AppColor.chartLabelColor,
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                summeryLabel(
                                  context,
                                  label: '4 digits code',
                                  value: digitsCode ?? 'APGQ',
                                  colorDigits: true,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //PositionedBoxShapCircle shap border

                        const CustomPositionedBoxShapCircle(
                          boxShapCircleColor: true,
                          top: 266,
                          left: 6,
                        ),
                        const CustomPositionedBoxShapCircle(
                          boxShapCircleColor: true,
                          top: 266,
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
                          _onClaimSummerySave();
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
                    height: 20.0,
                  ),
                  // loading while user sumitting updated by Chhany
                  CustomButton(
                    width: double.infinity,
                    backgroundColor: Colors.white,
                    colorText: Theme.of(context).primaryColor,
                    onPressed: onPressedClaimDis,
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

  Widget summeryLabel(
    BuildContext context, {
    String? label,
    String? value,
    bool? colorDigits = false,
  }) {
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
                  color: colorDigits == false
                      ? AppColor.darkColor
                      : AppColor.statusColor['pending'],
                ),
          ),
        ],
      ),
    );
  }

  //Function Save
  Future<void> _onClaimSummerySave() async {
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
            description: 'image Saved.', suffix: false, prefix: true);
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
