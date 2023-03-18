import 'dart:io';
import 'dart:ui';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_route_snackbar.dart';
import '../../../../widgets/wallets/custom_positioned_boxshape_circle.dart';

class GiftMVPSuccessfully extends StatelessWidget {
  final String? transactionID;
  final String? date;
  final String? reference;
  final String? fromAccount;
  final String? originalAmount;
  final String? remark;
  final String? amount;
  final String? accountName;
  final GestureTapCallback? onPressed;
  const GiftMVPSuccessfully({
    super.key,
    this.transactionID,
    this.date,
    this.reference,
    this.fromAccount,
    this.originalAmount,
    this.remark,
    this.onPressed,
    this.amount,
    this.accountName,
  });
  static GlobalKey printScreenKey = GlobalKey();
  final bool clickedShare = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Center(
            child: Text(
              'Successfully',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
              const SizedBox(
                height: 37,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          RepaintBoundary(
                            key: printScreenKey,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 60.0,
                                      bottom: 20),
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
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
                                                    .headlineMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 26,
                                                    ),
                                                children: [
                                                  TextSpan(
                                                    text: ' MVP',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                              accountName ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.0,
                                                    color: AppColor
                                                        .chartLabelColor,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          summeryLabel(
                                            context,
                                            label: 'Transaction ID',
                                            value: transactionID ?? '',
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
                                            label: 'Original Amount',
                                            value: '$originalAmount MVP',
                                          ),
                                          if (remark != 'null' &&
                                              remark != null)
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
                                //IconsCover
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 30,
                                  child: Container(
                                    width: 68,
                                    height: 68,
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
                                        "assets/images/svgfile/pointnew.svg",
                                        fit: BoxFit.cover,
                                        width: 46,
                                        height: 46,
                                      ),
                                    ),
                                  ),
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
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () async {
                            if (clickedShare) {
                              clickedShare == false;
                              await _shareSucessfully(context).then((_) {
                                clickedShare == true;
                              });
                            }
                          },
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
                                    .titleLarge!
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
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            _onSaveSuccessfully();
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
                                    .titleLarge!
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
                    SafeArea(
                      top: false,
                      minimum: const EdgeInsets.only(bottom: 20),
                      child: CustomButton(
                        width: double.infinity,
                        onPressed: onPressed,
                        backgroundColor: AppColor.mainColor,
                        colorText: AppColor.arrowforwardColor['dark'],
                        isDisable: false,
                        isOutline: true,
                        title: 'Done',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xff464646),
                ),
          ),
          const Spacer(),
          Text(
            value ?? '',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
          ),
        ],
      ),
    );
  }

  //function share
  Future<void> _shareSucessfully(BuildContext context) async {
    try {
      final RenderBox box = context.findRenderObject() as RenderBox;
      RenderRepaintBoundary boundary = printScreenKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 2);
      var byteData = await image.toByteData(format: ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/transferqr.png');
      await file.writeAsBytes(pngBytes);

      Share.shareXFiles([XFile('${directory.path}/transferqr.png')],
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      debugPrint("$e");
    }
  }

  //Function Save
  Future<void> _onSaveSuccessfully() async {
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

      if (result != null) {
        customRouterSnackbar(
            description: 'Gift MVP Saved.', suffix: false, prefix: true);
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
