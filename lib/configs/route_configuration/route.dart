import 'package:cicgreenloan/modules/event_module/screen/event_detail.dart';
import 'package:cicgreenloan/modules/get_funding/get_funding_export.dart';
import 'package:cicgreenloan/modules/google_map_module/google_map.dart';
import 'package:cicgreenloan/modules/investment_module/investment_export.dart';
import 'package:cicgreenloan/modules/privilege_program/privilege_export.dart';
import 'package:cicgreenloan/modules/report_module/report_export.dart';
import 'package:cicgreenloan/modules/setting_modules/setting_export.dart';
import 'package:cicgreenloan/modules/wallet/screen/wallet_screen.dart';
import 'package:cicgreenloan/modules/wallet/wallet_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../Utils/helper/switch_splash_screen/switch_splash_screen.dart';
import '../../Utils/web_view/web_view.dart';
import '../../core/auth/login.dart';
import '../../core/auth/login_with_password.dart';
import '../../core/auth/set_pin_code.dart';

import '../../core/auth/verify_phone.dart';
import '../../core/auth/verify_pin_code.dart';
import '../../core/auth/verify_set_password.dart';
import '../../core/walk_through/splash_screen.dart';
import '../../core/walk_through/start_slide.dart';
import '../../modules/bonus/screens/bonus_screen.dart';
import '../../modules/bonus/screens/cash_out/cash_out_screen.dart';
import '../../modules/bonus/screens/subscriptions/subscribe_screen.dart';
import '../../modules/dashboard/buttom_navigation_bar.dart';
import '../../modules/dashboard/dashboard.dart';
import '../../modules/dashboard/main_dashboard.dart';

import '../../modules/member_directory/controllers/customer_controller.dart';
import '../../modules/member_directory/screens/directory.dart';
import '../../modules/member_directory/screens/new_profile_ui/new_persional_profile.dart';
import '../../modules/notification_modules/screens/notification.dart';

import '../../modules/qr_code/qr_code.dart';

import '../../modules/ut_trading/screens/add_inquiry.dart';
import '../../modules/ut_trading/screens/trading_option.dart';
import '../../modules/ut_trading/screens/trading_platform.dart';

import '../../widgets/investments/fif_option1.dart';
import '../../widgets/investments/view_agreement_list.dart';
import 'route_singleton.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final settingCon = Get.put(SettingController());
final userCon = Get.put(CustomerController());

