// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:cicgreenloan/modules/privilege_program/model/gift_mvp_model/template_gift_mvp_model.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege_gift_mvp/transaction_history_template.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/bonus/custom_empty_state.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../../widgets/privilege/privilege_gift_mvp/custom_card_gift_mvp_form.dart';
import '../../../../widgets/privilege/privilege_gift_mvp/custom_pop_up_template_history.dart';
import '../../controller/privilege_controller.dart';
import '../choose_gift_template.dart';

class GiftMVPFromTemplateScreen extends StatefulWidget {
  // final int? id;
  const GiftMVPFromTemplateScreen({
    super.key,
  });

  @override
  State<GiftMVPFromTemplateScreen> createState() =>
      _GiftMVPFromTemplateScreenState();
}

class _GiftMVPFromTemplateScreenState extends State<GiftMVPFromTemplateScreen> {
  final priCon = Get.put(PrivilegeController());
  int? id;
  Timer? searchOnStoppedTyping;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      priCon.fetchListTemplate('');
    });
    //
    // priCon.transactionHistoryTemplate(id);
    super.initState();
  }

  //function search template
  onChangeSearchName(value) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(
      () => searchOnStoppedTyping =
          Timer(duration, () => searchTemplateName(value)),
    );
  }

  searchTemplateName(textSearch) async {
    await priCon.fetchListTemplate(textSearch).then(
          (value) {},
        );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBarWhiteColor(
            context: context,
            elevation: 0,
            title: 'Template',
            colorTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
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
          body: Obx(
            () => Container(
              color: Colors.transparent,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Text form field Search
                    Container(
                      height: 38,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomFormFieldSearch(
                        onSaved: (e) {},
                        onChanged: (value) async {
                          await onChangeSearchName(value);
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    //Template
                    const SizedBox(
                      height: 20.0,
                    ),
                    priCon.isLoadingTemplate.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : priCon.listGiftTemplate.isNotEmpty
                            ? Column(
                                children: priCon.listGiftTemplate
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            try {
                                              var string =
                                                  GoRouterState.of(context)
                                                      .location;
                                              priCon
                                                  .onClearChosenGiftMVPField();
                                              context.push(
                                                  "$string/choosen-template",
                                                  extra: ChosenMVPModel(
                                                    id: e.value.id,
                                                    imageUrl: e.value.image,
                                                    defaultImageLetter:
                                                        e.value.defaultImage,
                                                    receiverName: e.value.name,
                                                    receiverWallet:
                                                        e.value.walletNumber,
                                                  ));
                                            } catch (e) {
                                              debugPrint("Hello ERROR$e");
                                            }
                                          },
                                          child: CustomCardGiftMVPForm(
                                            id: e.value.id,
                                            acountName: e.value.name,
                                            accountNumber: e.value.walletNumber,
                                            imageAccount: e.value.image,
                                            defaultImage: e.value.defaultImage,
                                            onTapDeleted: () {
                                              priCon.deleteTemplate(
                                                context,
                                                id = e.value.id,
                                              );
                                              // priCon.isDeletTemplate.value;
                                            },
                                            onTapEdit: () {
                                              try {
                                                var string =
                                                    GoRouterState.of(context)
                                                        .location;

                                                context.push(
                                                    "$string/create-template?templatId=${e.value.id}&recieverWalletNumber=${e.value.walletNumberNoFormat}&templateName=${e.value.name}${e.value.image != null ? '&templateImg=${e.value.image}' : ''}${e.value.defaultImage != null ? '&defaultImage=${e.value.defaultImage}' : ''}");
                                                debugPrint(
                                                    "Hello ERRO====R $string");
                                              } catch (e) {
                                                debugPrint("Hello ERRO====R$e");
                                              }
                                            },
                                            onTapHistory: () {
                                              //header template history
                                              priCon.transactionHistoryTemplate(
                                                  e.value.id);
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  14),
                                                          topRight:
                                                              Radius.circular(
                                                                  14)),
                                                ),
                                                // expand: false,
                                                backgroundColor: Colors.white,
                                                builder: (context) =>
                                                    DraggableScrollableSheet(
                                                  initialChildSize: 0.64,
                                                  minChildSize: 0.2,
                                                  maxChildSize: 0.9,
                                                  expand: false,
                                                  builder: (context,
                                                      scrollController) {
                                                    return containPopTransactionHistory(
                                                        scrollController,
                                                        context,
                                                        e);
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : const CustomEmptyState(
                                colors: true,
                                title: 'No Template!',
                                description: 'No Template Here !',
                              ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.only(right: 20, bottom: 30),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: SvgPicture.asset(
                  'assets/images/privilege/created_template.svg'),
              onPressed: () {
                try {
                  var string = GoRouterState.of(context).location;

                  context.push("$string/create-template");
                } catch (e) {
                  debugPrint("Hello ERROR$e");
                }
              },
            ),
          ),
        )
      ],
    );
  }

  containPopTransactionHistory(ScrollController scrollController,
      BuildContext context, MapEntry<int, TemplateGiftMVPModel> e) {
    return Obx(
      () => priCon.isLoadingTransactionTemplate.value
          ? loadingTransactionTemplate(
              context,
              ChosenMVPModel(
                id: e.value.id,
                receiverName: e.value.name,
                receiverWallet: e.value.walletNumber,
              ))
          : priCon.listTransactionHistoryTemplate.isEmpty
              ? emtyStateTransactionTemplate(
                  context,
                  ChosenMVPModel(
                    id: e.value.id,
                    receiverName: e.value.name,
                    receiverWallet: e.value.walletNumber,
                  ))
              : ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14)),
                  child: Stack(
                    children: [
                      Container(
                          color: Colors.white,
                          child: ListView.separated(
                            controller: scrollController,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.grey[400],
                              height: 1,
                            ),
                            itemCount:
                                priCon.listTransactionHistoryTemplate.length,
                            itemBuilder: (_, index) =>
                                TransactionHistoryTemplate(
                              id: priCon
                                  .listTransactionHistoryTemplate[index].id,
                              title: priCon
                                  .listTransactionHistoryTemplate[index]
                                  .walletName,
                              image: priCon
                                  .listTransactionHistoryTemplate[index].image,
                              dated: priCon
                                  .listTransactionHistoryTemplate[index]
                                  .paymentDate,
                              amount: priCon
                                  .listTransactionHistoryTemplate[index].amount,
                              defaultImage: priCon
                                  .listTransactionHistoryTemplate[index]
                                  .defaultImage,
                            ),
                          )),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[300]),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            //Header Card Gift Template
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: headerCardGiftTemplate(
                                context,
                                titleGiftTemplate: e.value.name,
                                acountNumGiftTemplate: e.value.walletNumber,
                                id: e.value.id,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 20.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Transaction History',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff848F92)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
