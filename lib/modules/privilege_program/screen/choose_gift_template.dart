import 'dart:io';
import 'dart:ui';

import 'package:cicgreenloan/modules/privilege_program/screen/privilege_gift_mvp/transaction_history_template.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/texfield_format_currency/decimal_textinput_format.dart';
import '../../../Utils/helper/texfield_format_currency/format_value_onchange.dart';
import '../../../widgets/custom_menu_holder.dart';
import '../../../widgets/privilege/privilege_gift_mvp/custom_pop_up_template_history.dart';
import '../../wallet/controller/wallet_controller.dart';
import '../controller/privilege_controller.dart';

class ChosenMVPModel {
  final String? receiverName, receiverWallet, imageUrl, defaultImageLetter;
  final int? id;
  final String? color;
  ChosenMVPModel({
    this.receiverName,
    this.receiverWallet,
    this.imageUrl,
    this.defaultImageLetter,
    this.id,
    this.color,
  });
}

class ChooseGiftTemplateScreen extends StatelessWidget {
  const ChooseGiftTemplateScreen({
    super.key,
    this.chosenMVPModel,
  });
  final ChosenMVPModel? chosenMVPModel;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final walletController = Get.put(WalletController());
    final privilegeController = Get.put(PrivilegeController());
    walletController.onFetchMyPoin();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Gift MVP',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: CustomFocusedMenuHolder(
              openWithTap: true,
              blurSize: 0,
              menuWidth: (MediaQuery.of(context).size.width * 0.6),
              blurBackgroundColor: Colors.grey[900]!.withOpacity(0.2),
              menuItems: [
                CustomFocusedMenuItem(
                    mainAxisAlignment: MainAxisAlignment.start,
                    paddingBetweenItem: const EdgeInsets.only(right: 13),
                    title: Text(
                      "Transaction History",
                      style: txtTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () async {
                      await privilegeController
                          .transactionHistoryTemplate(chosenMVPModel!.id);

                      onShowPopUpTemplateHistory(
                        id: chosenMVPModel!.id,
                        titleGiftTemplate: chosenMVPModel!.receiverName,
                        acountNumGiftTemplate: chosenMVPModel!.receiverWallet,
                        context,
                        child: privilegeController
                                .listTransactionHistoryTemplate.isNotEmpty
                            ? ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.grey[400],
                                  height: 1,
                                ),
                                itemCount: privilegeController
                                    .listTransactionHistoryTemplate.length,
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (_, index) =>
                                    TransactionHistoryTemplate(
                                  id: privilegeController
                                      .listTransactionHistoryTemplate[index].id,
                                  title: privilegeController
                                      .listTransactionHistoryTemplate[index]
                                      .walletName,
                                  // image:
                                  //     priCon.listTransactionHistoryTemplate[
                                  //             index]
                                  //         .image,
                                  dated: privilegeController
                                      .listTransactionHistoryTemplate[index]
                                      .paymentDate,
                                  amount: privilegeController
                                      .listTransactionHistoryTemplate[index]
                                      .amount,
                                  // amountColorType:
                                  //     listTransactionHistory[
                                  //             index]
                                  //         .amountColorType,
                                ),
                              )
                            : emtyStateTransactionTemplate(context),
                      );
                    },
                    leadingIcon: SvgPicture.asset(
                        "assets/images/transaction-history.svg")),
                CustomFocusedMenuItem(
                    paddingBetweenItem: const EdgeInsets.only(right: 13),
                    mainAxisAlignment: MainAxisAlignment.start,
                    title: Text(
                      "Edit Template",
                      style: txtTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      debugPrint("Hello, world!");
                      try {
                        var string = GoRouterState.of(context).location;
                        if (chosenMVPModel != null) {
                          context.push(
                              "$string/create-template?templatId=${chosenMVPModel!.id}&recieverWalletNumber=${chosenMVPModel!.receiverWallet}&templateName=${chosenMVPModel!.receiverName}&templateImg=${chosenMVPModel!.imageUrl}");
                        }

                        debugPrint("Hello ERRO====R $string");
                      } catch (e) {
                        debugPrint("Hello ERRO====R$e");
                      }
                    },
                    leadingIcon:
                        SvgPicture.asset("assets/images/edit-pencil.svg")),
                CustomFocusedMenuItem(
                    paddingBetweenItem: const EdgeInsets.only(right: 13),
                    mainAxisAlignment: MainAxisAlignment.start,
                    title: Text(
                      "Delete Template",
                      style: txtTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      if (!Platform.isIOS) {
                        buildAlertIos(context, txtTheme,
                            chosenMVPModel != null ? chosenMVPModel!.id : 0);
                      } else {
                        buildAlertAndroid(context, txtTheme,
                            chosenMVPModel != null ? chosenMVPModel!.id : 0);
                      }
                    },
                    leadingIcon: SvgPicture.asset("assets/images/trash.svg"))
              ],
              onPressed: () {
                debugPrint('Hello');
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  // padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Center(
                      child:
                          SvgPicture.asset("assets/images/more-vertical.svg"))),
            ),
          ),
        ],
        leading: IconButton(
          icon: kIsWeb
              ? const Icon(Icons.arrow_back)
              : Platform.isAndroid
                  ? const Icon(Icons.arrow_back)
                  : const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      // bottomNavigationBar: BottomNavigationBarButton(
      //   onPressed: () {},
      // ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                excludeHeaderSemantics: true,
                backgroundColor: Theme.of(context).primaryColor,
                leading: const Text(''),
                expandedHeight: 170,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  centerTitle: false,
                  //created Template
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: const [0.4, 0.8],
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                          Theme.of(context).primaryColor,
                          Colors.white24
                        ],
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(),
                      child: Stack(
                        children: [
                          Container(
                            // color: Theme.of(context).primaryColor,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                stops: const [0.6, 0.9],
                                begin: Alignment.topCenter,
                                end: Alignment.center,
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Colors.white
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 55),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2),
                                        child: Text(
                                          chosenMVPModel != null
                                              ? chosenMVPModel!.receiverName!
                                              : "",
                                          style: txtTheme.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        chosenMVPModel != null
                                            ? chosenMVPModel!.receiverWallet!
                                            : "",
                                        style: txtTheme.bodyMedium!.copyWith(
                                          color: const Color(0xff848F92),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //upload Profile
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 88.0,
                              height: 88.0,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: chosenMVPModel != null
                                      ? chosenMVPModel!.defaultImageLetter != ""
                                          ? chosenMVPModel!.color != null
                                              ? Color(int.parse(
                                                  chosenMVPModel!.color!))
                                              : Colors.grey[200]
                                          : Colors.white
                                      : Colors.white,
                                  shape: BoxShape.circle),
                              child: chosenMVPModel == null
                                  ? const SizedBox()
                                  : chosenMVPModel!.defaultImageLetter !=
                                              null &&
                                          chosenMVPModel!.defaultImageLetter !=
                                              ''
                                      ? Center(
                                          child: Text(
                                            chosenMVPModel!.defaultImageLetter
                                                .toString(),
                                            style:
                                                txtTheme.bodyMedium!.copyWith(
                                              fontSize: 25,
                                            ),
                                          ),
                                        )
                                      : Image.network(
                                          chosenMVPModel!.imageUrl ?? "",
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Center(
                                            child: Icon(
                                              Icons.error,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: BodyWidget(
          txtTheme: txtTheme,
          walletController: walletController,
          privilegeController: privilegeController,
          receiverName:
              chosenMVPModel != null ? chosenMVPModel!.receiverName : "",
          receiverWallet:
              chosenMVPModel != null ? chosenMVPModel!.receiverWallet : "",
        ),
      ),
    );
  }
}

Container emtyStateTransactionTemplate(BuildContext context) {
  return Container(
    color: Colors.white,
    width: double.infinity,
    padding: const EdgeInsets.only(bottom: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/emptyState.png',
          width: 180,
          height: 180,
        ),
        Text(
          'No Transaction History',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          'No Transaction History Here !',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

void buildAlertIos(context, TextTheme txtTheme, int? deleteID) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.only(top: 18),
        contentPadding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        title: Center(
          child: Text("Delete Template",
              style: txtTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontSize: 17,
              )),
        ),
        content: Text(
          "Are you sure you want to delete \nthis template?",
          style: txtTheme.bodyMedium!.copyWith(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        actions: [
          Column(
            children: [
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(.5),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: txtTheme.bodyMedium!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff007AFF)),
                      ),
                    ),
                  )),

              Divider(
                height: 1,
                color: Colors.grey.withOpacity(.5),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    if (deleteID != null) {
                      Get.put(PrivilegeController()).deleteTemplate(
                          context, deleteID,
                          isFromChosenTemplate: true);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Yes, Delete",
                        style: txtTheme.bodyMedium!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffED1E26)),
                      ),
                    ),
                  )),
              // TextButton(
              //   child: Text(
              //     "Yes, Delete",
              //     style: txtTheme.bodyMedium!.copyWith(
              //         fontSize: 17,
              //         fontWeight: FontWeight.w400,
              //         color: const Color(0xffED1E26)),
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          )
        ],
      );
    },
  );
}

