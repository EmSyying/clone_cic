import 'dart:io';

import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/privilege/custom_card_current_point.dart';
import '../../../wallet/controller/wallet_controller.dart';

class GiftMVPTransferScreen extends StatelessWidget {
  const GiftMVPTransferScreen({super.key});

  void _showTemplate(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
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
          DraggableScrollableSheet(
            snap: true,
            snapSizes: const [1],
            initialChildSize: 0.5,
            maxChildSize: 1,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
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
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(title: Text('Item $index'));
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
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
    final walletController = Get.put(WalletController());
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
            walletController.clearGiftMVPForm();
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
                            isValidate: walletController
                                .isGiftMVPVerifyAccountValidate.value,
                            validateText: walletController
                                .isGiftMVPVerifyAccountValidateMessage.value,
                            inputFormatterList: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: false,
                              signed: false,
                            ),
                            isRequired: true,
                            labelText: 'Receiver Wallet Number',
                            hintText: 'Receiver Wallet Number',
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
                                walletController.inputRecieverWalletChanged,
                          ),
                          if (walletController
                                      .isGiftMVPVerifyAccountValidate.value ==
                                  true &&
                              walletController.receiverWalletName.value != '')
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20,
                                  bottom: walletController
                                              .receiveWalletNumber.value !=
                                          ''
                                      ? 10
                                      : 0,
                                  right: 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/wallet_found.svg'),
                                  const SizedBox(width: 5),
                                  Text(
                                    walletController.receiverWalletName.value,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff4FA30F)),
                                  )
                                ],
                              ),
                            ),
                          Focus(
                            onFocusChange: (value) {},
                            child: CustomTextFieldNew(
                              validateText: 'You have not enought Gift MVP',
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              // inputFormatterList: [DecimalTextInputFormatter()],
                              onChange: (value) {
                                debugPrint('hany test amount===$value');
                              },

                              controller: walletController
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
                            controller: walletController.mvpGiftRemark,
                            labelText: 'Remark',
                            hintText: 'Remark',
                            onChange: (value) {},
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: walletController.createTemplate.value
                                      ? CustomTextFieldNew(
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
                                            value: walletController
                                                .createTemplate.value,
                                            onChanged: (value) {
                                              walletController
                                                  .createTemplate.value = value;
                                            },
                                            activeColor: AppColor.mainColor),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 7, right: 12),
                                        child: Switch(
                                            value: walletController
                                                .createTemplate.value,
                                            onChanged: (value) {
                                              walletController
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
                onPressed: () {
                  try {
                    var string = GoRouterState.of(context).location;

                    context.push("$string/review-gift-mvp");
                  } catch (e) {
                    debugPrint("Hello ERROR$e");
                  }
                  // context.push('/mymvp/gift-mvp-transfer/review-gift-mvp');
                },
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
