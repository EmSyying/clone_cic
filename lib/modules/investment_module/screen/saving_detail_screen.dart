import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/investment_module/model/fif_application/schedule/schedule.dart';
import 'package:cicgreenloan/modules/investment_module/screen/contract_withdraw.dart';
import 'package:cicgreenloan/modules/investment_module/screen/fif_create_bank.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Utils/function/custom_select_bank.dart';
import '../../../Utils/function/custom_show_bottom_sheet.dart';
import '../../../Utils/helper/container_partern.dart';
import '../../../Utils/pop_up_alert/reminder_dailog.dart';
import '../../../utils/form_builder/custom_material_modal_sheet.dart';
import '../../../utils/helper/firebase_analytics.dart';
import '../../../widgets/defualt_size_web.dart';
import '../../../widgets/investments/custom_detail_summery.dart';
import '../../../widgets/investments/interest_transaction_schedule_card_shimmer.dart';
import '../../../widgets/investments/principal_history.dart';
import '../controller/investment_controller.dart';
import 'interest_schedule.dart';

class SavingDetailScreen extends StatefulWidget {
  final num? id;
  final int? index;
  final bool? hide;
  final String? investAmonut;
  final String? code;
  final String? currentPrincipal;
  final EdgeInsets? paddings;
  final String? accountName;
  final String? fromPage;

  // final FiFApplicationDetailModel? fiFApplicationDetailModel;
  final List<ScheduleModelList>? scheduleModelList;

  const SavingDetailScreen({
    Key? key,
    this.accountName,
    this.paddings,
    this.code,
    this.id,
    this.scheduleModelList,
    this.hide = false,
    this.index,
    this.investAmonut,
    this.currentPrincipal,
    this.fromPage,
  }) : super(key: key);

  @override
  State<SavingDetailScreen> createState() => _SavingDetailScreenState();
}

class _SavingDetailScreenState extends State<SavingDetailScreen> {
  final fifCon = Get.put(PriceController());
  List<Widget> widgets = [
    const CustomDetailSummery(),
    const InterestSchedule()
  ];
  bool? isMoreButton = false;
  int segmentedControlValue = 0;
  bool isScrollUp = false;
  final PageController _pageViewController = PageController();
  bool? isautorenew = true;
  @override
  void initState() {
    fifCon.fetchPayment();
    // debugPrint('height = $appbarheight');
    // investmentController.fetchFIFPendingDetail(widget.id);
    fifCon.fetchConfirmDetail(widget.id);
    fifCon.fetchFIFAccountDetail(widget.id).then((amount) {
      fifCon.textRenewAmount.value = amount.investmentAmount!
          .replaceAll(',', '')
          .replaceAll('.00 USD', '');
    });
    // widgets.fiFApplicationDetailModel=fifCon.fiFApplicationDetailModel.value;
    widgets = [
      Obx(
        () => fifCon.isLoadingAccDetail.value
            ? const Center(child: CircularProgressIndicator())
            : CustomDetailSummery(
                investDate: FormatDate.investmentDateDisplay(
                    fifCon.fifAccountDetailModel.value.investmentDate!),
                maturityDate: FormatDate.investmentDateDisplay(
                    fifCon.fifAccountDetailModel.value.maturityDate!),
                annuallyInterestRate:
                    fifCon.fifAccountDetailModel.value.annuallyInterestRate ??
                        '',
                investDuration:
                    fifCon.fifAccountDetailModel.value.duration ?? "",
                investPayment: fifCon.fifAccountDetailModel.value.paid ?? 0,
                firstpaymentDate: FormatDate.investmentDateDisplay(
                    fifCon.fifAccountDetailModel.value.firstPaymentDate!),
                durationPeriod:
                    fifCon.fifAccountDetailModel.value.paidFormat ?? '',
                maturityInstruction:
                    fifCon.fifAccountDetailModel.value.endMaturity,
                accountBank:
                    fifCon.fifAccountDetailModel.value.bankAccount!.account,
              ),
      ),
      Obx(
        () => fifCon.isLoadingDetailAcc.value
            ? Container(
                padding: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.50,
                width: double.infinity,
                child: const InterestTransactionScheduleCardShimmer())
            : InterestSchedule(
                scheduleModelList: fifCon.fifAccountDetailModel.value.schedule,
              ),
      )
    ];
    super.initState();
  }

