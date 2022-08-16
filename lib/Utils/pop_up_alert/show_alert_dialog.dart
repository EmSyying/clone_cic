import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/get_funding/controller/debt_investment_controller.dart';
import '../../modules/get_funding/controller/equity_investment_controller.dart';
import '../helper/container_partern.dart';

final equityController = Get.put(EquityInvestmentController());
final debtCon = Get.put(DebtInvestmentController());

showSaveDraftDialog({
  BuildContext? context,
  String? title,
  String? content,
  String? onSaveTitle,
  bool? isCancel,
  bool? isEquity = false,
  int? step,
  int? id,
  bool? isDisableSaveDraft = false,
  VoidCallback? onSave,
  VoidCallback? onDiscard,
  String? selectRemove,
  String? selectCancel,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (context) => AlertDialog(
      // insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      titlePadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRaduis),
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: isDisableSaveDraft!
            ? 270
            : isCancel == true
                ? 330
                : 265,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding),
              child: Text(
                "$title",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppin',
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (content == null) const SizedBox(height: padding),
            if (content != null)
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: padding, right: padding, bottom: padding),
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppin',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (!isDisableSaveDraft) const Spacer(),
            const Divider(
              height: 0,
              thickness: 0,
              color: Colors.grey,
            ),
            if (!isDisableSaveDraft)
              GestureDetector(
                onTap: () async {
                  context.router.pop();
                  if (isEquity == true) {
                    if (id == 0 || id == null) {
                      await equityController.onSubmitEquityInvestment(
                          context: context, type: step.toString());
                    } else {
                      equityController.onEditEquityInvestment(
                          context: context,
                          id: id,
                          pagenumber: step.toString());
                    }
                  } else {
                    if (id == 0 || id == null) {
                      await debtCon.onSubmitDebtInvestment(
                          context: context, step: step);
                    } else {
                      await debtCon.onEditDebtInvestment(
                        frompage: step,
                        id: id,
                        context: context,
                        step: step,
                      );
                    }
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: padding, vertical: padding),
                    child: Center(
                      child: Text(
                        selectCancel ??
                            (isCancel == true
                                ? onSaveTitle ?? 'Save Draft'
                                : 'Save'),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff007AFF),
                          fontFamily: 'Poppin',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            const Divider(
              height: 0,
              thickness: 0,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                if (isEquity == true) {
                  if (step == 1) {
                    equityController.resetData();
                    context.router.pop();
                    context.navigateBack();
                    debugPrint("is Step 1 true");
                  } else if (step == 2) {
                    equityController.resetData();
                    context.router.pop();
                    context.router.pop();
                  } else {
                    equityController.resetData();
                    context.router.pop();
                    context.router.pop();
                    context.router.pop();
                  }
                } else {
                  if (step == 1) {
                    debtCon.onResetData();
                    context.router.pop();
                  } else if (step == 2) {
                    debtCon.onResetData();
                    context.router.pop();
                    context.router.pop();
                  } else if (step == 3) {
                    debtCon.onResetData();
                    context.router.pop();
                    context.router.pop();
                    context.router.pop();
                  } else {
                    debtCon.onResetData();
                    context.router.pop();
                    context.router.pop();
                    context.router.pop();
                    context.router.pop();
                  }
                }
              },
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: padding, vertical: padding),
                  child: Center(
                    child: Text(
                      selectRemove ??
                          (isCancel == true ? 'Leave This Page' : 'Discard'),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff007AFF),
                        fontFamily: 'Poppin',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isCancel == true)
              const Divider(
                height: 0,
                thickness: 0,
                color: Colors.grey,
              ),
            if (isCancel == true)
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: padding, vertical: padding),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff007AFF),
                          fontFamily: 'Poppin',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
