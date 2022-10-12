import 'dart:io';
import 'dart:ui';

import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:cicgreenloan/utils/helper/extension/string_extension.dart';
import 'package:cicgreenloan/widgets/mmaccount/custom_qr_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share/share.dart';

import '../../../Utils/helper/custom_appbar.dart';

import '../../../Utils/helper/custom_route_snackbar.dart';
import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../../setting_modules/screens/sub_setting_screen/contract_terms.dart';
import '../controller/wallet_controller.dart';

class DepositFromScreen extends StatefulWidget {
  const DepositFromScreen({Key? key}) : super(key: key);

  @override
  State<DepositFromScreen> createState() => _DepositFromScreenState();
}

class _DepositFromScreenState extends State<DepositFromScreen> {
  final _walletController = Get.put(WalletController());

  @override
  void dispose() {
    _walletController.clearDeposit();
    super.dispose();
  }

  GlobalKey qrKey = GlobalKey();
  OverlayEntry? overlayEntry;
  bool isShowPopupQRCode = false;
  static GlobalKey printScreenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline2!;
    return Stack(
      children: [
        Center(
          child: RepaintBoundary(
            key: printScreenKey,
            child: CustomQRCard(
              userID:
                  _walletController.walletAmount.value.wallet!.accountNumber,
              userName:
                  _walletController.walletAmount.value.invester!.investerName,
              amountQr:
                  _walletController.walletAmount.value.wallet!.balanceFormat,
            ),
          ),
        ),

        /// Main Screen
        Scaffold(
          backgroundColor: const Color(0xfffafafa),
          appBar: CustomAppBar(
            elevation: 0,
            isLeading: true,
            context: context,
            title: "Deposit",
          ),
          body: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: WalletTotalCard(
                    amount: _walletController
                        .walletAmount.value.wallet!.balanceFormat,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            'Show QR Code to receive payment from others.',
                            style: textStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: PrettyQr(
                                elementColor: Theme.of(context).primaryColor,
                                roundEdges: true,
                                key: qrKey,
                                image: const AssetImage(
                                    'assets/images/Logo/cic_logo_x4jpg.jpg'),
                                data: _walletController.transferModel.value
                                    .toJson(),
                                size: 170,
                                // errorCorrectLevel: QrErrorCorrectLevel.H,
                              )),
                          if (_walletController.recievingAmount.value.isEmpty)
                            GestureDetector(
                              onTap: () {
                                _inputAmount(context);
                              },
                              child: _setAmountButton(textStyle),
                            ),
                          _walletController.recievingAmount.value.isNotEmpty
                              ? _hasAmount(textStyle)
                              : const SizedBox.shrink(),
                          // const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                //fix overflow keyboard
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(textStyle,
                              icon: SvgPicture.asset('assets/images/share.svg'),
                              text: 'Share', onTap: () {
                            _captureAndSharePng(context);
                          }),
                          const SizedBox(width: 50),
                          _buildButton(textStyle,
                              text: 'Save',
                              icon: SvgPicture.asset('assets/images/save.svg'),
                              onTap: () {
                            setState(() {
                              isShowPopupQRCode = true;
                              Future.delayed(const Duration(seconds: 1), () {
                                _onCaptureAndSave();
                                isShowPopupQRCode = false;
                              });
                            });
                          }),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SafeArea(
                        top: false,
                        minimum: const EdgeInsets.only(bottom: 20),
                        child: RichText(
                          text: TextSpan(
                            text: 'By submitting you agree to ',
                            style: textStyle.copyWith(fontSize: 12),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ContractTerm(
                                          fromPage: 'agree',
                                        ),
                                      ),
                                    );
                                  },
                                text: 'CiC Service Agreement',
                                style: textStyle.copyWith(
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        // if (isShowPopupQRCode)
        //   BackdropFilter(
        //     filter: ImageFilter.blur(sigmaY: 6, sigmaX: 6),
        //     child: SizedBox(
        //       height: double.infinity,
        //       width: double.infinity,
        //       child: Center(
        //         child: Padding(
        //           padding: const EdgeInsets.all(70.0),
        //           child: RepaintBoundary(
        //             key: printScreenKey,
        //             child: GestureDetector(
        //               onTap: () {
        //                 Share.share("Hello")
        //                     .then((value) => debugPrint("Done"));
        //               },
        //               child: CustomQRCard(
        //                 userID: _walletController
        //                     .walletAmount.value.wallet!.accountNumber,
        //                 userName: _walletController
        //                     .walletAmount.value.invester!.investerName,
        //                 amountQr: _walletController
        //                     .walletAmount.value.wallet!.balanceFormat,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   )
      ],
    );
  }

  Future<void> _onCaptureAndSave() async {
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
            description: 'Qr Code Saved.', suffix: false, prefix: true);
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _captureAndSharePng(BuildContext context) async {
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
      Share.shareFiles(['${directory.path}/transferqr.png'],
          text:
              'Hi! Here is my CiC ID. You can scan this QR code to send money or Tap on the link below for sending payment:',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> _inputAmount(BuildContext context) async {
    await showCupertinoModalBottomSheet(
      context: context,
      barrierColor: Colors.black26,
      topRadius: const Radius.circular(14),
      builder: (_) => Material(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25 +
              MediaQuery.of(context).viewInsets.bottom,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 20),
                width: 34,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
              ),
              CustomTextFieldNew(
                controller: _walletController.amountController,
                inputFormatterList: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    double? number = double.tryParse(newValue.text);
                    if (number != null) {
                      debugPrint('New');
                      return newValue.copyWith(
                          text: newValue.text.asInput(),
                          selection: TextSelection.collapsed(
                              offset: newValue.text.asInput().length));
                    } else if (newValue.text.isEmpty) {
                      return const TextEditingValue();
                    } else {
                      debugPrint('Old');
                      return oldValue;
                    }
                    // try {
                    //   final text = newValue.text;
                    //   if (text.isNotEmpty) double.parse(text);
                    //   debugPrint('ERROR');
                    //   return newValue;
                    // } catch (e) {
                    //   return oldValue;
                    // }
                  }),
                ],
                autoFocus: true,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                labelText: 'Set Amount',
                isRequired: true,
                onChange: (value) {
                  _walletController.update();
                  // _walletController.recievingAmount(value);
                },
                suffixText: 'USD',
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          Navigator.pop(context);

                          _walletController.amountController.text =
                              _walletController.recievingAmount.value;
                        },
                        isDisable: false,
                        isOutline: true,
                        title: 'Cancel',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GetBuilder(
                          init: WalletController(),
                          builder: (_) {
                            return CustomButton(
                              onPressed: () {
                                _walletController.recievingAmount.value =
                                    _walletController.amountController.text;
                                _walletController.transferModel.value =
                                    _walletController.transferModel.value
                                        .copyWith(
                                            amount: _walletController
                                                .recievingAmount.value);
                                _walletController.update();
                                Navigator.pop(context);
                              },
                              backgroundColor: AppColor.mainColor,
                              colorText: Colors.white,
                              isDisable: double.tryParse(_walletController
                                              .amountController.text
                                              .clean()) !=
                                          null &&
                                      double.tryParse(_walletController
                                              .amountController.text
                                              .clean())! >
                                          0
                                  ? false
                                  : true,
                              isOutline: false,
                              title: 'Confirm',
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((value) {
      _walletController.amountController.text =
          _walletController.recievingAmount.value;
      _walletController.transferModel.value
          .copyWith(amount: _walletController.recievingAmount.value);
      _walletController.update();
    });

    // if (ispop) {}
  }

  Column _hasAmount(TextStyle textStyle) {
    return Column(
      children: [
        Text(
          'Amount',
          style: textStyle.copyWith(fontSize: 14),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text:
                      '${_walletController.recievingAmount.value.toCurrencyAmount()} ',
                  style: textStyle.copyWith(
                    fontSize: 18,
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('Hello');
                        },
                      text: 'USD',
                      style: textStyle.copyWith(
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  _inputAmount(context);
                },
                icon: SvgPicture.asset(
                  'assets/images/svgfile/editedIcon.svg',
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            _walletController.recievingAmount('');
            _walletController.amountController.text = '';
            _walletController.transferModel.value =
                _walletController.transferModel.value.copyWith(amount: '');
            _walletController.update();
          },
          child: Text(
            'Remove',
            style: textStyle.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        )
      ],
    );
  }

  Container _setAmountButton(TextStyle textStyle) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      margin: const EdgeInsets.only(
        top: 40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor.mainColor,
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Set Amount',
        style: textStyle.copyWith(
          color: AppColor.mainColor,
        ),
      ),
    );
  }

  Widget _buildButton(
    textStyle, {
    String? text,
    Widget? icon,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          const SizedBox(height: 5),
          Text(
            text ?? '',
            style: textStyle.copyWith(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
