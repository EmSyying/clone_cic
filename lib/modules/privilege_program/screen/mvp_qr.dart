import 'dart:io';
import 'dart:ui';

import 'package:cicgreenloan/Utils/helper/extension/string_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/form_builder/custom_textformfield.dart';
import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/custom_route_snackbar.dart';
import '../../../Utils/helper/texfield_format_currency/decimal_textinput_format.dart';
import '../../../Utils/helper/texfield_format_currency/format_value_onchange.dart';
import '../../../widgets/mmaccount/custom_qr_card.dart';
import '../../setting_modules/screens/sub_setting_screen/contract_terms.dart';
import '../controller/privilege_controller.dart';

class MvpQrScreen extends StatefulWidget {
  const MvpQrScreen({
    Key? key,
    this.mvpID,
  }) : super(key: key);
  final int? mvpID;

  @override
  State<MvpQrScreen> createState() => MvpQrScreenState();
}

class MvpQrScreenState extends State<MvpQrScreen> {
  // final _walletController = Get.put(WalletController());

  @override
  void dispose() {
    // clearDeposit
    Get.put(PrivilegeController()).mvpShareAmountController.text = "";
    Get.put(PrivilegeController()).mvpShareAmount.value = "";
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  GlobalKey qrKey = GlobalKey();
  OverlayEntry? overlayEntry;
  bool isShowPopupQRCode = false;
  static GlobalKey printScreenKey = GlobalKey();

  bool clickedShare = true;

  bool init = true;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.displayMedium!;
    final privilegeController = Get.put(PrivilegeController());

    return Stack(
      children: [
        Center(
          child: RepaintBoundary(
            key: printScreenKey,
            child: Obx(
              () => CustomQRCard(
                deepLink:
                    privilegeController.mvpDynamicLinkModel.value.sortLink,
                assetName: 'assets/images/Logo/MVP.png',
                userID:
                    privilegeController.mvpDynamicLinkModel.value.accountNumber,
                // _walletController.walletAmount.value.wallet!.accountNumber,
                userName:
                    privilegeController.mvpDynamicLinkModel.value.accountName,
                // _walletController.walletAmount.value.invester!.investerName,
                amountQr: privilegeController.mvpShareAmount.value,
                // _walletController.recievingAmount.value.toCurrencyAmount(),
              ),
            ),
          ),
        ),
        // ),

        /// Main Screen
        Visibility(
          visible: true,
          child: Scaffold(
            backgroundColor: const Color(0xffF5F5F5),
            appBar: CustomAppBar(
              elevation: 0,
              isLeading: true,
              context: context,
              title: "MVP QR",
            ),
            body: Obx(
              () => Column(
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.all(20.0),
                  //   child: WalletTotalCard(amount: "1000"
                  //       // _walletController
                  //       //     .walletAmount.value.wallet!.balanceFormat,
                  //       ),
                  // ),
                  // const Expanded(
                  //   flex: 1,
                  //   child: SizedBox(),
                  // ),
                  Expanded(
                    flex: 4,
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
                            const SizedBox(height: 50),
                            Text(
                              'Show QR Code to receive payment from others.',
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                  top: 48,
                                ),
                                child: PrettyQr(
                                  elementColor: const Color(0xff0A0B09),
                                  roundEdges: true,
                                  key: qrKey,
                                  image: const AssetImage(
                                      'assets/images/Logo/MVP.png'),
                                  data: privilegeController
                                          .mvpDynamicLinkModel.value.sortLink ??
                                      "",
                                  size: 170,
                                  // errorCorrectLevel: QrErrorCorrectLevel.H,
                                )),
                            if (privilegeController
                                .mvpShareAmount.value.isEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: _amountbutton(
                                  textStyle,
                                  ontap: () {
                                    _inputAmount(context, privilegeController);
                                  },
                                  text: 'Set Amount',
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            privilegeController.mvpShareAmount.value.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: _hasAmount(
                                        textStyle, privilegeController),
                                  )
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
                            _buildbutton(textStyle,
                                icon:
                                    SvgPicture.asset('assets/images/share.svg'),
                                text: 'Share', onTap: () async {
                              if (clickedShare) {
                                clickedShare = false;
                                await _captureAndSharePng(
                                        context, privilegeController)
                                    .then((_) {
                                  clickedShare = true;
                                });
                              }
                            }),
                            const SizedBox(width: 50),
                            _buildbutton(textStyle,
                                text: 'Save',
                                icon:
                                    SvgPicture.asset('assets/images/save.svg'),
                                onTap: () {
                              setState(() {
                                isShowPopupQRCode = true;
                                _onCaptureAndSave();
                              });
                            }),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: RichText(
                            text: TextSpan(
                              text: 'By submitting you agree to ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'CiC Service Agreement',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        debugPrint("Click");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ContractTerm(
                                              fromPage: 'Review Payment',
                                            ),
                                          ),
                                        );
                                        // await onShowCustomCupertinoModalSheet(
                                        //     context: context,
                                        //     child: ServiceAgreement(
                                        //       serviceAgreement:
                                        //           Get.put(BonusController())
                                        //                   .bonusSetting
                                        //                   .value
                                        //                   .serviceAgreement ??
                                        //               "",
                                        //     ),
                                        //     title: 'CiC Service Agreement',
                                        //     icon:
                                        //         const Icon(Icons.arrow_back_ios));
                                      }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 46),
                        // SafeArea(
                        //   top: false,
                        //   minimum: const EdgeInsets.only(bottom: 20),
                        //   child: RichText(
                        //     text: TextSpan(
                        //       text: 'By submitting you agree to ',
                        //       style: textStyle.copyWith(fontSize: 12),
                        //       children: [
                        //         TextSpan(
                        //           recognizer: TapGestureRecognizer()
                        //             ..onTap = () {
                        //               Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       const ContractTerm(
                        //                     fromPage: 'agree',
                        //                   ),
                        //                 ),
                        //               );
                        //             },
                        //           text: 'CiC Service Agreement',
                        //           style: textStyle.copyWith(
                        //               color: Theme.of(context).primaryColor,
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 12),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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

  Future<void> _captureAndSharePng(
      BuildContext context, PrivilegeController privilegeController) async {
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
      // var path = GoRouterState.of(context).location;
      // path = path.replaceAll("/mvp-qr", "");
      // path = path.replaceFirst('/', '');
      // debugPrint("path=$path");
      // final url = await DynamicLinkService.createDynamicLink(
      //     path:
      //         "$path/gift-mvp-transfer?receiverAccount=${widget.accountNumber}&receiverName=${widget.accountName}&receiverAmount=${widget.amount}",
      //     isShort: true);
      // debugPrint("Short link for transfer: $url");

      // var url = await DynamicLinkService.createDynamicLink(
      //     path:
      //         'wallet/transfer-to-other-mmacount?receiverAccount=${_walletController.transferModel.value.phoneNumber}&receiverAmount=${_walletController.recievingAmount.value}',
      //     title: 'Title',
      //     description: 'ss',
      //     image:
      //         'https://play-lh.googleusercontent.com/DTzWtkxfnKwFO3ruybY1SKjJQnLYeuK3KmQmwV5OQ3dULr5iXxeEtzBLceultrKTIUTr');
      // debugPrint("Shot Url: $url");
      Share.shareXFiles([XFile('${directory.path}/transferqr.png')],
          text:
              'Hi! Here is my CiC QR and Payment\'s Link. Scan the QR or tap on the link for sending payment: ${privilegeController.mvpDynamicLinkModel.value.sortLink}',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> _inputAmount(
      BuildContext context, PrivilegeController privilegeController) async {
    await showCupertinoModalBottomSheet(
      context: context,
      barrierColor: Colors.black26,
      topRadius: const Radius.circular(14),
      builder: (_) => Material(
        child: Container(
          margin: const EdgeInsets.only(bottom: 30),
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
                  controller: privilegeController.mvpShareAmountController,
                  inputFormatterList: [
                    DecimalTextInputFormatter(decimalRange: 2)
                  ],
                  autoFocus: true,
                  labelText: 'Set Amount',
                  isRequired: true,
                  onChange: (value) {
                    // debugPrint("Hello, $value");
                    formatValueOnchange(
                        value: value,
                        controller:
                            privilegeController.mvpShareAmountController);
                    privilegeController.update();
                  },
                  suffixText: 'MVP',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
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
                          privilegeController.mvpShareAmountController.text =
                              privilegeController.mvpShareAmount.value;
                        },
                        isDisable: false,
                        isOutline: true,
                        title: 'Cancel',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GetBuilder(
                          init: privilegeController,
                          builder: (_) {
                            return CustomButton(
                              onPressed: () {
                                privilegeController.mvpShareAmount.value =
                                    privilegeController
                                        .mvpShareAmountController.text;
                                if (widget.mvpID != null) {
                                  privilegeController.onGenerateDynamicLinkMVP(
                                      widget.mvpID!,
                                      setAmount: privilegeController
                                          .mvpShareAmount.value);
                                }
                                privilegeController.update();
                                Navigator.pop(context);
                              },
                              backgroundColor: double.tryParse(
                                              privilegeController
                                                  .mvpShareAmountController.text
                                                  .clean()) !=
                                          null &&
                                      double.tryParse(privilegeController
                                              .mvpShareAmountController.text
                                              .clean())! >
                                          0
                                  ? Theme.of(context).primaryColor
                                  : const Color(0xffDBDBDB),
                              colorText: Colors.white,
                              isDisable: double.tryParse(privilegeController
                                              .mvpShareAmountController.text
                                              .clean()) !=
                                          null &&
                                      double.tryParse(privilegeController
                                              .mvpShareAmountController.text
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
      // _walletController.amountController.text =
      //     _walletController.recievingAmount.value;
      // _walletController.transferModel.value
      //     .copyWith(amount: _walletController.recievingAmount.value);
      // _walletController.update();
    });

    // if (ispop) {}
  }

  Column _hasAmount(
      TextStyle textStyle, PrivilegeController privilegeController) {
    return Column(
      children: [
        Text(
          'Amount',
          style: textStyle.copyWith(fontSize: 14),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: RichText(
            text: TextSpan(
              text:
                  '${privilegeController.mvpShareAmount.value.toCurrencyAmount()} ',
              style: textStyle.copyWith(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: 'MVP',
                  style: textStyle.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            privilegeController.mvpDynamicLinkModel.value.accountName ?? "",
            // _walletController.walletAmount.value.invester!.investerName!,
            style: textStyle.copyWith(fontSize: 14),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _amountbutton(
              textStyle,
              ontap: () {
                privilegeController.mvpShareAmount.value = '';
                privilegeController.mvpShareAmountController.text =
                    privilegeController.mvpShareAmount.value;
                 if (widget.mvpID != null) {
                                  privilegeController.onGenerateDynamicLinkMVP(
                                      widget.mvpID!);
                                }
                privilegeController.update();
              },
              text: 'Remove',
              color: AppColor.primaryColor,
            ),
            const SizedBox(width: 16),
            _amountbutton(
              textStyle,
              ontap: () {
                privilegeController.mvpShareAmountController.text = '';
                _inputAmount(context, privilegeController);
              },
              text: 'Reset Amount',
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector _amountbutton(TextStyle textStyle,
      {GestureTapCallback? ontap, String? text, Color? color}) {
    return GestureDetector(
      onTap: ontap
      // _inputAmount(context);
      ,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: 134,
        decoration: BoxDecoration(
            color: color?.withOpacity(0.14),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text ?? '',
            style: textStyle.copyWith(
                color: color, fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildbutton(
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
