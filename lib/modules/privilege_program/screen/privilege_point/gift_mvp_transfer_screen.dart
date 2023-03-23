import 'dart:io';

import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/privilege/custom_card_current_point.dart';
import '../../../../widgets/privilege/privilege_gift_mvp/custom_card_gift_mvp_form.dart';
import '../../../wallet/controller/wallet_controller.dart';
import '../../controller/privilege_controller.dart';

class GiftMVPTransferScreen extends StatefulWidget {
  const GiftMVPTransferScreen({super.key, this.walletNumber, this.amount = ""});
  final String? walletNumber;
  final String amount;

  @override
  State<GiftMVPTransferScreen> createState() => _GiftMVPTransferScreenState();
}

class _GiftMVPTransferScreenState extends State<GiftMVPTransferScreen> {
  void _initialData() {
    walletController.onFetchMyPoin();
    if (widget.amount != "") {
      privilegeController.amountgiftMVPController.value.text = widget.amount;
      privilegeController.amountValidator();
    }
    if (widget.walletNumber != null) {
      privilegeController.receiveWalletNumberController.text =
          widget.walletNumber ?? "";
      privilegeController.inputRecieverWalletChanged(
          privilegeController.receiveWalletNumberController.text);
    }

    // debugPrint('Success => ${widget.walletNumber} => ${widget.amount}');
    if (widget.walletNumber == null && widget.amount == '') {
      debugPrint('Clear form Work');
      privilegeController.clearGiftMVPForm();
    }
  }

  bool get enableAccountNumber =>
      widget.walletNumber == null || widget.walletNumber == '';
  bool get enableAmount => widget.amount == '';

  @override
  void initState() {
    _initialData();
    super.initState();
  }

  final privilegeController = Get.put(PrivilegeController());
  final walletController = Get.put(WalletController());

