import 'dart:io';

import 'package:cicgreenloan/modules/privilege_program/screen/privilege_gift_mvp/transaction_history_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../../widgets/privilege/privilege_gift_mvp/custom_card_gift_mvp_form.dart';
import '../../../../widgets/privilege/privilege_gift_mvp/custom_pop_up_template_history.dart';
import '../../model/gift_mvp_model/card_template_mvp_model.dart';

class GiftMVPFromTemplateScreen extends StatelessWidget {
  const GiftMVPFromTemplateScreen({super.key});

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
              body: Container(
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
                          onChanged: (v) {},
                          //  controller: priCon.textSearchCategoriesController,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      //Template
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: listAcountTemplate
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    try {
                                      var string =
                                          GoRouterState.of(context).location;

                                      context.push("$string/choosen-template");
                                    } catch (e) {
                                      debugPrint("Hello ERROR$e");
                                    }
                                  },
                                  child: CustomCardGiftMVPForm(
                                      id: e.id,
                                      acountName: e.accountName,
                                      accountNumber: e.accountNumber,
                                      imageAccount: e.imageAcount,
                                      onTapDeleted: () {},
                                      onTapEdit: () {
                                        context.pop();
                                        try {
                                          var string = GoRouterState.of(context)
                                              .location;

                                          context.push("$string/edit-template");
                                          debugPrint("Hello ERRO====R $string");
                                        } catch (e) {
                                          debugPrint("Hello ERRO====R$e");
                                        }
                                      },
                                      onTapHistory: () async {
                                        context.pop(context);
                                        onShowPopUpTemplateHistory(
                                          context,
                                          child: ListView.separated(
                                            separatorBuilder:
                                                (context, index) => Divider(
                                              color: Colors.grey[400],
                                              height: 1,
                                            ),
                                            itemCount:
                                                listTransactionHistory.length,
                                            physics: const ScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (_, index) =>
                                                TransactionHistoryTemplate(
                                              title:
                                                  listTransactionHistory[index]
                                                      .accountName,
                                              image:
                                                  listTransactionHistory[index]
                                                      .image,
                                              dated:
                                                  listTransactionHistory[index]
                                                      .dated,
                                              amount:
                                                  listTransactionHistory[index]
                                                      .amount,
                                              amountColorType:
                                                  listTransactionHistory[index]
                                                      .amountColorType,
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
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

List<CardTemplateMVPModel> listAcountTemplate = [
  CardTemplateMVPModel(
    accountName: 'Champei Spa',
    accountNumber: '089 993 338 | MVP',
    imageAcount: 'assets/images/svgfile/cashout.svg',
    id: 2,
  ),
  CardTemplateMVPModel(
    accountName: 'Bell Saka',
    accountNumber: '123 456 663 | MVP',
    imageAcount: 'assets/images/svgfile/cashout.svg',
    id: 3,
  ),
  CardTemplateMVPModel(
    accountName: 'Park Coffee',
    accountNumber: '089 993 338 | MVP',
    imageAcount: 'assets/images/svgfile/cashout.svg',
    id: 4,
  ),
  CardTemplateMVPModel(
    accountName: 'Lucy King',
    accountNumber: '123 456 663 | MVP',
    imageAcount: 'assets/images/svgfile/cashout.svg',
    id: 5,
  ),
  CardTemplateMVPModel(
    accountName: 'Emily Taylor',
    accountNumber: '123 456 663 | MVP',
    imageAcount: 'assets/images/svgfile/cashout.svg',
    id: 6,
  ),
  CardTemplateMVPModel(
    accountName: 'Champei Spa',
    accountNumber: '089 993 338 | MVP',
    imageAcount: 'assets/images/svgfile/cashout.svg',
    id: 7,
  ),
];

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