void buildAlertAndroid(context, TextTheme txtTheme, int? deleteID) {
  // show the dialog
  var mainContext = context;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Delete Template",
          style: txtTheme.bodyMedium!.copyWith(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        content: Text(
          "Are you sure you want to delete this template?",
          style: txtTheme.bodyMedium!.copyWith(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              "Delete",
            ),
            onPressed: () {
              Navigator.pop(context);
              if (deleteID != null) {
                Get.put(PrivilegeController()).deleteTemplate(
                    mainContext, deleteID,
                    isFromChosenTemplate: true);
              }
            },
          )
        ],
      );
    },
  );
}

class BottomNavigationBarButton extends StatelessWidget {
  final void Function()? onPressed;
  const BottomNavigationBarButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: const Color(0xffFFFFFF), boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 1,
          )
        ]),
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 34),
        child: CustomButton(
          isDisable: false,
          onPressed: onPressed,
          title: "Pay Now",
          isOutline: false,
          // backgroundColor: Theme.of(context).primaryColor,
        ));
  }
}

class BodyWidget extends StatelessWidget {
  BodyWidget({
    super.key,
    required this.txtTheme,
    this.walletController,
    this.privilegeController,
    this.receiverName,
    this.receiverWallet,
  });
  final String? receiverName;
  final String? receiverWallet;

