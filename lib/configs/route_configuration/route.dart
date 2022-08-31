import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Utils/helper/switch_splash_screen/switch_splash_screen.dart';
import '../../Utils/web_view/web_view.dart';
import '../../core/walk_through/splash_screen.dart';
import '../../core/walk_through/start_slide.dart';
import '../../modules/bonus/screens/bonus_screen.dart';
import '../../modules/dashboard/buttom_navigation_bar.dart';
import '../../modules/dashboard/dashboard.dart';
import '../../modules/get_funding/screens/debt_investment/preview_debt_form.dart';
import '../../modules/get_funding/screens/debt_investment/step1_debt.dart';
import '../../modules/get_funding/screens/debt_investment/step2_debt.dart';
import '../../modules/get_funding/screens/debt_investment/step3_debt.dart';
import '../../modules/get_funding/screens/debt_investment/step4_debt.dart';
import '../../modules/get_funding/screens/equity_investment/preview_equity.dart';
import '../../modules/get_funding/screens/equity_investment/step1_equity.dart';
import '../../modules/get_funding/screens/equity_investment/step2_equity.dart';
import '../../modules/get_funding/screens/equity_investment/step3_equity.dart';
import '../../modules/get_funding/screens/get_funding.dart';
import '../../modules/investment_module/controller/investment_controller.dart';
import '../../modules/investment_module/model/fif_contract_option/fif_contract_option.dart';
import '../../modules/investment_module/model/view_agreement/view_agreement.dart';
import '../../modules/investment_module/screen/bullet_payment_detail.dart';
import '../../modules/investment_module/screen/certificate.dart';
import '../../modules/investment_module/screen/deposit_screen.dart';
import '../../modules/investment_module/screen/fif_deduc_selection.dart';
import '../../modules/investment_module/screen/renewal_screen.dart';
import '../../modules/investment_module/screen/saving_detail_screen.dart';
import '../../modules/member_directory/screens/directory.dart';
import '../../modules/notification_modules/screens/notification.dart';
import '../../modules/privilege_program/screen/privilege/privilege_filters.dart';
import '../../modules/privilege_program/screen/privilege/privilege_screen.dart';
import '../../modules/privilege_program/screen/privilege/search_screen.dart';
import '../../modules/report_module/screens/cic_app_manual.dart';
import '../../modules/report_module/screens/report.dart';
import '../../modules/report_module/screens/view_report.dart';
import '../../modules/setting_modules/screens/settings_screen.dart';
import '../../modules/setting_modules/screens/sub_setting_screen/contract_terms.dart';
import '../../modules/ut_trading/screens/add_inquiry.dart';
import '../../modules/ut_trading/screens/trading_option.dart';
import '../../modules/ut_trading/screens/trading_platform.dart';
import '../../widgets/investments/fif_option1.dart';
import '../../widgets/investments/view_agreement_list.dart';
import '../../widgets/privilege/privilege/custom_all_store_list.dart';
import '../../widgets/privilege/privilege/custom_card_favorites_list.dart';

