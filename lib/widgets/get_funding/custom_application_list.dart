import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/appliication_card_model.dart';
import 'package:cicgreenloan/widgets/get_funding/application_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/helper/container_partern.dart';
import '../../modules/get_funding/screens/debt_investment/preview_debt_form.dart';
import '../../modules/get_funding/screens/debt_investment/step1_debt.dart';
import '../../modules/get_funding/screens/debt_investment/step2_debt.dart';
import '../../modules/get_funding/screens/debt_investment/step3_debt.dart';
import '../../modules/get_funding/screens/debt_investment/step4_debt.dart';
import '../../modules/get_funding/screens/equity_investment/preview_equity.dart';
import '../../modules/get_funding/screens/equity_investment/step1_equity.dart';
import '../../modules/get_funding/screens/equity_investment/step2_equity.dart';
import '../../modules/get_funding/screens/equity_investment/step3_equity.dart';

class ApplicationList extends StatelessWidget {
  final String? listTitle;
  final Color? listTitleColor;
  final equityController = Get.put(EquityInvestmentController());
  final debtController = Get.put(DebtInvestmentController());
  final List<ApplicationData>? applicationList;
  final bool? isEquity;
  final bool? isGrid;

  ApplicationList({
    Key? key,
    this.applicationList,
    this.isGrid,
    this.isEquity = false,
    this.listTitle,
    this.listTitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              listTitle ?? "No Title",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: listTitleColor, fontFamily: 'DMSans-Medium'),
            ),
          ),
          isGrid != true
              ? Column(
                  children: [
                    ListView.builder(
                      padding:
                          const EdgeInsets.only(right: padding, left: padding),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: applicationList!.length,
                      itemBuilder: (context, index) {
                        ApplicationData getFundingModel =
                            applicationList![index];
                        return GestureDetector(
                          onTap: () {
                            equityController.resetData();
                            debtController.onResetData();
                            if (getFundingModel.status != "Draft") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => isEquity!
                                      ? getFundingModel.step == 1
                                          ? Step1Equiry(
                                              id: getFundingModel.id,
                                              step: getFundingModel.step,
                                            )
                                          : getFundingModel.step == 2
                                              ? Step2Equity(
                                                  id: getFundingModel.id,
                                                  step: getFundingModel.step,
                                                )
                                              : getFundingModel.step == 3
                                                  ? Step3Equity(
                                                      id: getFundingModel.id,
                                                      step:
                                                          getFundingModel.step,
                                                    )
                                                  : PreviewEquity(
                                                      applicationDetail:
                                                          getFundingModel,
                                                      fromPage: 'submitted')
                                      : getFundingModel.step == 1
                                          ? Step1Debt(
                                              applicationDetail:
                                                  getFundingModel,
                                              isDraft: "true",
                                            )
                                          : getFundingModel.step == 2
                                              ? Step2Debt(
                                                  applicationDetail:
                                                      getFundingModel,
                                                  isDraft: "true",
                                                )
                                              : getFundingModel.step == 3
                                                  ? Step3Debt(
                                                      applicationDetail:
                                                          getFundingModel,
                                                      isDraft: "true",
                                                    )
                                                  : getFundingModel.step == 4
                                                      ? RequiredDocument(
                                                          applicationDetail:
                                                              getFundingModel,
                                                          isDraft: "true",
                                                        )
                                                      : PreviewDebtForm(
                                                          applicationDetail:
                                                              getFundingModel,
                                                          fromPage: 'submitted',
                                                          isDraft: "true",
                                                        ),
                                ),
                              );
                            } else {
                              null;
                            }
                          },
                          //Code Edit and Deleted Draft Application list====
                          child: ApplicationCard(
                            onTapEdit: () {
                              equityController.resetData();
                              debtController.onResetData();
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => isEquity!
                                      ? getFundingModel.step == 1
                                          ? Step1Equiry(
                                              id: getFundingModel.id,
                                              step: getFundingModel.step,
                                            )
                                          : getFundingModel.step == 2
                                              ? Step2Equity(
                                                  id: getFundingModel.id,
                                                  step: getFundingModel.step,
                                                )
                                              : getFundingModel.step == 3
                                                  ? Step3Equity(
                                                      id: getFundingModel.id,
                                                      step:
                                                          getFundingModel.step,
                                                    )
                                                  : PreviewEquity(
                                                      applicationDetail:
                                                          getFundingModel,
                                                      fromPage: 'submitted')
                                      : getFundingModel.step == 1
                                          ? Step1Debt(
                                              applicationDetail:
                                                  getFundingModel,
                                              isDraft: "true",
                                            )
                                          : getFundingModel.step == 2
                                              ? Step2Debt(
                                                  applicationDetail:
                                                      getFundingModel,
                                                  isDraft: "true",
                                                )
                                              : getFundingModel.step == 3
                                                  ? Step3Debt(
                                                      applicationDetail:
                                                          getFundingModel,
                                                      isDraft: "true",
                                                    )
                                                  : getFundingModel.step == 4
                                                      ? RequiredDocument(
                                                          applicationDetail:
                                                              getFundingModel,
                                                          isDraft: "true",
                                                        )
                                                      : PreviewDebtForm(
                                                          applicationDetail:
                                                              getFundingModel,
                                                          fromPage: 'submitted',
                                                          isDraft: "true",
                                                        ),
                                ),
                              );
                            },
                            onTapDelete: () {
                              if (isEquity == true) {
                                equityController.onDeleteEquityInvestment(
                                    context, getFundingModel.id);
                                debugPrint("Equity work");
                              } else {
                                debtController.onDeleteDebtInvestment(
                                    context, getFundingModel.id);
                                debugPrint("debt work");
                              }

                              // applicationList!.clear();
                              Navigator.pop(context);
                            },
                            model: getFundingModel,
                            isGrid: "false",
                          ),
                        );
                      },
                    ),
                  ],
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          MediaQuery.of(context).size.width * 0.5,
                      mainAxisExtent: 170,
                      crossAxisSpacing: padding,
                      mainAxisSpacing: padding),
                  itemCount: applicationList!.length,
                  itemBuilder: (context, index) {
                    ApplicationData applicationModel = applicationList![index];
                    return ApplicationCard(
                      model: applicationModel,
                      isGrid: "true",
                    );
                  },
                ),
        ],
      ),
    );
  }
}
