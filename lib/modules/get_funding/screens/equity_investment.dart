import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_application_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/container_partern.dart';
import '../../../Utils/helper/injection_helper/injection_helper.dart';
import '../../../widgets/get_funding/custom_shimmer_card_get_funding.dart';

class EquityInvestment extends StatefulWidget {
  const EquityInvestment({Key? key}) : super(key: key);

  @override
  State<EquityInvestment> createState() => _EquityInvestmentState();
}

class _EquityInvestmentState extends State<EquityInvestment> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  bool isEmpty = true;
  int page = 1;
  Future<void> onRefresh() async {
    page = 1;
    InjectionHelper.equityInvestmentController
        .fetchOnEquityApplicationList(page);
  }

  getData() {
    page += 1;
    InjectionHelper.equityInvestmentController
        .fetchOnEquityApplicationList(page);
  }

  @override
  void initState() {
    InjectionHelper.equityInvestmentController
        .fetchOnEquityApplicationList(page);

    super.initState();
  }

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Obx(
            () => InjectionHelper
                    .equityInvestmentController.isDeleteEquity.value
                ? Scaffold(
                    body: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.7),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(height: padding),
                            Text(
                              "Deleting...",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Obx(
                    () => InjectionHelper
                            .equityInvestmentController.isequityLoading.value
                        ? () {
                            return const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: CustomShimmerCardGetFunding());
                          }()
                        : !InjectionHelper.equityInvestmentController
                                    .isequityLoading.value &&
                                InjectionHelper.equityInvestmentController
                                    .equityApplicationList.isEmpty &&
                                InjectionHelper.equityInvestmentController
                                    .equityApplicationDraftList.isEmpty
                            ? showEmptyState()
                            : RefreshIndicator(
                                onRefresh: onRefresh,
                                key: refreshKey,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: NotificationListener<
                                          ScrollEndNotification>(
                                        onNotification: (scrollNotification) {
                                          if (scrollNotification
                                                  .metrics.pixels ==
                                              scrollNotification
                                                  .metrics.maxScrollExtent) {
                                            getData();
                                          }
                                          return false;
                                        },
                                        child: ListView(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 34),
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          controller: scrollController,
                                          children: [
                                            InjectionHelper
                                                    .equityInvestmentController
                                                    .equityApplicationList
                                                    .isNotEmpty
                                                ? ApplicationList(
                                                    listTitle:
                                                        "Recent Applications",
                                                    listTitleColor:
                                                        const Color(0xff464646),
                                                    isEquity: true,
                                                    applicationList: InjectionHelper
                                                        .equityInvestmentController
                                                        .equityApplicationList,
                                                  )
                                                : const SizedBox(),
                                            const SizedBox(height: 20),
                                            InjectionHelper
                                                    .equityInvestmentController
                                                    .equityApplicationDraftList
                                                    .isNotEmpty
                                                ? ApplicationList(
                                                    listTitle:
                                                        "Draft Applications",
                                                    listTitleColor:
                                                        const Color(0xff848F92),
                                                    isEquity: true,
                                                    applicationList: InjectionHelper
                                                        .equityInvestmentController
                                                        .equityApplicationDraftList,
                                                  )
                                                : const SizedBox(),

                                            ///Loading Pagination
                                            InjectionHelper
                                                    .equityInvestmentController
                                                    .isfetchequtydata
                                                    .value
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Loading more ',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText2,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const CupertinoActivityIndicator(),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 10,
                                          top: 10),
                                      child: CustomButton(
                                        onPressed: () {
                                          InjectionHelper
                                              .equityInvestmentController
                                              .resetData();
                                          debugPrint("Go to step 1 by create");
                                          context
                                              .go("/get_funding/equity-step1");
                                        },
                                        isDisable: false,
                                        isOutline: false,
                                        title: 'Create New Application',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                  ),
          ),
        ),
      ),
    );
  }

  buildCustomButton({String? iconUrl, String? title, Function? onPressed}) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(20),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SvgPicture.asset(iconUrl!),
            const SizedBox(
              width: 10,
            ),
            Text(
              title!,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  buildValuePositionPoint(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_sharp,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.subtitle2),
          ),
        ],
      ),
    );
  }

  Widget showEmptyState() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SvgPicture.asset('assets/images/svgfile/noEquityInvestment.svg'),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      'No Equity Investment Yet',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CiC Equity Investment provides growth capital of up to 1,500,000 USD to invest in SMEs and Startups in our prioritized sectors including Finance, Agri-related businesses, Service, and Technology.',
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Value Proposition',
                        style: Theme.of(context).textTheme.headline2),
                    const SizedBox(
                      height: 10,
                    ),
                    buildValuePositionPoint(
                        "Access to capital with long-term investment."),
                    buildValuePositionPoint(
                        'Advice on business growth strategy.'),
                    buildValuePositionPoint(
                        'Support on strategic consulting, market research, financial plan.'),
                    buildValuePositionPoint(
                        'Access to business support program.'),
                    buildValuePositionPoint(
                        'Receive follow-on investment opportunity.')
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: CustomButton(
            iconUrl: 'assets/images/svgfile/equityInvestment.svg',
            isDisable: false,
            isOutline: false,
            onPressed: () {
              InjectionHelper.equityInvestmentController.resetData();

              context.go("/get_funding/equity-step1");
            },
            title: 'Get Equity Invesment',
          ),
        )
      ],
    );
  }
}