final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/splashscreen',
    routes: [
      GoRoute(
        path: '/splas-screen',
        name: 'SplashScreen',
        builder: (context, state) => const Splashscreen(),
      ),
      GoRoute(
        path: '/start-slide',
        name: 'StartSlide',
        builder: (context, state) => const StartupSlide(),
      ),
      GoRoute(
        path: '/',
        name: 'HomePage',
        builder: (context, state) => const PaymentSchedule(),
        routes: [
          GoRoute(
            path: 'investment/:tabName',
            name: 'Investment',
            builder: (context, state) => Dashboard(
              tabName: state.params['tabName'],
            ),
            routes: [
              GoRoute(
                path: 'certificate',
                name: 'PDFView',
                builder: (context, state) => PDFViewer(
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
                      accountName: param['accountName'].toString(),
                      code: param['code'].toString(),
                      currentPrincipal: param['currentPrincipal'].toString(),
                      hide: param['hide'].toString().toLowerCase() == 'true',
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
                          final param = state.extra! as Map<String, Object?>;
                          return RenewalScreen(
                            id: param['id'] as num,
                            annually: param['annually'].toString(),
                            investAmount: param['investAmount'].toString(),
                            interestEarned: param['interestEarned'].toString(),
                            accountName: param['accountName'].toString(),
                            contractCode: param['contractCode'].toString(),
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
                                    investDate: param['investDate'].toString(),
                                    investDuration: num.tryParse(
                                        param['investDuration'].toString()),
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
                                    firstPayDate:
                                        param['firstPayDate'].toString(),
                                    oncallBack: param['oncallBack']
                                        as GestureTapCallback?);
                              })
                        ]),
                  ]),
              GoRoute(
                path: 'deposite-screen/:id',
                name: 'DepositeScreen',
                builder: (context, state) => DepositeScreen(
                  id: int.tryParse(state.params['id']!),
                ),
              ),
              GoRoute(
                path: 'view-agreement',
                name: 'ViewAgreement',
                builder: (context, state) {
                  return ViewWebsite(
                    url: state.queryParams['url'],
                    isfromReport:
                        state.queryParams['isfromReport']!.toLowerCase() ==
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
                    listAgreeMent: state.extra as List<ViewAgreement>,
                  );
                },
              ),
              GoRoute(
                path: 'view-contract-term',
                name: 'ViewContractTerm',
                builder: (context, state) {
                  return ContractTerm(
                    fromPage: state.queryParams['fromPage'],
                  );
                },
              ),
              GoRoute(
                  path: 'edit-application/:id',
                  name: 'EditApplication',
                  builder: (context, state) {
                    return FIFDeucSelection(
                      id: int.tryParse(state.params['id']!),
                    );
                  },
                  routes: [
                    GoRoute(
                        path: 'bullet-payment-detail',
                        name: 'BulletPaymentDetailEdit',
                        builder: (context, state) {
                          final param = state.extra as Map<String, Object?>;

                          return BulletPaymentDetail(
                              isAnnullyRate: param['isAnnullyRate']
                                      .toString()
                                      .toLowerCase() ==
                                  'true',
                              titles: param['titles']! as String,
                              isNoUSD:
                                  param['isNoUSD'].toString().toLowerCase() ==
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
                              investAmount: param['investAmount'] as String,
                              isRenewal:
                                  param['isRenewal'].toString().toLowerCase() ==
                                      'true',
                              renewBy: param['renewBy'].toString(),
                              renewDate: param['renewDate'].toString(),
                              renewPeriod: param['renewPeriod'].toString(),
                              oldDate: param['oldDate'].toString(),
                              newDate: param['newDate'].toString(),
                              oncallBack:
                                  param['oncallBack'] as GestureTapCallback);
                        })
                  ]),
              GoRoute(
                path: 'bullet-payment-detail',
                name: 'BulletPaymentDetail',
                builder: (context, state) {
                  final param = state.extra as Map<String, Object?>;

                  return BulletPaymentDetail(
                      isAnnullyRate:
                          param['isAnnullyRate'].toString().toLowerCase() ==
                              'true',
                      titles: param['titles'].toString(),
                      isNoUSD:
                          param['isNoUSD'].toString().toLowerCase() == 'true',
                      status: param['status'].toString(),
                      id: param['id'] as num,
                      isStatusPending:
                          param['isStatusPending'].toString().toLowerCase() ==
                              'true',
                      annually: param['annually'].toString(),
                      productName: param['productName'].toString(),
                      // fromPage: param['fromPage'].toString(),
                      investAmount: param['investAmount'].toString(),
                      investDate: param['investDate'].toString(),
                      investDuration:
                          num.tryParse(param['investDuration'].toString()),
                      isRenewal:
                          param['isRenewal'].toString().toLowerCase() == 'true',
                      renewBy: param['renewBy'].toString(),
                      renewDate: param['renewDate'].toString(),
                      renewPeriod: param['renewPeriod'].toString(),
                      oldDate: param['oldDate'].toString(),
                      newDate: param['newDate'].toString(),
                      firstPayDate: param['firstPayDate'].toString(),
                      oncallBack: param['oncallBack'] as GestureTapCallback?);
                },
              ),
              GoRoute(
                path: 'service-agreement/:fromPage',
                name: 'ServiceAgreement',
                builder: (context, state) => ContractTerm(
                  fromPage: state.params['fromPage'],
                ),
              ),
              GoRoute(
                path: 'about-fif',
                name: 'AboutFiF',
                builder: (context, state) => ViewWebsite(
                  url: state.queryParams['url'],
                  title: state.queryParams['title'],
                ),
              ),
              GoRoute(
                path: 'fif-deduction/:id',
                name: 'Invest More',
                builder: (context, state) => FIFDeucSelection(
                  id: int.tryParse(state.params['id']!),
                ),
              ),
              GoRoute(
                path: 'invest-more',
                name: 'Invest More No Param',
                builder: (context, state) => const FIFDeucSelection(),
                routes: [
                  GoRoute(
                      path: 'fif-step',
                      name: 'FiF1',
                      builder: (context, state) {
                        final param = state.extra as Map<String, Object?>;
                        return FIFOption1(
                          id: int.tryParse(param['id'].toString()),
                          key: state.pageKey,
                          options: param['options'] as List<FIFoptionModel>,
                          paymentDate: param['paymentDate'] as PaymentDate?,
                        );
                      },
                      routes: [
                        GoRoute(
                            path: 'bullet-payment',
                            name: 'BulletPaymentInvest',
                            builder: (context, state) {
                              final param = state.extra as Map<String, Object?>;

                              return BulletPaymentDetail(
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
                                  id: num.tryParse(param['id'].toString()),
                                  isStatusPending: param['isStatusPending']
                                          .toString()
                                          .toLowerCase() ==
                                      'true',
                                  annually: param['annually'].toString(),
                                  productName: param['productName'].toString(),
                                  fromPage: param['fromPage'].toString(),
                                  investAmount:
                                      param['investAmount'].toString(),
                                  investDate: param['investDate'].toString(),
                                  investDuration: num.tryParse(
                                      param['investDuration'].toString()),
                                  isRenewal: param['isRenewal']
                                          .toString()
                                          .toLowerCase() ==
                                      'true',
                                  renewBy: param['renewBy'].toString(),
                                  renewDate: param['renewDate'].toString(),
                                  renewPeriod: param['renewPeriod'].toString(),
                                  oldDate: param['oldDate'].toString(),
                                  newDate: param['newDate'].toString(),
                                  firstPayDate:
                                      param['firstPayDate'].toString(),
                                  oncallBack: param['oncallBack']
                                      as GestureTapCallback?);
                            })
                      ]),
                ],
              ),
            ],
          ),
          GoRoute(
              path: 'bonus',
              name: 'Bonus',
              builder: (context, state) => BonusScreen(
                    tapName: state.queryParams['tapName'],
                  )),
          GoRoute(
              path: 'get-funding/:tabName',
              name: 'GetFunding',
              builder: (context, state) => HomePage(
                    tabName: state.params['tabName'],
                  ),
              routes: [
                // Equity Investment

                GoRoute(
                  path: 'equity-step1',
                  name: 'EquityStep1',
                  builder: (context, state) => Step1Equiry(
                      id: int.tryParse(state.queryParams['id'].toString()),
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
                        id: int.tryParse(state.queryParams['id'].toString()),
                        step: int.tryParse(
                          state.queryParams['step'].toString(),
                        )),
                    routes: [
                      GoRoute(
                        path: 'debt-step2',
                        name: 'DebtStep2',
                        builder: (context, state) => Step2Debt(
                          id: int.tryParse(state.queryParams['id'].toString()),
                          step: int.tryParse(
                            state.queryParams['step'].toString(),
                          ),
                        ),
                        routes: [
                          GoRoute(
                              path: 'debt-step3',
                              name: 'DebtStep3',
                              builder: (context, state) => Step3Debt(
                                    id: int.tryParse(
                                        state.queryParams['id'].toString()),
                                    step: int.tryParse(
                                      state.queryParams['step'].toString(),
                                    ),
                                  ),
                              routes: [
                                GoRoute(
                                    path: 'debt-step4',
                                    name: 'RequiredDocument',
                                    builder: (context, state) =>
                                        RequiredDocument(
                                          id: int.tryParse(state
                                              .queryParams['id']
                                              .toString()),
                                          step: int.tryParse(
                                            state.queryParams['step']
                                                .toString(),
                                          ),
                                        ),
                                    routes: [
                                      GoRoute(
                                        path: 'preview-debt',
                                        name: 'PreviewDebt',
                                        builder: (context, state) =>
                                            PreviewDebtForm(
                                                id: int.tryParse(state
                                                    .queryParams['id']
                                                    .toString())),
                                      ),
                                    ]),
                              ]),
                        ],
                      ),
                    ]),
              ]),
          GoRoute(
              path: 'ut-trading',
              name: 'UT-Trading',
              builder: (context, state) => UTtrading(
                    tradeId: int.tryParse(
                      state.queryParams['tradeId'].toString(),
                    ),
                  ),
              routes: [
                GoRoute(
                    path: 'trading-inquiry/:operation',
                    name: 'Trading',
                    builder: (context, state) => Trading(
                          operation: state.params['operation'],
                          date: state.queryParams['date'],
                          description: state.queryParams['description'],
                          id: int.tryParse(state.queryParams['id'].toString()),
                          key: state.pageKey,
                          marketId: int.tryParse(
                              state.queryParams['marketId'].toString()),
                          memberId: int.tryParse(
                              state.queryParams['memberId'].toString()),
                          numberOfShare: num.tryParse(
                              state.queryParams['numberOfShare'].toString()),
                          payment: state.queryParams['payment']
                                  .toString()
                                  .toLowerCase() ==
                              'true',
                          price: num.tryParse(
                              state.queryParams['price'].toString()),
                          targetMember: num.tryParse(
                              state.queryParams['targetMember'].toString()),
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
                          id: int.tryParse(state.queryParams['id'].toString()),
                          key: state.pageKey,
                          marketId: int.tryParse(
                              state.queryParams['marketId'].toString()),
                          memberId: int.tryParse(
                              state.queryParams['memberId'].toString()),
                          numberOfShare: num.tryParse(
                              state.queryParams['numberOfShare'].toString()),
                          payment: state.queryParams['payment']
                                  .toString()
                                  .toLowerCase() ==
                              'true',
                          price: num.tryParse(
                              state.queryParams['price'].toString()),
                          targetMember: num.tryParse(
                              state.queryParams['targetMember'].toString()),
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
              builder: (context, state) => const Directory()),
          GoRoute(
              path: 'report/:id',
              name: 'Report',
              builder: (context, state) => Report(
                    currentTabIndex: int.tryParse(state.params['id']!),
                  ),
              routes: [
                GoRoute(
                    path: 'view-report',
                    name: "ViewReport",
                    builder: (context, state) => ViewReport(
                          attachedFile: state.queryParams['attachedFile'],
                          key: state.pageKey,
                          title: state.queryParams['title']!,
                          url: state.queryParams['url'],
                        ))
              ]),
          GoRoute(
            path: 'switch-splash-screen',
            name: 'SwitchSplashScreen',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: SwitchSplashScreen(
                  offset: state.extra! as Offset,
                ),
                key: state.pageKey,
                opaque: false,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child),
          ),
          GoRoute(
            path: 'notification',
            name: 'Notification',
            builder: (context, state) => const NotificationScreen(),
            routes: [
              GoRoute(
                path: 'bullet-payment-detail',
                name: 'BulletPaymentDetailNotification',
                builder: (context, state) => const BulletPaymentDetail(),
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
                  );
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
                        interestEarned: param['interestEarned'].toString(),
                        accountName: param['accountName'].toString(),
                        contractCode: param['contractCode'].toString(),
                      );
                    },
                    routes: [
                      GoRoute(
                          path: 'bullet-payment-detail',
                          name: 'BulletPaymentDetailSNotification',
                          builder: (context, state) {
                            final param = state.extra! as Map<String, Object?>;

                            return BulletPaymentDetail(
                                isAnnullyRate: param['isAnnullyRate']
                                        .toString()
                                        .toLowerCase() ==
                                    'true',
                                titles: param['titles']! as String,
                                isNoUSD:
                                    param['isNoUSD'].toString().toLowerCase() ==
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
                                investAmount: param['investAmount'] as String,
                                isRenewal: param['isRenewal']
                                        .toString()
                                        .toLowerCase() ==
                                    'true',
                                renewBy: param['renewBy'].toString(),
                                renewDate: param['renewDate'].toString(),
                                renewPeriod: param['renewPeriod'].toString(),
                                oldDate: param['oldDate'].toString(),
                                newDate: param['newDate'].toString(),
                                oncallBack:
                                    param['oncallBack'] as GestureTapCallback);
                          })
                    ],
                  ),
                ],
              )
            ],
          ),
          GoRoute(
            path: 'setting',
            name: 'SettingScreen',
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: 'cic-app-manual',
                name: 'CiCAppManul',
                builder: (context, state) => const CiCAppManual(),
                routes: [
                  GoRoute(
                    path: 'view-report',
                    name: "ViewDocs",
                    builder: (context, state) => ViewReport(
                      attachedFile: state.queryParams['attachedFile']!,
                      key: state.pageKey,
                      title: state.queryParams['title']!,
                      url: state.queryParams['url']!,
                    ),
                  )
                ],
              )
            ],
          ),

          // Route privilege================
          // GoRoute(
          //   name: 'Privilege',
          //   path: 'privilege',
          //   builder: (context, state) => const PrivilegeScreen(),
          //   routes: [
          //     GoRoute(
          //       name: 'Search',
          //       path: 'search',
          //       builder: (context, state) => const SearchScreen(),
          //     ),
          //     GoRoute(
          //       path: 'privilege/:tabName',
          //       name: 'Privilege',
          //       builder: (context, state) => PrivilegeScreen(
          //         tabPrivName: state.params['tabName'],
          //       ),
          //       routes: [
          //         GoRoute(
          //           path: 'preview-stores/:id',
          //           name: 'PreviewStores',
          //           builder: (context, state) => PreviewEquity(
          //             id: int.tryParse(state.params['id']!),
          //           ),
          //         ),
          //         GoRoute(
          //           path: 'preview-favorites/:id',
          //           name: 'PreviewFavorites',
          //           builder: (context, state) => PreviewDebtForm(
          //             id: int.tryParse(state.params['id']!),
          //           ),
          //         ),
          //       ],
          //     ),
          //     GoRoute(
          //       name: 'Filter',
          //       path: 'filter',
          //       builder: (context, state) => const PrivilegeFilters(),
          //     ),
          //   ],
          // ),
          GoRoute(
            path: 'privilege',
            name: 'Privilege',
            builder: (context, state) => const PrivilegeScreen(
                // tabPrivName: state.params['tabPrivName'],
                ),
            routes: [
              GoRoute(
                path: 'allstores/:id',
                name: 'CustomAllStoreList',
                builder: (context, state) => CustomAllStoreList(
                  id: int.tryParse(state.params['id']!),
                ),
              ),
              GoRoute(
                path: 'allfavorite/:id',
                name: 'CustomCardFavoriesList',
                builder: (context, state) => CustomCardFavoriesList(
                  id: int.tryParse(state.params['id']!),
                ),
              ),
              GoRoute(
                name: 'Search',
                path: 'search',
                builder: (context, state) => const SearchScreen(),
              ),
              GoRoute(
                name: 'Filter',
                path: 'filter',
                builder: (context, state) => const PrivilegeFilters(),
              ),
            ],
          ),
          //end route privilege=========
        ],
      ),
      GoRoute(
        path: '/splashscreen',
        builder: (_, __) {
          return const Splashscreen();
        },
      ),
    ]);