  final TextTheme txtTheme;
  final WalletController? walletController;
  final PrivilegeController? privilegeController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController mvpBalanceTextController =
        TextEditingController(text: " ");
    return Obx(
      () => Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFieldNew(
                      enable: false,
                      noDisableColor: true,
                      // isReadOnly: true,
                      controller: mvpBalanceTextController,
                      prefix: RichText(
                        text: TextSpan(
                          style: txtTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff848F92),
                            fontSize: 16,
                          ),
                          text:
                              "${walletController!.mvpBalance.value.mvpWalletNumber}"
                              " | ",
                          children: [
                            TextSpan(
                              style: txtTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              text: walletController!
                                      .mvpBalance.value.mvpAmountFormat ??
                                  "",
                            ),
                            TextSpan(
                              style: txtTheme.bodyMedium!.copyWith(
                                  fontSize: 12, color: const Color(0xff848F92)),
                              text: walletController!
                                          .mvpBalance.value.mvpAmountFormat !=
                                      null
                                  ? ("  " "MVP")
                                  : "",
                            )
                          ],
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      isRequired: false,
                      // hintText: 'Enter receive number',
                      onChange: (phone) {},
                      isValidate: true,
                      labelText: 'MVP Balance',
                    ),
                    CustomTextFieldNew(
                      controller: privilegeController!
                          .amountChosenGiftMvpController.value,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 15, right: 10),
                        child: Text("MVP",
                            style: txtTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color(0xff848F92))),
                      ),
                      enable: true,
                      isRequired: true,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      hintText: 'Amount',
                      validateText: privilegeController!
                          .amountChosenGiftMvpValidateText.value,
                      onChange: (value) {
                        formatValueOnchange(
                            value: value,
                            controller: privilegeController!
                                .amountChosenGiftMvpController.value);
                        privilegeController!
                            .validateChosenGiftMvp(value.replaceAll(",", ""));
                        // privilegeController.update();
                      },
                      inputFormatterList: [
                        DecimalTextInputFormatter(decimalRange: 2),
                      ],
                      isValidate:
                          privilegeController!.isChosenGiftMVPValidate.value,
                      labelText: 'Amount',
                    ),
                    CustomTextFieldNew(
                      enable: true,
                      isRequired: false,
                      controller: privilegeController!.mvpGiftRemark,
                      keyboardType: TextInputType.text,
                      hintText: 'Remark',
                      onChange: (phone) {
                        privilegeController!.update();
                      },
                      labelText: 'Remark',
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBarButton(
              onPressed: () {
                privilegeController!.validateChosenGiftMvp(privilegeController!
                    .amountChosenGiftMvpController.value.text);
                try {
                  var location = GoRouterState.of(context).location;
                  final path =
                      location.replaceAll("?${Uri.parse(location).query}", "");
                  debugPrint("path$path");
                  if (privilegeController!.isChosenGiftMVPValidate.value) {
                    context.push(
                        "$path/review-gift-mvp?amount=${privilegeController!.amountChosenGiftMvpController.value.text}&receiverWallet=${receiverWallet!.replaceAll(" | MVP", "")}&receiverName=$receiverName");
                  } else {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                } catch (e) {
                  debugPrint("Hello ERROR$e");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