  double paddingTop = 0.0;
  double appbarheight = kToolbarHeight;
  final investmentController = Get.put(PriceController());
  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(child: CupertinoScaffold(
      body: Builder(
        builder: (context) {
          return CupertinoPageScaffold(
            child: Scaffold(
              backgroundColor: const Color(0xff3678d4),
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext buildcontext, bool innerBoxIsScrolled) {
                  return [
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          buildcontext),
                      sliver: SliverAppBar(
                        backgroundColor: Colors.transparent,
                        expandedHeight: 310,
                        title: Obx(
                          () => Text(
                            fifCon.fifAccountDetailModel.value.accountName ??
                                '...',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        // forceElevated: innerBoxIsScrolled,
                        elevation: 0,
                        pinned: true,
                        actions: [
                          PopupMenuButton(
                            color: Colors.white,
                            offset: const Offset(0, 35),
                            padding: EdgeInsets.zero,
                            elevation: 2,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            icon: const Icon(
                              Icons.more_vert,
                              size: 22,
                              color: Colors.white,
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                              if (fifCon.fifAccountDetailModel.value
                                      .autoRenewal ==
                                  'Yes')
                                PopupMenuItem(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Obx(
                                    () => fifCon.fifAccountDetailModel.value
                                                .autoRenewal ==
                                            'Yes'
                                        ? GestureDetector(
                                            onTap: () {
                                              isautorenew = !isautorenew!;
                                              debugPrint("heiii:$isautorenew");
                                              FirebaseAnalyticsHelper
                                                  .sendAnalyticsEvent(
                                                      'Stop Contract Renewal');
                                              Navigator.pop(context);

                                              showReminderDailog(
                                                  context: context,
                                                  title:
                                                      'Are you sure you want to stop renewal of this contract?',
                                                  content:
                                                      'You won\'t be able to set it to auto-renewal again until you create a new contract.',
                                                  cancelTitle: 'Cancel',
                                                  actionTitle: 'Stop Now',
                                                  actionTitleColor: Colors.red,
                                                  onActioned: () {
                                                    investmentController
                                                        .onAutoRenew(
                                                            widget.id,
                                                            isautorenew == true
                                                                ? 'yes'
                                                                : 'no');
                                                    buildcontext.pop();
                                                  },
                                                  onCanceled: () {
                                                    buildcontext.pop();
                                                  });
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              height: 49,
                                              child: Row(
                                                children: [
                                                  const SizedBox(width: 18.0),
                                                  SvgPicture.asset(
                                                      'assets/images/sync_icon.svg'),
                                                  const SizedBox(width: 15.0),
                                                  Expanded(
                                                    child: Text(
                                                      'Stop Contract Renewal',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColor
                                                                  .darkColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ),
                              if (fifCon.fifAccountDetailModel.value
                                      .autoRenewal ==
                                  'Yes')
                                const PopupMenuDivider(height: 0),
                              PopupMenuItem(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                        'Edit Bank Account');
                                    Navigator.pop(context);
                                    customShowBottomSheet(
                                        context: context,
                                        leading: const Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ),
                                        title: 'Interest Receiving Account',
                                        widget: Obx(
                                          () => Column(
                                            children: fifCon.paymentDataList
                                                .asMap()
                                                .entries
                                                .map((e) {
                                              return CustomSelectBank(
                                                bankName: e.value.bankName,
                                                accountName: e.value.accounName,
                                                accountNo:
                                                    e.value.accountNumber,
                                                image: e.value.image,
                                                selectIndex:
                                                    e.value.id!.toInt(),
                                                selected: fifCon
                                                    .fifAccountDetailModel
                                                    .value
                                                    .bankAccount!
                                                    .id,
                                                onTapSelectBank: () {
                                                  fifCon.selectBankAcc.value =
                                                      e.value.id!.toInt();

                                                  fifCon.onfifCreateBank(
                                                      context,
                                                      fifId: widget.id,
                                                      bankId: e.value.id);
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        bottomBar: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                enableDrag: true,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            borderRaduis)),
                                                context: context,
                                                builder: (context) =>
                                                    FiFCreateBankAcc(
                                                      onTapSave: () {
                                                        debugPrint(
                                                            'id:::::${widget.id}');
                                                        fifCon.onfifCreateBank(
                                                            context,
                                                            fifId: widget.id);
                                                      },
                                                    ));
                                          },
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/svgfile/add.svg'),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Add new account',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    height: 49,
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 18.0),
                                        SvgPicture.asset(
                                          'assets/images/svgfile/edit_profile.svg',
                                          color: Colors.black,
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 15.0),
                                        Expanded(
                                          child: Text(
                                            "Edit Bank Account",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColor.darkColor),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const PopupMenuDivider(height: 0),
                              // Not completed yet for Edit Coupon Receiving Date (don't delete it)

                              // PopupMenuItem(
                              //   padding: const EdgeInsets.only(right: 10),
                              //   child: GestureDetector(
                              //     onTap: () {
                              //       FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              //           'Edit Coupon Receiving Date');
                              //       Navigator.pop(context);
                              //     },
                              //     child: Container(
                              //       height: 49,
                              //       color: Colors.transparent,
                              //       child: Row(
                              //         children: [
                              //           const SizedBox(width: 18.0),
                              //           SvgPicture.asset(
                              //               'assets/images/svgfile/edit_calendar.svg'),
                              //           const SizedBox(width: 15.0),
                              //           Expanded(
                              //             child: Text(
                              //               "Edit Coupon Receiving Date",
                              //               style: Theme.of(context)
                              //                   .textTheme
                              //                   .subtitle2!
                              //                   .copyWith(
                              //                       fontWeight: FontWeight.w400,
                              //                       color: AppColor.darkColor),
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // const PopupMenuDivider(height: 0),
                              if (fifCon.fifAccountDetailModel.value
                                      .allowWithdrawal!
                                      .toLowerCase() ==
                                  "yes")
                                PopupMenuItem(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      FirebaseAnalyticsHelper
                                          .sendAnalyticsEvent(
                                              'Principal Redemption');
                                      Navigator.pop(context);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return ContractWithdrawScreen(
                                            investAmount: fifCon
                                                .fifAccountDetailModel
                                                .value
                                                .investmentAmount,
                                            productName: fifCon
                                                .fifAccountDetailModel
                                                .value
                                                .productName,
                                            id: widget.id,
                                            contractCode: widget.fromPage ==
                                                    'Notification'
                                                ? fifCon.fifAccountDetailModel
                                                    .value.code
                                                : widget.code,
                                            accountName: widget.fromPage ==
                                                    'Notification'
                                                ? fifCon.fifAccountDetailModel
                                                    .value.accountName
                                                : widget.accountName,
                                          );
                                        }),
                                      );
                                    },
                                    child: Container(
                                      height: 49,
                                      color: Colors.transparent,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 18.0),
                                          SvgPicture.asset(
                                              'assets/images/svgfile/withdrawPrincipal.svg'),
                                          const SizedBox(width: 15.0),
                                          Expanded(
                                            child: Text(
                                              "Principal Redemption",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColor.darkColor),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              const PopupMenuDivider(height: 0),
                              PopupMenuItem(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                        'priciapl history');
                                    Navigator.pop(context);
                                    onShowCustomCupertinoModalSheet(
                                        icon: const Icon(Icons.close),
                                        title: 'Principal History',
                                        context: context,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: PeicipalHistory(
                                            id: widget.id,
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    height: 49,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 18.0),
                                        SvgPicture.asset(
                                            'assets/images/clock.svg'),
                                        const SizedBox(width: 15.0),
                                        Expanded(
                                          child: Text(
                                            "Principal History",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColor.darkColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: false,
                          background: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xff3678d4),
                                    Color(0xff3851a1),
                                  ]),
                            ),
                            child: Obx(
                              () => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 100, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          fifCon.fifAccountDetailModel.value
                                                  .code ??
                                              '...',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          fifCon.fifAccountDetailModel.value
                                                  .productName ??
                                              '...',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            fifCon.fifAccountDetailModel.value
                                                    .interestType ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(fontSize: 14),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                fifCon
                                                        .fifAccountDetailModel
                                                        .value
                                                        .totalInterestEarned ??
                                                    '...',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(fontSize: 26),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, left: 5),
                                                child: Text(
                                                  fifCon.fifAccountDetailModel
                                                          .value.currencyCode ??
                                                      '...',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color:
                                                      const Color(0xffd0f0cf),
                                                ),
                                                child: Text(
                                                  fifCon
                                                          .fifAccountDetailModel
                                                          .value
                                                          .monthlyInterestEarned ??
                                                      '...',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(
                                                          color: const Color(
                                                              0xff06A200),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            fifCon.fifAccountDetailModel.value
                                                        .investmentDate !=
                                                    null
                                                ? FormatDate.formatDateDays(
                                                    FormatDate.today()
                                                        .toString())
                                                : '...',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 35),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Investment Amount',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 8),
                                                  width: 15,
                                                  height: 15,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.green),
                                                ),
                                                Text(
                                                  fifCon
                                                          .fifAccountDetailModel
                                                          .value
                                                          .investmentAmountFormat ??
                                                      '...',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 1,
                                          height: 50,
                                          decoration: DottedDecoration(
                                            shape: Shape.line,
                                            linePosition: LinePosition.left,
                                            color: Colors.grey[300]!,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Current Principal',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 8),
                                                  width: 15,
                                                  height: 15,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xff0685cf)),
                                                ),
                                                Text(
                                                  fifCon
                                                          .fifAccountDetailModel
                                                          .value
                                                          .currentPrincipal ??
                                                      "...",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color(0xff3678d4),
                          Color(0xff3851a1),
                        ]
                        // stops: const []
                        // colors: <Color>[Color(0xff0685cf), Color(0xff0f50a4)],
                        ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(14.0),
                      topLeft: Radius.circular(14.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 107),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14.0),
                          topLeft: Radius.circular(14.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[400]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            width: double.infinity,
                            child: CupertinoSlidingSegmentedControl(
                                groupValue: segmentedControlValue,
                                backgroundColor:
                                    const Color(0xff252552).withOpacity(0.1),
                                children: const <int, Widget>{
                                  0: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Detail Summary'),
                                  ),
                                  1: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Coupon Schedule'),
                                  ),
                                },
                                onValueChanged: (int? value) {
                                  segmentedControlValue = value!;
                                  _pageViewController.animateToPage(
                                      segmentedControlValue,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.fastOutSlowIn);
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            child: PageView(
                              controller: _pageViewController,
                              onPageChanged: (value) {
                                if (_pageViewController.page == 0) {
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'detail summery fif');
                                } else {
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'interest schedule');
                                }

                                segmentedControlValue = value;
                                setState(() {});
                              },
                              children: widgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
