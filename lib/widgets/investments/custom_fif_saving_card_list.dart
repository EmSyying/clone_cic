import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';

import 'package:cicgreenloan/Utils/pin_code_controller/set_pin_code_controller.dart';
import 'package:cicgreenloan/configs/route_configuration/route_argument/bullet_payment_detail_arg.dart';
import 'package:cicgreenloan/widgets/investments/custom_fif_saving_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../Utils/function/convert_fromhex_color.dart';
import '../../Utils/helper/color.dart';
import '../../modules/investment_module/controller/investment_controller.dart';
import '../../modules/investment_module/model/first_date/first_date.dart';

import '../../utils/helper/firebase_analytics.dart';
import '../get_funding/custom_add_other_label.dart';

import '../../Utils/helper/app_pin_code.dart' as apppincode;

class CustomSavingCardList extends StatelessWidget {
  final bool buttonShow;
  final List<FIFApplicationListModel>? fifAccountList;
  final List<FIFApplicationListModel>? fifConfirmList;
  final List<FIFApplicationListModel>? fifPendingList;
  final List<FIFApplicationListModel>? fifhiddenList;
  final fifController = Get.put(PriceController());
  final FIFApplicationListModel? fifApplicationListModel;
  bool onValidate(BuildContext? context) {
    if (fifController.textRenameTitle.value == '') {
      fifController.isRenameTitle.value = false;
    } else {
      fifController.isRenameTitle.value = true;
    }
    return false;
  }

