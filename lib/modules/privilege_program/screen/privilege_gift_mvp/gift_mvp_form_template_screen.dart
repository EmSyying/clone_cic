// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

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
                                              accountNumber:
                                                  e.value.walletNumber,
                                              imageAccount: e.value.image,
                                              onTapDeleted: () async {
                                                context.pop();

                                                await priCon.deleteTemplate(
                                                    context, id = e.value.id);
                                              },
                                              onTapEdit: () {
                                                context.pop();
                                                try {
                                                  var string =
                                                      GoRouterState.of(context)
                                                          .location;

                                                  context.push(
                                                      "$string/create-template?templatId=${e.value.id}&recieverWalletNumber=${e.value.walletNumberNoFormat}&templateName=${e.value.name}&templateImg=${e.value.image}");
                                                  debugPrint(
                                                      "Hello ERRO====R $string");
                                                } catch (e) {
                                                  debugPrint(
                                                      "Hello ERRO====R$e");
                                                }
                                              },
                                              onTapHistory: () async {
                                                // context.pop(context);
                                                //header template history
                                                await priCon
                                                    .transactionHistoryTemplate(
                                                        e.value.id);
                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  // expand: false,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  builder: (context) =>
                                                      DraggableScrollableSheet(
                                                    initialChildSize: 0.64,
                                                    minChildSize: 0.2,
                                                    maxChildSize: 0.9,
                                                    expand: false,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ClipRRect(
                                                        clipBehavior:
                                                            Clip.hardEdge,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              color:
                                                                  Colors.white,
                                                              child: priCon
                                                                      .listTransactionHistoryTemplate
                                                                      .isNotEmpty
                                                                  ? ListView
                                                                      .separated(
                                                                      controller:
                                                                          scrollController,
                                                                      separatorBuilder:
                                                                          (context, index) =>
                                                                              Divider(
                                                                        color: Colors
                                                                            .grey[400],
                                                                        height:
                                                                            1,
                                                                      ),
                                                                      itemCount: priCon
                                                                          .listTransactionHistoryTemplate
                                                                          .length,
                                                                      itemBuilder:
                                                                          (_, index) =>
                                                                              TransactionHistoryTemplate(
                                                                        id: priCon
                                                                            .listTransactionHistoryTemplate[index]
                                                                            .id,
                                                                        title: priCon
                                                                            .listTransactionHistoryTemplate[index]
                                                                            .walletName,
                                                                        image: priCon
                                                                            .listTransactionHistoryTemplate[index]
                                                                            .image,
                                                                        dated: priCon
                                                                            .listTransactionHistoryTemplate[index]
                                                                            .paymentDate,
                                                                        amount: priCon
                                                                            .listTransactionHistoryTemplate[index]
                                                                            .amount,
                                                                      ),
                                                                    )
                                                                  : emtyStateTransactionTemplate(
                                                                      context),
                                                            ),
                                                            Container(
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10))),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10),
                                                                    width: 50,
                                                                    height: 5,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10.0),
                                                                        color: Colors
                                                                            .grey[300]),
                                                                  ),
                                                                  const SizedBox(
                                                                    height:
                                                                        10.0,
                                                                  ),
                                                                  //Header Card Gift Template
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            20.0,
                                                                        vertical:
                                                                            10.0),
                                                                    child:
                                                                        headerCardGiftTemplate(
                                                                      context,
                                                                      id: e
                                                                          .value
                                                                          .id,
                                                                      titleGiftTemplate: e
                                                                          .value
                                                                          .name,
                                                                      acountNumGiftTemplate: e
                                                                          .value
                                                                          .walletNumber,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            14.0,
                                                                        horizontal:
                                                                            20.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        'Transaction History',
                                                                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: const Color(0xff848F92)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              }),
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

  Container emtyStateTransactionTemplate(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 90.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/emptyState.png',
            width: 200,
            height: 200,
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
}