final router = GoRouter(
    // debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (settingCon.appSettingNofier.value.userToken == null &&
          !state.location.contains('/contract-term') &&
          !state.location.contains('/privacy-policy') &&
          !state.location.contains('/login') &&
          !state.location.contains('/login-password') &&
          !state.location.contains('/changepassword') &&
          !state.location.contains('switch-splash-screen')) {
        return '/start-slide';
      }
      return null;
    },
    initialLocation: '/',
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => PaymentSchedule(
          key: state.pageKey,
          child: child,
        ),
        routes: <RouteBase>[
          GoRoute(
              path: '/',

              // builder: (context, state) => const MainDashboard(),
              pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: const MainDashboard()),
              routes: [
                CICRoute.instance.transferToMMA(fromWhere: 'HomePage'),
                CICRoute.instance.privilagePayment(fromWhere: 'HomePage'),
                CICRoute.instance.event(fromWhere: 'DashBoard'),
                CICRoute.instance.privilege(fromWhere: 'DashBoard'),
                GoRoute(
                  path: 'bonus',
                  name: 'Bonus',
                  builder: (context, state) => BonusScreen(
                    key: state.pageKey,
                    tapName: state.queryParams['tapName'],
                  ),
                ),

                GoRoute(
                    path: 'get_funding',
                    name: 'GetFunding',
                    builder: (context, state) => HomePage(
                          key: state.pageKey,
                          tabName: state.params['tabName'],
                        ),
                    routes: [
                      GoRoute(
                        path: 'equity-step1',
                        name: 'EquityStep1',
                        builder: (context, state) => Step1Equiry(
                            id: int.tryParse(
                                state.queryParams['id'].toString()),
                            step: int.tryParse(
                              state.queryParams['step'].toString(),
                            )),
                      ),
                      GoRoute(
                        path: 'equity-step2',
                        name: 'EquityStep2',
                        builder: (context, state) => Step2Equity(
                          id: int.tryParse(state.queryParams['id'].toString()),
                          step: int.tryParse(
                            state.queryParams['step'].toString(),
                          ),
                        ),
                      ),
                      GoRoute(
                        path: 'equity-step3',
                        name: 'EquityStep3',
                        builder: (context, state) => Step3Equity(
                          key: state.pageKey,
                          id: int.tryParse(state.queryParams['id'].toString()),
                          step: int.tryParse(
                            state.queryParams['step'].toString(),
                          ),
                        ),
                      ),
                      GoRoute(
                        path: 'preview-equity',
                        name: 'PreviewEquity',
                        builder: (context, state) => PreviewEquity(
                          key: state.pageKey,
                          id: int.tryParse(
                            state.queryParams['id'].toString(),
                          ),
                        ),
                      ),

                      // Debt Investment
                      GoRoute(
                        path: 'debt-step1',
                        name: 'DebtStep1',
                        builder: (context, state) => Step1Debt(
                            key: state.pageKey,
                            id: int.tryParse(
                                state.queryParams['id'].toString()),
                            step: int.tryParse(
                              state.queryParams['step'].toString(),
                            )),
                      ),
                      GoRoute(
                        path: 'debt-step2',
                        name: 'DebtStep2',
                        builder: (context, state) => Step2Debt(
                          key: state.pageKey,
                          id: int.tryParse(state.queryParams['id'].toString()),
                          step: int.tryParse(
                            state.queryParams['step'].toString(),
                          ),
                        ),
                      ),
                      GoRoute(
                        path: 'debt-step3',
                        name: 'DebtStep3',
                        builder: (context, state) => Step3Debt(
                          key: state.pageKey,
                          id: int.tryParse(state.queryParams['id'].toString()),
                          step: int.tryParse(
                            state.queryParams['step'].toString(),
                          ),
                        ),
                      ),
                      GoRoute(
                        path: 'debt-step4',
                        name: 'RequiredDocument',
                        builder: (context, state) => RequiredDocument(
                          key: state.pageKey,
                          id: int.tryParse(state.queryParams['id'].toString()),
                          step: int.tryParse(
                            state.queryParams['step'].toString(),
                          ),
                        ),
                      ),
                      GoRoute(
                        path: 'preview-debt',
                        name: 'PreviewDebt',
                        builder: (context, state) => PreviewDebtForm(
                            key: state.pageKey,
                            id: int.tryParse(
                                state.queryParams['id'].toString())),
                      ),
                    ]),

                /// Investment
                GoRoute(
                  path: 'investment/:tabName',
                  name: 'Investment',
                  builder: (context, state) => Dashboard(
                    key: state.pageKey,
                    tabName: state.params['tabName'],
                  ),
                  routes: [
                    GoRoute(
                      path: 'certificate',
                      name: 'PDFView',
                      builder: (context, state) => PDFViewer(
                        key: state.pageKey,
                        title: state.queryParams['title'],
                        urlAttachment: state.queryParams['urlAttachment'],
                      ),
                    ),
                    GoRoute(
                        path: 'saving-detail',
                        name: 'SavingDetail',
                        builder: (context, state) {
                          final param = state.extra! as Map<String, Object?>;
                          return SavingDetailScreen(
                            key: state.pageKey,
                            accountName: param['accountName'].toString(),
                            code: param['code'].toString(),
                            currentPrincipal:
                                param['currentPrincipal'].toString(),
                            hide: param['hide'].toString().toLowerCase() ==
                                'true',
                            id: param['id'] as num,
                            index: param['index'] as int,
                            investAmonut: param['investAmonut'].toString(),
                            paddings: param['paddings'] as EdgeInsets,
                          );
                        },
                        routes: [
                          GoRoute(
                              path: 'renew-contract',
                              name: 'RenewContract',
                              builder: (context, state) {
                                final param =
                                    state.extra! as Map<String, Object?>;
                                return RenewalScreen(
                                  key: state.pageKey,
                                  id: param['id'] as num,
                                  annually: param['annually'].toString(),
                                  investAmount:
                                      param['investAmount'].toString(),
                                  interestEarned:
                                      param['interestEarned'].toString(),
                                  accountName: param['accountName'].toString(),
                                  contractCode:
                                      param['contractCode'].toString(),
                                );
                              },
                              routes: [
                                GoRoute(
                                    path: 'bullet-payment-detail',
                                    name: 'BulletPaymentDetailS',
                                    builder: (context, state) {
                                      final param =
                                          state.extra as Map<String, Object?>;

                                      return BulletPaymentDetail(
                                          key: state.pageKey,
                                          isAnnullyRate: param['isAnnullyRate']
                                                  .toString()
                                                  .toLowerCase() ==
                                              'true',
                                          titles: param['titles'].toString(),
                                          isNoUSD: param['isNoUSD']
                                                  .toString()
                                                  .toLowerCase() ==
                                              'true',
                                          status: param['status'].toString(),
                                          id: param['id'] as num,
                                          isStatusPending:
                                              param['isStatusPending']
                                                      .toString()
                                                      .toLowerCase() ==
                                                  'true',
                                          annually:
                                              param['annually'].toString(),
                                          productName:
                                              param['productName'].toString(),
                                          fromPage:
                                              param['fromPage'].toString(),
                                          investAmount:
                                              param['investAmount'].toString(),
                                          investDate:
                                              param['investDate'].toString(),
                                          investDuration: num.tryParse(
                                              param['investDuration']
                                                  .toString()),
                                          isRenewal: param['isRenewal']
                                                  .toString()
                                                  .toLowerCase() ==
                                              'true',
                                          renewBy: param['renewBy'].toString(),
                                          renewDate: param['renewDate'].toString(),
                                          renewPeriod: param['renewPeriod'].toString(),
                                          oldDate: param['oldDate'].toString(),
                                          newDate: param['newDate'].toString(),
                                          firstPayDate: param['firstPayDate'].toString(),
                                          oncallBack: param['oncallBack'] as GestureTapCallback?);
                                    })
                              ]),
                        ]),
                    GoRoute(
                      path: 'deposite-screen/:id',
                      name: 'DepositeScreen',
                      builder: (context, state) => DepositeScreen(
                        key: state.pageKey,
                        id: int.tryParse(state.params['id']!),
                      ),
                    ),
                    GoRoute(
                      path: 'view-agreement',
                      name: 'ViewAgreement',
                      builder: (context, state) {
                        return ViewWebsite(
                          url: state.queryParams['url'],
                          isfromReport: state.queryParams['isfromReport']!
                                  .toLowerCase() ==
                              'true',
                          key: state.pageKey,
                          title: state.queryParams['title'],
                        );
                      },
                    ),
                    GoRoute(
                      path: 'view-agreement-list',
                      name: 'ViewAgreementList',
                      builder: (context, state) {
                        return ViewAgreementList(
                          key: state.pageKey,
                          listAgreeMent: state.extra as List<ViewAgreement>,
                        );
                      },
                    ),
                    GoRoute(
                      path: 'view-contract-term',
                      name: 'ViewContractTerm',
                      builder: (context, state) {
                        return ContractTerm(
                          key: state.pageKey,
                          fromPage: state.queryParams['fromPage'],
                        );
                      },
                    ),
                    GoRoute(
                        path: 'edit-application/:id',
                        name: 'EditApplication',
                        builder: (context, state) {
                          return FIFDeucSelection(
                            key: state.pageKey,
                            id: int.tryParse(state.params['id']!),
                          );
                        },
                        routes: [
                          GoRoute(
                              path: 'bullet-payment-detail',
                              name: 'BulletPaymentDetailEdit',
                              builder: (context, state) {
                                final param =
                                    state.extra as Map<String, Object?>;

                                return BulletPaymentDetail(
                                    key: state.pageKey,
                                    isAnnullyRate: param['isAnnullyRate']
                                            .toString()
                                            .toLowerCase() ==
                                        'true',
                                    titles: param['titles']! as String,
                                    isNoUSD: param['isNoUSD']
                                            .toString()
                                            .toLowerCase() ==
                                        'true',
                                    status: param['status']! as String,
                                    id: param['id']! as num,
                                    isStatusPending: param['isStatusPending']
                                            .toString()
                                            .toLowerCase() ==
                                        'true',
                                    annually: param['annually'] as String,
                                    productName: param['productName'] as String,
                                    fromPage: param['fromPage'] as String,
                                    investAmount:
                                        param['investAmount'] as String,
                                    isRenewal: param['isRenewal']
                                            .toString()
                                            .toLowerCase() ==
                                        'true',
                                    renewBy: param['renewBy'].toString(),
                                    renewDate: param['renewDate'].toString(),
                                    renewPeriod:
                                        param['renewPeriod'].toString(),
                                    oldDate: param['oldDate'].toString(),
                                    newDate: param['newDate'].toString(),
                                    oncallBack: param['oncallBack']
                                        as GestureTapCallback);
                              })
                        ]),
                    GoRoute(
                      path: 'bullet-payment-detail',
                      name: 'BulletPaymentDetail',
                      builder: (context, state) {
                        final param = state.extra as Map<String, Object?>;

                        return BulletPaymentDetail(
                            key: state.pageKey,
                            isAnnullyRate: param['isAnnullyRate']
                                    .toString()
                                    .toLowerCase() ==
                                'true',
                            titles: param['titles'].toString(),
                            isNoUSD:
                                param['isNoUSD'].toString().toLowerCase() ==
                                    'true',
                            status: param['status'].toString(),
                            id: param['id'] as num,
                            isStatusPending: param['isStatusPending']
                                    .toString()
                                    .toLowerCase() ==
                                'true',
                            annually: param['annually'].toString(),
                            productName: param['productName'].toString(),
                            // fromPage: param['fromPage'].toString(),
                            investAmount: param['investAmount'] != null
                                ? param['investAmount'] as String
                                : null,
                            investDate: param['investDate'].toString(),
                            investDuration: num.tryParse(
                                param['investDuration'].toString()),
                            isRenewal:
                                param['isRenewal'].toString().toLowerCase() ==
                                    'true',
                            renewBy: param['renewBy'].toString(),
                            renewDate: param['renewDate'].toString(),
                            renewPeriod: param['renewPeriod'].toString(),
                            oldDate: param['oldDate'].toString(),
                            newDate: param['newDate'].toString(),
                            firstPayDate: param['firstPayDate'].toString(),
                            oncallBack:
                                param['oncallBack'] as GestureTapCallback?);
                      },
                    ),
                    GoRoute(
                      path: 'service-agreement/:fromPage',
                      name: 'ServiceAgreement',
                      builder: (context, state) => ContractTerm(
                        key: state.pageKey,
                        fromPage: state.params['fromPage'],
                      ),
                    ),
                    GoRoute(
                      path: 'about-fif',
                      name: 'AboutFiF',
                      builder: (context, state) => ViewWebsite(
                        key: state.pageKey,
                        url: state.queryParams['url'],
                        title: state.queryParams['title'],
                      ),
                    ),
                    GoRoute(
                      path: 'fif-deduction/:id',
                      name: 'Invest More',
                      builder: (context, state) => FIFDeucSelection(
                        key: state.pageKey,
                        id: int.tryParse(state.params['id']!),
                      ),
                    ),
                    GoRoute(
                      path: 'invest-more',
                      name: 'Invest More No Param',
                      builder: (context, state) =>
                          FIFDeucSelection(key: state.pageKey),
                      routes: [
                        GoRoute(
                            path: 'fif-step',
                            name: 'FiF1',
                            builder: (context, state) {
                              final param = state.extra as Map<String, Object?>;
                              return FIFOption1(
                                id: int.tryParse(param['id'].toString()),
                                key: state.pageKey,
                                options:
                                    param['options'] as List<FIFoptionModel>,
                                paymentDate:
                                    param['paymentDate'] as PaymentDate?,
                              );
                            },
                            routes: [
                              GoRoute(
                                  path: 'bullet-payment',
                                  name: 'BulletPaymentInvest',
                                  builder: (context, state) {
                                    final param =
                                        state.extra as Map<String, Object?>;

                                    return BulletPaymentDetail(
                                        key: state.pageKey,
                                        isAnnullyRate: param['isAnnullyRate']
                                                .toString()
                                                .toLowerCase() ==
                                            'true',
                                        titles: param['titles'].toString(),
                                        isNoUSD: param['isNoUSD']
                                                .toString()
                                                .toLowerCase() ==
                                            'true',
                                        status: param['status'].toString(),
                                        id: num.tryParse(
                                            param['id'].toString()),
                                        isStatusPending: param['isStatusPending']
                                                .toString()
                                                .toLowerCase() ==
                                            'true',
                                        annually: param['annually'].toString(),
                                        productName:
                                            param['productName'].toString(),
                                        fromPage: param['fromPage'].toString(),
                                        investAmount:
                                            param['investAmount'].toString(),
                                        investDate:
                                            param['investDate'].toString(),
                                        investDuration: num.tryParse(
                                            param['investDuration'].toString()),
                                        isRenewal: param['isRenewal']
                                                .toString()
                                                .toLowerCase() ==
                                            'true',
                                        renewBy: param['renewBy'].toString(),
                                        renewDate:
                                            param['renewDate'].toString(),
                                        renewPeriod:
                                            param['renewPeriod'].toString(),
                                        oldDate: param['oldDate'].toString(),
                                        newDate: param['newDate'].toString(),
                                        firstPayDate: param['firstPayDate'].toString(),
                                        oncallBack: param['oncallBack'] as GestureTapCallback?);
                                  })
                            ]),
                      ],
                    ),
                  ],
                ),

                /// Investment

                /// Wallet

                GoRoute(
                  path: 'wallet',
                  builder: (_, state) => WalletScreen(key: state.pageKey),
                  routes: [
                    GoRoute(
                      name: 'DepositCard',
                      path: 'deposit-card',
                      builder: (_, state) => MMADepositCard(
                          key: state.pageKey,
                          fromModule:
                              state.queryParams['fromModule'].toString()),
                      routes: [
                        GoRoute(
                          name: 'DepositToScreen',
                          path: 'deposit-to-screen',
                          builder: (_, state) =>
                              DepositToScreen(key: state.pageKey),
                          routes: [
                            GoRoute(
                              name: 'MMAccountDepositScreen',
                              path: 'mmaccount-deposit-screen',
                              builder: (_, state) =>
                                  MMAcountDepositScreen(key: state.pageKey),
                            ),
                          ],
                        ),
                        GoRoute(
                          name: 'RecieverMmAccount',
                          path: 'reciever-mm-account',
                          builder: (_, state) =>
                              DepositFromScreen(key: state.pageKey),
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'invest-fif',
                      name: 'mmaInvestFIFScreen',
                      builder: (context, state) =>
                          MMAInvestFIFScreen(key: state.pageKey),
                      routes: [
                        GoRoute(
                          path: 'cic-equity-fund',
                          name: 'CiCEquityFund',
                          builder: (context, state) => CiCEquityFund(
                            key: state.pageKey,
                            isEquityTrue: true,
                          ),
                          routes: [
                            GoRoute(
                              path: 'ut-subscription/:tabName',
                              parentNavigatorKey: _rootNavigatorKey,
                              builder:
                                  (BuildContext context, GoRouterState state) {
                                final String tabName = state.params['tabName']!;

                                return SubscribeBonusScreen(
                                    tabName: tabName, key: state.pageKey);
                              },
                            ),
                          ],
                        ),
                        GoRoute(
                          path: 'cic-fixed-income',
                          name: 'CiCFixedIncome',
                          builder: (context, state) => CiCFixedIncome(
                            key: state.pageKey,
                            ismmaInvestFIF: true,
                          ),
                        ),
                      ],
                    ),
                    // Transfer to other MM Account
                    CICRoute.instance.transferToMMA(fromWhere: 'Wallet'),

                    //MMA Cash out
                    GoRoute(
                      path: 'mma-transfer',
                      name: 'MMADepositCard',
                      builder: (context, state) => MMADepositCard(
                          fromModule: 'Transfer', key: state.pageKey),
                      routes: [
                        GoRoute(
                          path: 'mma-cash-out/:tabName',
                          builder: (BuildContext context, GoRouterState state) {
                            final String tabName = state.params['tabName']!;

                            return CashOutScreen(
                                tabName: tabName, key: state.pageKey);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                // Report Module
                GoRoute(
                  path: 'report',
                  name: 'ReportScreen',
                  builder: (context, state) => ReportScreen(key: state.pageKey),
                  routes: [
                    GoRoute(
                      path: 'report-filed',
                      name: 'ReportFiledCategory',
                      builder: (context, state) => FileCategoriesReport(
                          tabLabel: state.queryParams['tabLabel'],
                          id: int.tryParse(state.queryParams['id']!),
                          key: state.pageKey),
                    ),
                    GoRoute(
                      path: 'view-report-list',
                      name: "ViewReportList",
                      builder: (context, state) => ViewReport(
                        attachedFile: state.queryParams['attachedFile'],
                        key: state.pageKey,
                        title: state.queryParams['title']!,
                        url: state.queryParams['url'],
                      ),
                    )
                  ],
                ),
                // End Report Module
                GoRoute(
                    path: 'ut_trading',
                    name: 'UT-Trading',
                    builder: (context, state) => UTtrading(
                          key: state.pageKey,
                          tradeId: int.tryParse(
                            state.queryParams['tradeId'].toString(),
                          ),
                        ),
                    routes: [
                      GoRoute(
                        path: 'view-last-trading-info',
                        name: 'ViewLastTradingInfo',
                        builder: (context, state) {
                          return ViewWebsite(
                              url: state.queryParams['url'],
                              title: 'View Last Trading Info',
                              key: state.pageKey);
                        },
                      ),
                      GoRoute(
                          path: 'trading-inquiry/:operation',
                          name: 'Trading',
                          builder: (context, state) => Trading(
                                operation: state.params['operation'],
                                date: state.queryParams['date'],
                                description: state.queryParams['description'],
                                id: int.tryParse(
                                    state.queryParams['id'].toString()),
                                key: state.pageKey,
                                marketId: int.tryParse(
                                    state.queryParams['marketId'].toString()),
                                memberId: int.tryParse(
                                    state.queryParams['memberId'].toString()),
                                numberOfShare: num.tryParse(state
                                    .queryParams['numberOfShare']
                                    .toString()),
                                payment: state.queryParams['payment']
                                        .toString()
                                        .toLowerCase() ==
                                    'true',
                                price: num.tryParse(
                                    state.queryParams['price'].toString()),
                                targetMember: num.tryParse(state
                                    .queryParams['targetMember']
                                    .toString()),
                                time: state.queryParams['time'],
                                tradingWith: state.queryParams['tradingWith'],
                                type: state.queryParams['type'],
                              ),
                          routes: [
                            GoRoute(
                              path: 'inquiry-form',
                              name: 'AddInquiry',
                              builder: (context, state) => AddInquiry(
                                operation: state.params['operation'],
                                date: state.queryParams['date'],
                                description: state.queryParams['description'],
                                id: int.tryParse(
                                    state.queryParams['id'].toString()),
                                key: state.pageKey,
                                marketId: int.tryParse(
                                    state.queryParams['marketId'].toString()),
                                memberId: int.tryParse(
                                    state.queryParams['memberId'].toString()),
                                numberOfShare: num.tryParse(state
                                    .queryParams['numberOfShare']
                                    .toString()),
                                payment: state.queryParams['payment']
                                        .toString()
                                        .toLowerCase() ==
                                    'true',
                                price: num.tryParse(
                                    state.queryParams['price'].toString()),
                                targetMember: num.tryParse(state
                                    .queryParams['targetMember']
                                    .toString()),
                                time: state.queryParams['time'],
                                tradingWith: state.queryParams['tradingWith'],
                                type: state.queryParams['type'],
                              ),
                            )
                          ]),
                    ]),
                GoRoute(
                    path: 'directory',
                    name: 'Directory',
                    builder: (context, state) => Directory(
                          key: state.pageKey,
                        ),
                    routes: [
                      GoRoute(
                          path: ':id',
                          builder: (context, state) => NewPeronalProfile(
                                id: int.tryParse(
                                  state.params['id'].toString(),
                                ),
                                isDirectory: state.queryParams['isDirectory']
                                        .toString()
                                        .toLowerCase() ==
                                    'true',
                                imgUrl: state.queryParams['imgUrl'],
                              ))
                    ]),
                // Recent Report
                // GoRoute(
                //     path: 'report/:id',
                //     name: 'Report',
                //     builder: (context, state) => Report(
                //           key: state.pageKey,
                //           currentTabIndex: int.tryParse(state.params['id']!),
                //         ),
                //     routes: [
                //       GoRoute(
                //           path: 'view-report',
                //           name: "ViewReport",
                //           builder: (context, state) => ViewReport(
                //                 attachedFile: state.queryParams['attachedFile'],
                //                 key: state.pageKey,
                //                 title: state.queryParams['title']!,
                //                 url: state.queryParams['url'],
                //               ))
                //     ]),
                // End Recent Report
                GoRoute(
                  path: 'switch-splash-screen/:userType',
                  name: 'SwitchSplashScreen',
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CustomTransitionPage(
                      child: SwitchSplashScreen(
                        offset: state.extra! as Offset,
                        userType: state.params['userType'],
                      ),
                      key: state.pageKey,
                      opaque: false,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              child),
                ),
                GoRoute(
                  path: 'notification',
                  name: 'Notification',
                  builder: (context, state) =>
                      NotificationScreen(key: state.pageKey),
                  routes: [
                    // Event Module from notification

                    GoRoute(
                      path: 'event/:id',
                      name: 'EventDetailNotification',
                      builder: (context, state) => EventDetail(
                          eventId: int.tryParse(
                            state.params['id'].toString(),
                          ),
                          key: state.pageKey),
                      routes: [
                        GoRoute(
                          path: 'view-map-notification',
                          name: 'ViewMapNotification',
                          builder: (context, state) => GoogleMapsPage(
                              title: state.queryParams['title'],
                              latitude: double.tryParse(
                                  state.queryParams['latitude'].toString()),
                              longtitude: double.tryParse(
                                  state.queryParams['longtitude'].toString()),
                              key: state.pageKey),
                        ),
                      ],
                    ),
                    // Ennd

                    // debt investment
                    GoRoute(
                      path: 'preview-debt',
                      name: 'PreviewDebtNotification',
                      builder: (context, state) => PreviewDebtForm(
                          key: state.pageKey,
                          id: int.tryParse(state.queryParams['id'].toString())),
                    ),
                    // ennd

                    // equity investment
                    GoRoute(
                      path: 'preview-equity',
                      name: 'PreviewEquityNotification',
                      builder: (context, state) => PreviewEquity(
                        key: state.pageKey,
                        id: int.tryParse(
                          state.queryParams['id'].toString(),
                        ),
                      ),
                    ),
                    // End
                    GoRoute(
                      path: 'deposite-screen/:id',
                      name: 'DepositeScreenNotification',
                      builder: (context, state) => DepositeScreen(
                        key: state.pageKey,
                        id: int.tryParse(state.params['id']!),
                      ),
                    ),
                    GoRoute(
                      path: 'bullet-payment-detail',
                      name: 'BulletPaymentDetailNotification',
                      builder: (context, state) =>
                          BulletPaymentDetail(key: state.pageKey),
                    ),
                    GoRoute(
                      path: 'saving-detail',
                      name: 'SavingDetailNotification',
                      builder: (context, state) {
                        final param = state.extra! as Map<String, Object?>;
                        return SavingDetailScreen(
                            id: param['id'] as num,
                            paddings: param['paddings'] as EdgeInsets,
                            fromPage: param['fromPage'].toString(),
                            key: state.pageKey);
                      },
                      routes: [
                        GoRoute(
                          path: 'renew-contract',
                          name: 'RenewContractNotification',
                          builder: (context, state) {
                            final param = state.extra! as Map<String, Object?>;
                            return RenewalScreen(
                                id: param['id'] as num,
                                annually: param['annually'].toString(),
                                investAmount: param['investAmount'].toString(),
                                interestEarned:
                                    param['interestEarned'].toString(),
                                accountName: param['accountName'].toString(),
                                contractCode: param['contractCode'].toString(),
                                key: state.pageKey);
                          },
                          routes: [
                            GoRoute(
                                path: 'bullet-payment-detail',
                                name: 'BulletPaymentDetailSNotification',
                                builder: (context, state) {
                                  final param =
                                      state.extra! as Map<String, Object?>;

                                  return BulletPaymentDetail(
                                      isAnnullyRate: param['isAnnullyRate']
                                              .toString()
                                              .toLowerCase() ==
                                          'true',
                                      titles: param['titles']! as String,
                                      isNoUSD: param['isNoUSD']
                                              .toString()
                                              .toLowerCase() ==
                                          'true',
                                      status: param['status']! as String,
                                      id: param['id']! as num,
                                      isStatusPending: param['isStatusPending']
                                              .toString()
                                              .toLowerCase() ==
                                          'true',
                                      annually: param['annually'] as String,
                                      productName:
                                          param['productName'] as String,
                                      fromPage: param['fromPage'] as String,
                                      investAmount:
                                          param['investAmount'] as String,
                                      isRenewal: param['isRenewal']
                                              .toString()
                                              .toLowerCase() ==
                                          'true',
                                      renewBy: param['renewBy'].toString(),
                                      renewDate: param['renewDate'].toString(),
                                      renewPeriod:
                                          param['renewPeriod'].toString(),
                                      oldDate: param['oldDate'].toString(),
                                      newDate: param['newDate'].toString(),
                                      oncallBack: param['oncallBack']
                                          as GestureTapCallback,
                                      key: state.pageKey);
                                })
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ]),
          GoRoute(
            path: '/qr-screen',
            name: 'QrScreen',
            pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: QrCodeScreen(pageName: state.queryParams['pageName'])),
          ),
          CICRoute.instance.event(fromWhere: 'Home', isRoot: true),
          /*  GoRoute(
              path: '/event',
              pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: const EventScreen()),
              routes: [
                GoRoute(
                  path: ':id',
                  name: 'EventDetail',
                  builde  : (context, state) => EventDetail(
                      eventId: int.tryParse(
                        state.params['id'].toString(),
                      ),
                      key: state.pageKey),
                  routes: [
                    GoRoute(
                      path: 'view-map',
                      name: 'ViewMap',
                      builder: (context, state) => GoogleMapsPage(
                          title: state.queryParams['title'],
                          latitude: double.tryParse(
                              state.queryParams['latitude'].toString()),
                          longtitude: double.tryParse(
                              state.queryParams['longtitude'].toString()),
                          key: state.pageKey),
                    ),
                  ],
                ),
              ]),*/

          GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: NewPeronalProfile(
                        id: userCon.customer.value.customerId),
                  ),
              routes: [
                GoRoute(
                    path: 'setting',
                    builder: (context, state) => const SettingsScreen(),
                    routes: [
                      GoRoute(
                          path: 'cic-app-manual',
                          builder: (context, state) => const CiCAppManual(),
                          routes: [
                            GoRoute(
                              path: 'view-report',
                              name: "ViewDocs",
                              builder: (context, state) => ViewReport(
                                attachedFile:
                                    state.queryParams['attachedFile']!,
                                key: state.pageKey,
                                title: state.queryParams['title']!,
                                url: state.queryParams['url']!,
                              ),
                            ),
                          ]),
                      //===privilege feature
                      GoRoute(
                        path: 'privilege/:tabName',
                        name: 'PrivilegeScreen',
                        builder: (context, state) => PrivilegeScreen(
                          tabName: state.params['tabName'],
                          key: state.pageKey,
                        ),
                        routes: [
                          GoRoute(
                            path: 'privilege-detail/:id',
                            name: 'PrivilegeDetailScreen',
                            builder: (context, state) => PrivilegeDetailScreen(
                              id: int.tryParse(state.params['id']!),
                              key: state.pageKey,
                            ),
                          ),
                          GoRoute(
                            path: 'search-item',
                            name: 'SearchScreen',
                            builder: (context, state) => SearchScreen(
                              key: state.pageKey,
                            ),
                          ),
                          GoRoute(
                            name: 'PrivilegeFilters',
                            path: 'filter-item',
                            builder: (context, state) => PrivilegeFilters(
                              key: state.pageKey,
                            ),
                          ),
                          CICRoute.instance
                              .privilagePayment(fromWhere: 'Privilage'),
                          GoRoute(
                            name: 'PaymentDoneScreen',
                            path: 'payment-done-screen',
                            builder: (context, state) => PaymentDoneScreen(
                              key: state.pageKey,
                            ),
                          ),
                          GoRoute(
                            name: 'PrivilegeSeeAllScreen',
                            path: 'privilege-see-all',
                            builder: (context, state) => PrivilegeSeeAllScreen(
                              key: state.pageKey,
                            ),
                          ),
                          GoRoute(
                            name: 'ItemCategoryPrivilegeScreen',
                            path: 'privilege-item-category',
                            builder: (context, state) =>
                                ItemCategoryPrivilegeScreen(
                              tabTitle: state.queryParams['tabTitle'],
                              id: int.tryParse(state.queryParams['id']!),
                              key: state.pageKey,
                            ),
                          ),
                          GoRoute(
                            name: 'RedeemPointToPay',
                            path: 'redeem-point-to-pay',
                            builder: (context, state) => RedeemPointToPay(
                              key: state.pageKey,
                            ),
                          ),
                          GoRoute(
                            name: 'RedeemPointPayReviewScreen',
                            path: 'redeem-point-pay-review',
                            builder: (context, state) =>
                                RedeemPointPayReviewScreen(
                              key: state.pageKey,
                            ),
                          ),
                        ],
                      ),
                      //end privilege
                    ]),
              ]),
        ],
      ),
      // UT Subscription from equity fund
      GoRoute(
        path: '/ut-subscription/:tabName',
        name: 'Utsubscription',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          final String tabName = state.params['tabName']!;
          final String fromPage = state.queryParams['fromPage']!;

          return SubscribeBonusScreen(
              tabName: tabName, fromPage: fromPage, key: state.pageKey);
        },
      ),
      // Explore More
      GoRoute(
        path: '/explore-more',
        name: 'Explore More',
        builder: (context, state) => ViewWebsite(
          isfromReport:
              state.queryParams['isfromReport']!.toLowerCase() == 'false',
          title: state.queryParams['title'],
          url: state.queryParams['url'],
        ),
      ),
      GoRoute(
        path: '/splashscreen',
        name: 'SplashScreen',
        builder: (context, state) => const Splashscreen(),
      ),
      GoRoute(
        path: '/start-slide',
        name: 'StartSlide',
        builder: (context, state) => const StartupSlide(),
      ),
      GoRoute(
          path: '/login',
          builder: (context, state) {
            return const LoginScreen();
          },
          routes: [
            GoRoute(
                path: 'login-password',
                builder: (context, state) {
                  return const LoginWithPassWord();
                },
                routes: [
                  GoRoute(
                      path: 'verify-otp',
                      name: 'VerifyOtp',
                      builder: (context, state) => VerifySetPassword(
                            isForgetPassword: state
                                    .queryParams['isForgetPassword']!
                                    .toLowerCase() ==
                                'true',
                            phone: state.queryParams['phone'],
                          ),
                      routes: [
                        GoRoute(
                          path: 'changepassword',
                          builder: (_, state) => ChangePassword(
                            isForgetPassword: state
                                    .queryParams['isForgetPassword']!
                                    .toLowerCase() ==
                                'true',
                            phone: state.queryParams['phone'],
                          ),
                        ),
                      ]),
                  GoRoute(
                    path: 'setpincode',
                    builder: (context, state) {
                      return SetPinCode(
                        status: state.queryParams['status'],
                      );
                    },
                  ),
                ]),
            GoRoute(
                path: 'verify-phone',
                name: 'VerifyPhoneNewUser',
                builder: (context, state) => VerifyPhone(
                      phoneNumber: state.queryParams['phone'],
                    ),
                routes: [
                  GoRoute(
                      path: 'changepassword',
                      builder: (_, state) => ChangePassword(
                            phone: state.queryParams['phone'],
                            isForgetPassword: state
                                    .queryParams['isForgetPassword']!
                                    .toLowerCase() ==
                                'true',
                          ),
                      routes: [
                        GoRoute(
                          path: 'setpincode',
                          builder: (context, state) {
                            return SetPinCode(
                              status: state.queryParams['status'],
                            );
                          },
                        ),
                      ]),
                ]),
          ]),

      GoRoute(
          path: '/contract-term',
          builder: (context, state) => const ContractTerm()),
      GoRoute(
          path: '/privacy-policy',
          builder: (context, state) => PrivacyPolcy(
                fromPage: state.queryParams['fromPage'],
              )),
      GoRoute(
        path: '/setpincode',
        name: 'SetPinCode',
        builder: (context, state) {
          return SetPinCode(
            status: state.queryParams['status'],
          );
        },
      ),
      GoRoute(
        path: '/verify-pin-code',
        name: 'VerifyPinCode',
        builder: (_, state) => VerifyPINCode(
          status: state.queryParams['status'],
        ),
      ),
      GoRoute(
        path: '/verify-phone',
        name: 'VerifyPhone',
        builder: (_, state) => VerifyPhone(
          phoneNumber: state.queryParams['phoneNumber'],
        ),
      ),
    ],
    refreshListenable: settingCon.appSettingNofier);
