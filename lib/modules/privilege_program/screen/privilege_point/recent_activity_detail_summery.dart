import 'dart:io';
import 'dart:ui';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_route_snackbar.dart';
import '../../../../configs/firebase_deeplink/deeplink_service.dart';
import '../../../../widgets/wallets/custom_positioned_boxshape_circle.dart';
import '../../../wallet/controller/wallet_controller.dart';

class RecentActivityDetailSummery extends StatelessWidget {
  final int? id;
  final GestureTapCallback? onPressed;

  const RecentActivityDetailSummery({super.key, this.id, this.onPressed});
  static GlobalKey printScreenKey = GlobalKey();
  final bool clickedShare = true;

  @override
  Widget build(BuildContext context) {
    final welletCont = Get.put(WalletController());
    welletCont.fetchOnPaymentReceipt(id!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Center(
          child: Text(
            'Redeem successfully',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => welletCont.isLoadingReceip.value
            ? const LinearProgressIndicator()
            : SafeArea(
                child: Column(
                  children: [
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
                                        ),
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.05),
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
                                                      text: welletCont
                                                                  .paymentSummeryDetail
                                                                  .value
                                                                  .amount !=
                                                              null
                                                          ? '${welletCont.paymentSummeryDetail.value.amount}'
                                                          : "",
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
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineMedium!
                                                              .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
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
                                                    welletCont
                                                            .paymentSummeryDetail
                                                            .value
                                                            .shopName ??
                                                        "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                                  value: welletCont
                                                          .paymentSummeryDetail
                                                          .value
                                                          .transactionId ??
                                                      "",
                                                ),
                                                summeryLabel(
                                                  context,
                                                  label: 'Date',
                                                  value: welletCont
                                                          .paymentSummeryDetail
                                                          .value
                                                          .date ??
                                                      "",
                                                ),
                                                summeryLabel(
                                                  context,
                                                  label: 'Reference #',
                                                  value: welletCont
                                                          .paymentSummeryDetail
                                                          .value
                                                          .reference ??
                                                      "",
                                                ),
                                                summeryLabel(
                                                  context,
                                                  label: 'From account',
                                                  value: welletCont
                                                          .paymentSummeryDetail
                                                          .value
                                                          .fromAccount ??
                                                      "",
                                                ),
                                                summeryLabel(
                                                  context,
                                                  label: 'Merchant',
                                                  value: welletCont
                                                          .paymentSummeryDetail
                                                          .value
                                                          .merchantAccount ??
                                                      "",
                                                ),
                                                // summeryLabel(
                                                //   context,
                                                //   label: 'Seller',
                                                //   value: seller ?? '',
                                                // ),
                                                summeryLabel(
                                                  context,
                                                  label: 'Original Amount',
                                                  value: welletCont
                                                              .paymentSummeryDetail
                                                              .value
                                                              .originalAmount !=
                                                          null
                                                      ? '${welletCont.paymentSummeryDetail.value.originalAmount}'
                                                      : "",
                                                ),
                                                if (welletCont
                                                        .paymentSummeryDetail
                                                        .value
                                                        .remark !=
                                                    null)
                                                  summeryLabel(
                                                    context,
                                                    label: 'Remark',
                                                    value: welletCont
                                                            .paymentSummeryDetail
                                                            .value
                                                            .remark ??
                                                        "",
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
                                        top: 32,
                                        child: Container(
                                          width: 58,
                                          height: 58,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              colors: [
                                                Color.fromARGB(
                                                    235, 56, 70, 147),
                                                Color.fromARGB(
                                                    235, 53, 137, 232),
                                              ],
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/images/svgfile/pointnew.svg",
                                              fit: BoxFit.cover,
                                              width: 38,
                                              height: 38,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //PositionedBoxShapCircle shap border
                                const CustomPositionedBoxShapCircle(
                                  top: 187,
                                  left: 6,
                                ),
                                const CustomPositionedBoxShapCircle(
                                  top: 187,
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
                                onTap: () async {
                                  if (clickedShare) {
                                    clickedShare == false;
                                    await _sharepaymentSummery(context)
                                        .then((_) {
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
                          CustomButton(
                            width: double.infinity,
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
      ),
    );
  }

  Widget summeryLabel(BuildContext context, {String? label, String? value}) {
    return Padding(
      padding: const EdgeInsets.only(top: 17.0),
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

  //function share
  Future<void> _sharepaymentSummery(BuildContext context) async {
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
      final url = await DynamicLinkService.createDynamicLink(
        path: 'summery-payment',
        isShort: true,
      );
      debugPrint("Short link for summery payment: $url");

      Share.shareXFiles([XFile('${directory.path}/transferqr.png')],
          text:
              'Hi! Here is my CiC QR and Payment\'s Link. Scan the QR or tap on the link for sending payment: $url',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      debugPrint("$e");
    }
  }
}
