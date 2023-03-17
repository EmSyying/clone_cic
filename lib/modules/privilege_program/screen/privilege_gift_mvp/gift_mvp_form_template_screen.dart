import 'dart:async';
import 'dart:io';

import 'package:cicgreenloan/modules/privilege_program/screen/privilege_gift_mvp/transaction_history_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/bonus/custom_empty_state.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../../widgets/privilege/privilege_gift_mvp/custom_card_gift_mvp_form.dart';
import '../../../../widgets/privilege/privilege_gift_mvp/custom_pop_up_template_history.dart';
import '../../controller/privilege_controller.dart';
import '../../model/gift_mvp_model/card_template_mvp_model.dart';

class GiftMVPFromTemplateScreen extends StatefulWidget {
  const GiftMVPFromTemplateScreen({super.key});

  @override
  State<GiftMVPFromTemplateScreen> createState() =>
      _GiftMVPFromTemplateScreenState();
}

class _GiftMVPFromTemplateScreenState extends State<GiftMVPFromTemplateScreen> {
  final priCon = Get.put(PrivilegeController());
  Timer? searchOnStoppedTyping;
  @override
  void initState() {
    priCon.fetchListTemplate('');
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
    return CupertinoScaffold(
      body: Builder(
        builder: (context) {
          return CupertinoPageScaffold(
            child: Scaffold(
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 16.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                try {
                                                  var string =
                                                      GoRouterState.of(context)
                                                          .location;

                                                  context.push(
                                                      "$string/choosen-template");
                                                } catch (e) {
                                                  debugPrint("Hello ERROR$e");
                                                }
                                              },
                                              child: CustomCardGiftMVPForm(
                                                  id: e.value.id,
                                                  acountName: e.value.name,
                                                  accountNumber:
                                                      e.value.walletNumber,
                                                  // imageAccount: ,
                                                  onTapDeleted: () {},
                                                  onTapEdit: () {
                                                    context.pop();
                                                    try {
                                                      var string =
                                                          GoRouterState.of(
                                                                  context)
                                                              .location;

                                                      context.push(
                                                          "$string/edit-template");
                                                      debugPrint(
                                                          "Hello ERRO====R $string");
                                                    } catch (e) {
                                                      debugPrint(
                                                          "Hello ERRO====R$e");
                                                    }
                                                  },
                                                  onTapHistory: () async {
                                                    context.pop(context);
                                                    onShowPopUpTemplateHistory(
                                                      context,
                                                      child: ListView.separated(
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                Divider(
                                                          color:
                                                              Colors.grey[400],
                                                          height: 1,
                                                        ),
                                                        itemCount:
                                                            listTransactionHistory
                                                                .length,
                                                        physics:
                                                            const ScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemBuilder: (_,
                                                                index) =>
                                                            TransactionHistoryTemplate(
                                                          title:
                                                              listTransactionHistory[
                                                                      index]
                                                                  .accountName,
                                                          image:
                                                              listTransactionHistory[
                                                                      index]
                                                                  .image,
                                                          dated:
                                                              listTransactionHistory[
                                                                      index]
                                                                  .dated,
                                                          amount:
                                                              listTransactionHistory[
                                                                      index]
                                                                  .amount,
                                                          amountColorType:
                                                              listTransactionHistory[
                                                                      index]
                                                                  .amountColorType,
                                                        ),
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
              floatingActionButton: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: SvgPicture.asset(
                      'assets/images/privilege/created_template.svg'),
                  onPressed: () {
                    // context.push(
                    //     "/mymvp/gift-mvp-option/gift-mvp-template/create-template");
                    try {
                      var string = GoRouterState.of(context).location;

                      context.push("$string/create-template");
                    } catch (e) {
                      debugPrint("Hello ERROR$e");
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<CardTemplateMVPModel> listTransactionHistory = [
  CardTemplateMVPModel(
    accountName: 'Champei Spa Toul Kork',
    dated: '21 Feb 2023 | 01:34:12 AM',
    image: 'assets/images/privilege/transfer_icon.svg',
    amount: '+ 245 MVP',
    id: 1,
  ),
  CardTemplateMVPModel(
      accountName: 'Champei Spa Toul Kork 1',
      dated: '21 Feb 2023 | 01:34:12 AM',
      image: 'assets/images/privilege/transfer_icon.svg',
      amount: '+ 245 MVP',
      id: 2,
      amountColorType: "Cash Out"),
  CardTemplateMVPModel(
    accountName: 'Champei Spa Toul Kork 2',
    dated: '21 Feb 2023 | 01:34:12 AM',
    image: 'assets/images/privilege/transfer_icon.svg',
    amount: '+ 245 MVP',
    id: 3,
  ),
  CardTemplateMVPModel(
    accountName: 'Champei Spa Toul Kork 3',
    dated: '21 Feb 2023 | 01:34:12 AM',
    image: 'assets/images/privilege/transfer_icon.svg',
    amount: '+ 245 MVP',
    id: 4,
    amountColorType: "Cash Out",
  ),
  CardTemplateMVPModel(
    accountName: 'Champei Spa Toul Kork 4',
    dated: '21 Feb 2023 | 01:34:12 AM',
    image: 'assets/images/privilege/transfer_icon.svg',
    amount: '+ 245 MVP',
    id: 5,
  ),
  CardTemplateMVPModel(
    accountName: 'Champei Spa Toul Kork 5',
    dated: '21 Feb 2023 | 01:34:12 AM',
    image: 'assets/images/privilege/transfer_icon.svg',
    amount: '+ 245 MVP',
    id: 6,
  ),
];
