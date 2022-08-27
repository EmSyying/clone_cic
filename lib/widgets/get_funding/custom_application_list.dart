import 'package:auto_route/auto_route.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/appliication_card_model.dart';
import 'package:cicgreenloan/widgets/get_funding/application_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../Utils/helper/container_partern.dart';

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
          if (listTitle != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                listTitle ?? "No Title",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: listTitleColor, fontFamily: 'DMSans-Medium'),
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
                              isEquity!
                                  ? context.go(
                                      "/get-funding/equity-investment/preview-equity/${getFundingModel.id}")
                                  : context.go(
                                      "/get-funding/debt-investment/preview-debt/${getFundingModel.id}");
                            } else {
                              null;
                            }
                          },
                          //Code Edit and Deleted Draft Application list
                          child: ApplicationCard(
                            onTapEdit: () {
                              equityController.resetData();
                              debtController.onResetData();
                              Navigator.pop(context);
                              isEquity!
                                  ? getFundingModel.step == 1
                                      ? context.router.pushNamed(
                                          "step1equity/${getFundingModel.id}/${getFundingModel.step}")
                                      : getFundingModel.step == 2
                                          ? context.router.pushNamed(
                                              "step2equity/${getFundingModel.id}/${getFundingModel.step}")
                                          : getFundingModel.step == 3
                                              ? context.router.pushNamed(
                                                  "step3equity/${getFundingModel.id}/${getFundingModel.step}")
                                              : context.router.pushNamed(
                                                  "preview-equity/${getFundingModel.id}")
                                  : getFundingModel.step == 1
                                      ? context.router.pushNamed(
                                          "step1debt/${getFundingModel.id}/${getFundingModel.step}")
                                      : getFundingModel.step == 2
                                          ? context.router.pushNamed(
                                              "step2debt/${getFundingModel.id}/${getFundingModel.step}")
                                          : getFundingModel.step == 3
                                              ? context.router.pushNamed(
                                                  "step3debt/${getFundingModel.id}/${getFundingModel.step}")
                                              : getFundingModel.step == 4
                                                  ? context.router.pushNamed(
                                                      "step4debt/${getFundingModel.id}/${getFundingModel.step}")
                                                  : context.router.pushNamed(
                                                      "preview-debt/${getFundingModel.id}");
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