  void _showTemplate(BuildContext context) {
    privilegeController.fetchListTemplate();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              bottom: false,
              child: DraggableScrollableSheet(
                expand: false,
                snap: true,
                snapSizes: const [0.5, .95],
                initialChildSize: 0.5,
                maxChildSize: .95,
                minChildSize: 0.5,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        CustomAppBarWhiteColor(
                          context: context,

                          elevation: 0,
                          title: 'Choose Template',
                          // colorTitle: true,
                          // backgroundColor: Theme.of(context).primaryColor,
                          leading: IconButton(
                            icon: _icon,
                            color: Colors.black,
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        Expanded(
                          child: Obx(
                            () => privilegeController.isLoadingTemplate.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.separated(
                                    padding: const EdgeInsets.all(20),
                                    controller: scrollController,
                                    itemCount: privilegeController
                                        .listGiftTemplate.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final item = privilegeController
                                          .listGiftTemplate[index];
                                      return GestureDetector(
                                        onTap: () {
                                          privilegeController
                                                  .receiveWalletNumberController
                                                  .text =
                                              item.walletNumberNoFormat ?? '';
                                          privilegeController
                                              .inputRecieverWalletChanged(
                                                  privilegeController
                                                      .receiveWalletNumberController
                                                      .text);

                                          Navigator.pop(context);
                                        },
                                        child: CustomCardGiftMVPForm(
                                          backgroundColor: privilegeController
                                              .listColors[index % 6],
                                          id: item.id,
                                          acountName: item.name,
                                          accountNumber: item.walletNumber,
                                          imageAccount: item.image,
                                          defaultImage: item.defaultImage,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 20),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon get _icon => Platform.isIOS
      ? const Icon(Icons.arrow_back_ios)
      : const Icon(Icons.arrow_back);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Gift MVP',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: _icon,
          color: Colors.white,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: CardCurrentPoints(
                        title: 'MVP Balance',
                        amount:
                            walletController.mvpBalance.value.mvpAmountFormat ??
                                '0.00',
                      ),
                    ),
                    Container(
                      constraints:
                          BoxConstraints(minHeight: size.height * 0.63),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          CustomTextFieldNew(
                            enable: enableAccountNumber,
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            initialValue: privilegeController
                                .receiveWalletNumberController.text,
                            isValidate: privilegeController
                                .isGiftMVPVerifyAccountValidate.value,
                            validateText: privilegeController
                                .isGiftMVPVerifyAccountValidateMessage.value,
                            controller: privilegeController
                                .receiveWalletNumberController,
                            inputFormatterList: const [
                              // AccountNumberFormatter(),
                            ],
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: false,
                              signed: false,
                            ),
                            isRequired: true,
                            labelText: 'Receiver MVP Wallet Number',
                            hintText: 'Receiver MVP Wallet Number',
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      thickness: 1,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showTemplate(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: SvgPicture.asset(
                                        'assets/images/profile_template.svg',
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onChange:
                                privilegeController.inputRecieverWalletChanged,
                            errorWidget: privilegeController
                                        .isGiftMVPVerifyAccountValidate.value &&
                                    privilegeController
                                        .receiveWalletNumber.isNotEmpty &&
                                    privilegeController
                                        .receiverWalletName.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, top: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/wallet_found.svg',
                                          height: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          privilegeController
                                              .receiverWalletName.value,
                                          style: const TextStyle(
                                              fontSize: 10.5,
                                              color: Color(0xff4FA30F)),
                                        )
                                      ],
                                    ),
                                  )
                                : null,
                          ),
                          SizedBox(
                              height: privilegeController
                                      .isGiftMVPVerifyAccountValidate.value
                                  ? 20
                                  : 10),
                          Focus(
                            onFocusChange: (value) {},
                            child: CustomTextFieldNew(
                              enable: enableAmount,
                              initialValue: privilegeController
                                  .amountgiftMVPController.value.text,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              validateText: privilegeController
                                      .amountgiftMVPController
                                      .value
                                      .text
                                      .isEmpty
                                  ? 'Please enter amount to gift.'
                                  : 'You don\'t have enought MVP',

                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              // inputFormatterList: [DecimalTextInputFormatter()],
                              isValidate:
                                  privilegeController.validateMVPAmount.value,
                              onChange: (value) {
                                privilegeController.amountValidator();
                              },

                              controller: privilegeController
                                  .amountgiftMVPController.value,
                              isRequired: true,
                              labelText: 'Amount',
                              hintText: 'Amount',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text(
                                  'MVP',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: const Color(0xffBDBDBD)),
                                ),
                              ),
                            ),
                          ),
                          CustomTextFieldNew(
                            initialValue:
                                privilegeController.mvpGiftRemark.text,
                            controller: privilegeController.mvpGiftRemark,
                            labelText: 'Remark',
                            hintText: 'Remark',
                            onChange: (value) {},
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child:
                                      privilegeController.createTemplate.value
                                          ? CustomTextFieldNew(
                                              controller: privilegeController
                                                  .templateNameController,
                                              initialValue: privilegeController
                                                  .templateNameController.text,
                                              labelText: 'Create Template',
                                              hintText: 'Create Template',
                                              onChange: (value) {},
                                              padding: EdgeInsets.zero,
                                            )
                                          : Text(
                                              'Create Template',
                                              style: textStyle,
                                            ),
                                ),
                                Platform.isIOS
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 17),
                                        child: CupertinoSwitch(
                                            value: privilegeController
                                                .createTemplate.value,
                                            onChanged: (value) {
                                              privilegeController
                                                  .createTemplate.value = value;
                                            },
                                            activeColor: AppColor.mainColor),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 7, right: 12),
                                        child: Switch(
                                            value: privilegeController
                                                .createTemplate.value,
                                            onChanged: (value) {
                                              privilegeController
                                                  .createTemplate.value = value;
                                            },
                                            activeColor: AppColor.mainColor),
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: CustomButton(
                width: double.infinity,
                backgroundColor: privilegeController.validateMVPAmount.value &&
                        privilegeController
                            .isGiftMVPVerifyAccountValidate.value &&
                        privilegeController.receiverWalletName.isNotEmpty &&
                        privilegeController
                            .amountgiftMVPController.value.text.isNotEmpty
                    ? AppColor.mainColor
                    : Colors.grey[400],
                onPressed: privilegeController.validateMVPAmount.value &&
                        privilegeController
                            .isGiftMVPVerifyAccountValidate.value &&
                        privilegeController.receiverWalletName.isNotEmpty &&
                        privilegeController
                            .amountgiftMVPController.value.text.isNotEmpty
                    ? () {
                        debugPrint('Clicked');

                        try {
                          final location = GoRouterState.of(context).location;
                          if (location.contains("/giftmvp")) {
                            context.push("/giftmvp/review-gift-mvp");
                          } else {
                            context.push("$location/review-gift-mvp");
                          }
                          debugPrint("location$location");
                        } catch (e) {
                          debugPrint("Routing Error => $e");
                        }
                        // context
                        //     .push('/mymvp/gift-mvp-transfer/review-gift-mvp');
                      }
                    : null,
                title: 'Pay Now',
                isDisable: false,
                isOutline: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
