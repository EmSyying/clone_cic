import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/show_alert_dialog.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/chart/custom_circle_chart_1_3.dart';
import '../../../widgets/get_funding/custom_call_center.dart';
import '../../../widgets/investments/custom_card_deduc_selection.dart';
import '../controller/investment_controller.dart';

class FIFDeucSelection extends StatefulWidget {
  final int? id;
  const FIFDeucSelection({Key? key, this.id}) : super(key: key);

  @override
  State<FIFDeucSelection> createState() => _FIFDeucSelectionState();
}

class _FIFDeucSelectionState extends State<FIFDeucSelection> {
  final deducCon = Get.put(PriceController());

  @override
  void initState() {
    if (widget.id != 0 && widget.id != null) {
      deducCon.fetchFIFPendingDetail(widget.id).then((value) {
        debugPrint('pro code = ${deducCon.productCode.value}');
      });
    }

    onRefresh();
    super.initState();
  }

  Future onRefresh() async {
    deducCon.getfifOption();
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
          context: context,
          title: 'Fixed Income Fund',
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            color: Colors.black,
          ),
          action: [
            const CustomCallCenter(
              type: 'FIF',
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CustomCircleChart(
                isFIF: true,
                numberPage: 1,
                // isFIF: true,
              ),
            ),
          ]),
      // transitionBackgroundColor: Colors.white,
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: onRefresh,
                    child: deducCon.fifOptionLoading.value
                        ? const LinearProgressIndicator()
                        : ListView(
                            padding: const EdgeInsets.only(top: 20),
                            children: deducCon.fifProductTypeList
                                .asMap()
                                .entries
                                .map((e) {
                              if (deducCon.productCode.value ==
                                  e.value.productCode) {
                                deducCon.medthodproductCode.value =
                                    e.value.productCode.toString();
                                deducCon.selectedProIndex(e.key);
                              }
                              return CustomCardFIFDeducSelection(
                                  title: e.value.productName,
                                  description: e.value.description,
                                  onExploreMore: () {
                                    // ExploreMoreRouter(
                                    //       title: e.value.productName,
                                    //       url: "${e.value.urlWebview}")
                                  },
                                  onPressed: () {
                                    if (widget.id != null) {
                                      if (deducCon.fiFApplicationDetailPending
                                              .value.productId ==
                                          e.value.id) {
                                        debugPrint("is Equal id");
                                        deducCon.fiFApplicationDetailPending
                                                .value =
                                            deducCon.fiFApplicationDetailPending
                                                .value
                                                .copyWith(
                                                    productId: e.value.id);
                                      } else {
                                        debugPrint("is Not Equal id");
                                        deducCon.fiFApplicationDetailPending
                                                .value =
                                            deducCon.fiFApplicationDetailPending
                                                .value
                                                .copyWith(productId: null);
                                        deducCon.fiFApplicationDetailPending
                                                .value =
                                            deducCon.fiFApplicationDetailPending
                                                .value
                                                .copyWith(productName: null);
                                      }
                                    }
                                    deducCon.fiFApplicationDetailPending.value =
                                        deducCon
                                            .fiFApplicationDetailPending.value
                                            .copyWith(productId: e.value.id);
                                    deducCon.fiFApplicationDetailPending.value =
                                        deducCon
                                            .fiFApplicationDetailPending.value
                                            .copyWith(
                                                productName:
                                                    e.value.productName);
                                    if (e.value.productCode != "MPD-0002") {
                                      deducCon.fiFApplicationDetailPending
                                              .value =
                                          deducCon
                                              .fiFApplicationDetailPending.value
                                              .copyWith(subid: null);
                                      deducCon.fiFApplicationDetailPending
                                              .value =
                                          deducCon
                                              .fiFApplicationDetailPending.value
                                              .copyWith(subproductName: "");
                                    }
                                    debugPrint(
                                        "bulletCon.fiFApplicationDetailPending.value.productName:${deducCon.fiFApplicationDetailPending.value.productName}");
                                    deducCon.onDefaulValidate();

                                    deducCon.selectedProIndex(e.key);
                                    deducCon.annuallyInterestRate.value =
                                        e.value.annuallyInterestRate!;
                                    deducCon.medthodproductCode.value =
                                        e.value.productCode.toString();
                                    deducCon.productCode.value =
                                        e.value.productCode!;
                                    deducCon.productCodeType.value =
                                        e.value.productCode!;
                                    deducCon.productNameType.value =
                                        e.value.productName!;
                                    debugPrint(
                                        "is Deduction Principal:${deducCon.productCode.value}");
                                    deducCon.productId.value = e.value.id!;
                                    debugPrint(
                                        "Invesment Max:${e.value.investmentMaximum!}");
                                    deducCon.maximum.value =
                                        e.value.investmentMaximum!.toDouble();
                                    deducCon.minimum.value =
                                        e.value.investmentMinimum!.toDouble();
                                    deducCon.defaultValue.value =
                                        e.value.investmentDefault!.toInt();
                                    deducCon.validateMessage.value =
                                        e.value.investmentMessage!;
                                    deducCon.durationMin.value =
                                        e.value.durationMinimum!.toInt();
                                    deducCon.durationMax.value =
                                        e.value.durationMaximum!.toInt();
                                    deducCon.durationMessage.value =
                                        e.value.durationMessage!;
                                    deducCon.durationDefaul.value =
                                        e.value.durationDefault!.toInt();
                                    deducCon.update();
                                    debugPrint(
                                        'pro code = ${deducCon.productCode.value}');
                                    debugPrint(
                                        'pro code 2 = ${e.value.productCode}');
                                  },
                                  selected: deducCon.productCodeType.value ==
                                      e.value.productCode);
                            }).toList(),
                          ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            showSaveDraftDialog(
                              context: context,
                              isDisableSaveDraft: true,
                              title:
                                  "Are you sure you want to leave this page?",
                              content:
                                  "Changes made to this page haven’t been saved yet.",
                              isCancel: true,
                              onDiscard: () {
                                Navigator.pop(context);
                                deducCon.clearDeducSelection();
                              },
                            );
                          },
                          isDisable: false,
                          title: "Cancel",
                          isOutline: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: deducCon.productCode.value == ''
                            ? CustomButton(
                                onPressed: () {
                                  onRefresh();
                                },
                                isDisable: true,
                                title: "Next",
                                isOutline: false,
                              )
                            : CustomButton(
                                onPressed: () {
                                  context.push(
                                    '/investment/cic-fixed-fund/invest-more/fif-step',
                                    extra: {
                                      "id": widget.id,
                                      "options": deducCon
                                          .fifProductTypeList[
                                              deducCon.selectedProIndex.value]
                                          .options,
                                    },
                                  );
                                },
                                isDisable: false,
                                title: "Next",
                                isOutline: false,
                              ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