  final pincodeController = Get.put(SetPINCodeController());
  CustomSavingCardList({
    Key? key,
    this.fifApplicationListModel,
    this.buttonShow = false,
    this.fifAccountList,
    this.fifConfirmList,
    this.fifPendingList,
    this.fifhiddenList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder(
              init: fifController,
              initState: (v) {
                fifController.fifAppPendingList;
              },
              builder: (v) {
                return Column(
                    children: fifAccountList!.asMap().entries.map((e) {
                  return FIFSavingCard(
                    // showPopUp: false,
                    // showHidebutton: true,
                    ontapAgreement: () async {
                      FirebaseAnalyticsHelper.sendAnalyticsEvent(
                          'View agreement FIF');
                      fifController.onViewAgreement(e.value.id!.toInt()).then(
                        (value) {
                          value.isNotEmpty && value.length == 1
                              ? context.push(
                                  '/investment/cic-fixed-fund/view-agreement?title=${value[0].title ?? ''}&title=${value[0].url}',
                                )
                              : context.push(
                                  '/investment/cic-fixed-fund/view-agreement-list',
                                  extra: value);
                        },
                      );
                      Navigator.pop(context);
                    },
                    // ontapHistory: () {
                    //   Navigator.pop(context);
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) {
                    //         return SavingDetailScreen(
                    //           id: e.value.id,
                    //           code: e.value.code,
                    //           isCurretPricipal: true,
                    //           // investAmonut: e.value.investmentAmount,
                    //         );
                    //       },
                    //     ),
                    //   );
                    // },
                    onTapCard: () async {
                      FirebaseAnalyticsHelper.sendAnalyticsEvent(
                          'account fif detail');
                      fifController.investmentId.value = e.value.id!.toInt();

                      final savingDetail = BulletPaymentDetailArg(
                        paddings:
                            const EdgeInsets.only(top: 50, left: 10, right: 0),
                        index: e.key,
                        hide: !e.value.hide!,
                        id: e.value.id,
                        code: e.value.code,
                        accountName: e.value.accountName,
                      );
                      context.push('/investment/cic-fixed-fund/saving-detail',
                          extra: {
                            "paddings": const EdgeInsets.only(
                                top: 50, left: 10, right: 0),
                            "index": e.key,
                            "hide": !e.value.hide!,
                            "id": e.value.id,
                            "code": e.value.code,
                            "accountName": e.value.accountName
                          });
                      fifController.onclearWithdraw();
                    },
                    ontapHide: () async {
                      FirebaseAnalyticsHelper.sendAnalyticsEvent(
                          'Hide contract FIF');
                      apppincode.timer.cancel();
                      await apppincode
                          .showLockScreen(enableCancel: true, context: context)
                          .then(
                        (promise) {
                          if (promise) {
                            fifController.onShowHideInvestmentAccount(
                              id: e.value.id,
                              hide: !e.value.hide!,
                            );
                            Navigator.pop(context);
                            if (e.value.hide! == false) {
                              ///make button close when user click hide
                              fifController.totalInvestmentButton(true);
                            }
                          }
                        },
                      );

                      ///
                      // showLockScreen(onSuccess: () {
                      //   investmentController.onShowHideInvestmentAccount(
                      //     id: e.value.id,
                      //     hide: !e.value.hide!,
                      //   );
                      //   Navigator.pop(context);
                      //   Navigator.pop(context);
                      //   if (e.value.hide! == false) {
                      //     ///make button close when user click hide
                      //     investmentController.totalInvestmentButton(true);
                      //   }
                      // });
                    },
                    onTapEdit: () async {
                      FirebaseAnalyticsHelper.sendAnalyticsEvent(
                          'rename title');
                      Navigator.pop(context);
                      await onShowAddOtherLabel(
                        onBack: () {
                          Navigator.pop(context);
                        },
                        isHideButton: false,
                        context: context,
                        title: 'Rename Title',
                        textFieldHere: GetBuilder(
                          initState: (state) {
                            fifController.textRenameTitle.value =
                                e.value.accountName!;
                          },
                          init: fifController,
                          builder: (v) {
                            return Column(
                              children: [
                                CustomTextFieldNew(
                                  hintText: 'Rename Title',
                                  labelText: 'Rename Title',
                                  isValidate: fifController.isRenameTitle.value,
                                  onChange: (renameAcc) {
                                    fifController.textRenameTitle.value =
                                        renameAcc;
                                    fifController.update();
                                  },
                                  onSave: (renameAcc) {
                                    fifController.textRenameTitle.value =
                                        renameAcc!;
                                  },
                                  initialValue: e.value.accountName,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          title: 'Cencel',
                                          isDisable: false,
                                          isOutline: true,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: fifController.textRenameTitle
                                                        .value ==
                                                    e.value.accountName ||
                                                fifController.textRenameTitle
                                                        .value ==
                                                    ''
                                            ? CustomButton(
                                                onPressed: () {},
                                                title: 'Update',
                                                isDisable: true,
                                                isOutline: true,
                                              )
                                            : CustomButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  fifController.onRenameTitle(
                                                      fifAccount: 'fifAccount',
                                                      id: e.value.id);
                                                },
                                                title: 'Update',
                                                isDisable: false,
                                                isOutline: false,
                                              ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    },
                    status: e.value.hide!,
                    sheetColor: fromHex(e.value.color!),
                    amount: e.value.investmentAmount,
                    title: e.value.accountName,
                    id: e.value.code,
                  );
                }).toList());
              }),
          if (fifConfirmList!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.0,
                      top: fifAccountList!.isNotEmpty ? 10 : 5.0,
                      bottom: 5.0),
                  child: Text(
                    "Confirm Application",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: "DMSans-Medium",
                          fontSize: 14,
                        ),
                  ),
                ),
                Column(
                  children: fifConfirmList!.asMap().entries.map((e) {
                    return FIFSavingCard(
                      showPopUp: false,
                      status: e.value.hide!,
                      sheetColor: e.value.color != null
                          ? fromHex(e.value.color!)
                          : null,
                      title: e.value.accountName,
                      id: e.value.code,
                      amount: e.value.investmentAmount,
                      onTapCard: () async {
                        debugPrint(e.value.id.toString());
                        FirebaseAnalyticsHelper.sendAnalyticsEvent(
                            'confirm fif detail');
                        fifController.selected.value = "";
                        // fifController.fetchConfirmDetail(e.value.id);
                        context.push(
                            '/investment/cic-fixed-fund/deposite-screen/${e.value.id!.toInt()}');
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          if (fifPendingList!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.0,
                      top: fifConfirmList!.isEmpty && fifAccountList!.isEmpty
                          ? 5.0
                          : 10.0,
                      bottom: 5.0),
                  child: Text(
                    "Pending Application",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: "DMSans-Medium",
                          fontSize: 14,
                        ),
                  ),
                ),
                Column(
                  children: fifPendingList!
                      .asMap()
                      .entries
                      .map(
                        (e) => FIFSavingCard(
                          istitle: true,
                          showPopUp:
                              e.value.status == 'reviewing' ? false : true,
                          ontapCancel: () async {
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                'cancel fif Application');
                            Navigator.pop(context);
                            fifController.reasonDescription.value = "";
                            await onShowAddOtherLabel(
                                context: context,
                                isNoAppBar: false,
                                isSubmit: true,
                                isHideButton: false,
                                // icon: const Icon(Icons.close_rounded),
                                textFieldHere: Obx(
                                  () => Column(
                                    children: [
                                      CustomTextFieldNew(
                                        maxLine: 7,
                                        hintText: 'Write your reason here...',
                                        labelText: 'Write your reason here...',
                                        initialValue: fifController
                                            .reasonDescription.value,
                                        onChange: (e) {
                                          fifController
                                              .reasonDescription.value = e;
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 30,
                                            top: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                title: 'Cancel',
                                                isDisable: false,
                                                isOutline: true,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: CustomButton(
                                                title: 'Submit',
                                                isDisable: false,
                                                isOutline: false,
                                                onPressed: fifController
                                                            .reasonDescription
                                                            .value ==
                                                        ''
                                                    ? null
                                                    : () {
                                                        FirebaseAnalyticsHelper
                                                            .sendAnalyticsEvent(
                                                                'submit cancel fif');
                                                        Navigator.pop(context);

                                                        fifController
                                                            .onCanceled(
                                                                e.value.id,
                                                                context);
                                                      },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                          onTapEdit: () async {
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                'edit fif application');
                            Navigator.pop(context);
                            context.push(
                                '/investment/cic-fixed-fund/edit-application/${e.value.id}');
                          },
                          pendingStyle: true,
                          sheetColor: Colors.transparent,
                          title: e.value.accountName,
                          id: e.value.code,
                          amount: e.value.investmentAmount,
                          onTapCard: () async {
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                'pending fif detail');

                            context.push(
                                '/investment/cic-fixed-fund/bullet-payment-detail',
                                extra: {
                                  "isAnnullyRate": true,
                                  "titles": "Detail Summary",
                                  "status": e.value.status,
                                  "isStatusPending": true,
                                  "isNoUSD": false,
                                  "id": e.value.id
                                });
                            // await context.router.push(
                            //   PendingDetailRouter(
                            //     isAnnullyRate: true,
                            //     titles: 'Detail Summary',
                            //     status: e.value.status,
                            //     isStatusPending: true,
                            //     isNoUSD: false,
                            //     // investAmount: e.value.investmentAmount,
                            //     id: e.value.id,
                            //   ),
                            // );
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          if (fifhiddenList!.isNotEmpty)
            GestureDetector(
              onTap: () async {
                debugPrint('work');
                if (fifController.totalInvestmentButton.value == false) {
                  await apppincode
                      .showLockScreen(enableCancel: true, context: context)
                      .then(
                    (promise) {
                      if (promise) {
                        fifController.totalInvestmentButton.value = true;
                      }
                    },
                  );
                } else {
                  fifController.totalInvestmentButton.value = false;
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hidden Contracts',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    const Spacer(),
                    Icon(
                      fifController.totalInvestmentButton.value
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                      size: 30,
                      color: AppColor.chartLabelColor,
                    )
                  ],
                ),
              ),
            ),
          if (fifController.totalInvestmentButton.value)
            Column(
              children: fifhiddenList!
                  .asMap()
                  .entries
                  .map(
                    (e) => FIFSavingCard(
                      onTapCard: () async {
                        FirebaseAnalyticsHelper.sendAnalyticsEvent(
                            'account fif detail');
                        fifController.investmentId.value = e.value.id!.toInt();

                        context.push('/investment/cic-fixed-fund/saving-detail',
                            extra: {
                              "paddings": const EdgeInsets.only(
                                  top: 50, left: 10, right: 0),
                              "index": e.key,
                              "hide": !e.value.hide!,
                              "id": e.value.id,
                              "code": e.value.code,
                              "accountName": e.value.accountName
                            });
                        fifController.onclearWithdraw();
                      },
                      ontapHide: () async {
                        await apppincode
                            .showLockScreen(
                                enableCancel: true, context: context)
                            .then(
                          (promise) {
                            if (promise) {
                              fifController.onShowHideInvestmentAccount(
                                id: e.value.id,
                                hide: false, //false = hide application
                              );
                            }
                          },
                        );
                      },
                      showHidebutton: true,
                      showPopUp: false,
                      status: true,
                      title: e.value.accountName,
                      id: e.value.code,
                      amount: e.value.investmentAmount,
                      sheetColor: fromHex(e.value.color!),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
