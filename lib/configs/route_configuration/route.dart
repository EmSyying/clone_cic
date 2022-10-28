import 'package:cicgreenloan/modules/event_module/screen/event.dart';
import 'package:cicgreenloan/modules/event_module/screen/event_detail.dart';
import 'package:cicgreenloan/modules/google_map_module/google_map.dart';
import 'package:cicgreenloan/modules/wallet/screen/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Utils/helper/switch_splash_screen/switch_splash_screen.dart';
import '../../Utils/web_view/web_view.dart';
import '../../core/auth/login.dart';
import '../../core/auth/login_with_password.dart';
import '../../core/auth/set_pin_code.dart';
import '../../core/auth/verify_pin_code.dart';
import '../../core/auth/verify_set_password.dart';
import '../../core/walk_through/splash_screen.dart';
import '../../core/walk_through/start_slide.dart';
import '../../modules/bonus/screens/bonus_screen.dart';
import '../../modules/bonus/screens/cash_out/cash_out_screen.dart';
import '../../modules/bonus/screens/subscriptions/subscribe_screen.dart';
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
import '../../modules/investment_module/screen/cic_equity_fund.dart';
import '../../modules/investment_module/screen/cic_fixed_income.dart';
import '../../modules/investment_module/screen/deposit_screen.dart';
import '../../modules/investment_module/screen/fif_deduc_selection.dart';
import '../../modules/investment_module/screen/renewal_screen.dart';
import '../../modules/investment_module/screen/saving_detail_screen.dart';
import '../../modules/member_directory/screens/directory.dart';
import '../../modules/notification_modules/screens/notification.dart';
import '../../modules/privilege_program/screen/privilege/payment_done_screen.dart';
import '../../modules/privilege_program/screen/privilege/privilege_filters.dart';
import '../../modules/privilege_program/screen/privilege/privilege_payment.dart';
import '../../modules/privilege_program/screen/privilege/privilege_screen.dart';
import '../../modules/privilege_program/screen/privilege/search_screen.dart';
import '../../modules/privilege_program/screen/privilege_detail/privilege_detail_screen.dart';
import '../../modules/qr_code/qr_code.dart';
import '../../modules/report_module/screens/cic_app_manual.dart';
import '../../modules/report_module/screens/report.dart';
import '../../modules/report_module/screens/report_filed.dart';
import '../../modules/report_module/screens/report_screen.dart';
import '../../modules/report_module/screens/view_report.dart';
import '../../modules/setting_modules/screens/settings_screen.dart';
import '../../modules/setting_modules/screens/sub_setting_screen/change_password.dart';
import '../../modules/setting_modules/screens/sub_setting_screen/contract_terms.dart';
import '../../modules/ut_trading/screens/add_inquiry.dart';
import '../../modules/ut_trading/screens/trading_option.dart';
import '../../modules/ut_trading/screens/trading_platform.dart';
import '../../modules/wallet/screen/deposit_from_screen.dart';
import '../../modules/wallet/screen/deposit_mmaccount_screen.dart';
import '../../modules/wallet/screen/deposit_to_screen.dart';
import '../../modules/wallet/screen/mma_deposit_card.dart';
import '../../modules/wallet/screen/mma_invest_fif_screen.dart';
import '../../modules/wallet/screen/transfer_review.dart';
import '../../modules/wallet/screen/transfer_to_screen.dart';
import '../../widgets/investments/fif_option1.dart';
import '../../widgets/investments/view_agreement_list.dart';

abstract class MainRoute {
  GoRoute transferToMMA([String fromWhere]);
  GoRoute privilagePayment([String fromWhere]);
}

class CICRoute extends MainRoute {
  CICRoute._();

  ///instance member of classs
  static final i = CICRoute._();

  @override
  GoRoute transferToMMA([String fromWhere = '']) => GoRoute(
        path: 'transfer-to-other-mmacount',
        name: '${fromWhere}TransferToMMA',
        builder: (_, state) => TransferToMMA(
          receiverAccount: state.queryParams['receiverAccount'],
          receiverAmount: state.queryParams['receiverAmount'],
        ),
        routes: [
          GoRoute(
            path: 'review-transfer',
            name: '${fromWhere}ReviewTransfer',
            //_,__ just because arguments are not used
            builder: (_, __) => const TransferReview(),
          ),
        ],
      );

  @override
  GoRoute privilagePayment([String? fromWhere]) => GoRoute(
        name: '${fromWhere}PrivilegePayment',
        path: 'privilege-payment/:id',
        builder: (_, state) => PrivilegePayment(
          id: int.tryParse(state.params['id'] ?? '0'),
        ),
        routes: [
          GoRoute(
            name: '${fromWhere}PaymentDoneScreen',
            path: 'payment-done-screen',
            builder: (_, __) => const PaymentDoneScreen(),
          ),
        ],
      );
}

final router = GoRouter(
    // debugLogDiagnostics: true,
    initialLocation: '/splashscreen',
    routes: [
      GoRoute(
        path: '/',
        name: 'HomePage',
        builder: (context, state) => const PaymentSchedule(),
        routes: [
          // transferToMMA,

          ///Transfer from Homepage
          CICRoute.i.transferToMMA('HomePage'),
          CICRoute.i.privilagePayment('HomePage'),

          ///Qr Screen
          GoRoute(
            path: 'qr-screen',
            name: 'QrScreen',
            builder: (_, state) {
              Map<String, String> qparam = state.queryParams;
              return QrCodeScreen(
                pageName: qparam['pageName'],
              );
            },
            routes: [
              // GoRoute(
              //   path: 'event',
              //   name: 'QrEvent',
              //   builder: (_, __) => const EventScreen(),
              // ),
            ],
          ),
          GoRoute(
            path: 'investment',
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
                      investAmount: param['investAmount'] != null
                          ? param['investAmount'] as String
                          : null,
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
              path: 'get_funding',
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
                ),
                GoRoute(
                  path: 'debt-step2',
                  name: 'DebtStep2',
                  builder: (context, state) => Step2Debt(
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
                      id: int.tryParse(state.queryParams['id'].toString())),
                ),
              ]),
          GoRoute(
              path: 'ut_trading',
              name: 'UT-Trading',
              builder: (context, state) => UTtrading(
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
                    );
                  },
                ),
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
                  path: 'verify-pin-code',
                  builder: (context, state) => const VerifyPINCode(
                        status: 'Current',
                      ),
                  routes: [
                    GoRoute(
                        path: 'setpincode',
                        builder: (context, state) {
                          return const SetPinCode(
                            status: 'set',
                          );
                        },
                        routes: [
                          GoRoute(
                            path: 'verify-setpincode',
                            builder: (context, state) {
                              return const SetPinCode(
                                status: 'verify',
                              );
                            },
                          ),
                        ]),
                  ]),
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
                  ),
                ],
              ),
              GoRoute(
                path: 'event',
                name: 'Event',
                builder: (context, state) => const EventScreen(),
                routes: [
                  GoRoute(
                    path: 'event-detail/:id',
                    name: 'EventDetail',
                    builder: (context, state) => EventDetail(
                      eventId: int.tryParse(
                        state.params['id'].toString(),
                      ),
                    ),
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Route privilege================
          GoRoute(
            path: 'privilege/:tabName',
            name: 'PrivilegeScreen',
            builder: (context, state) => PrivilegeScreen(
              tabName: state.params['tabName'],
            ),
            routes: [
              GoRoute(
                path: 'privilege-detail/:id',
                name: 'PrivilegeDetailScreen',
                builder: (context, state) => PrivilegeDetailScreen(
                  id: int.tryParse(state.params['id']!),
                ),
              ),
              GoRoute(
                path: 'search-item',
                name: 'SearchScreen',
                builder: (context, state) => const SearchScreen(),
              ),
              GoRoute(
                name: 'PrivilegeFilters',
                path: 'filter-item',
                builder: (context, state) => const PrivilegeFilters(),
              ),
              CICRoute.i.privilagePayment('Privilage'),
              GoRoute(
                name: 'PaymentDoneScreen',
                path: 'payment-done-screen',
                builder: (context, state) => const PaymentDoneScreen(),
              ),
            ],
          ),

          //end route privilege

          ///wallet
          GoRoute(
            path: 'wallet',
            builder: (_, state) => const WalletScreen(),
            routes: [
              GoRoute(
                name: 'DepositCard',
                path: 'deposit-card',
                builder: (_, state) => MMADepositCard(
                    fromModule: state.queryParams['fromModule'].toString()),
                routes: [
                  GoRoute(
                    name: 'DepositToScreen',
                    path: 'deposit-to-screen',
                    builder: (_, state) => const DepositToScreen(),
                    routes: [
                      GoRoute(
                        name: 'MMAccountDepositScreen',
                        path: 'mmaccount-deposit-screen',
                        builder: (_, state) => const MMAcountDepositScreen(),
                      ),
                    ],
                  ),
                  GoRoute(
                    name: 'RecieverMmAccount',
                    path: 'reciever-mm-account',
                    builder: (_, state) => const DepositFromScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'invest-fif',
                name: 'mmaInvestFIFScreen',
                builder: (context, state) => const MMAInvestFIFScreen(),
                routes: [
                  GoRoute(
                    path: 'cic-equity-fund',
                    name: 'CiCEquityFund',
                    builder: (context, state) => const CiCEquityFund(
                      isEquityTrue: true,
                    ),
                    routes: [
                      GoRoute(
                        path: 'ut-subscription/:tabName',
                        builder: (BuildContext context, GoRouterState state) {
                          final String tabName = state.params['tabName']!;

                          return SubscribeBonusScreen(tabName: tabName);
                        },
                      )
                    ],
                  ),
                  GoRoute(
                    path: 'cic-fixed-income',
                    name: 'CiCFixedIncome',
                    builder: (context, state) => const CiCFixedIncome(
                      ismmaInvestFIF: true,
                    ),
                  ),
                ],
              ),
              // Transfer to other MM Account
              CICRoute.i.transferToMMA('Wallet'),

              //MMA Cash out
              GoRoute(
                path: 'mma-transfer',
                name: 'MMADepositCard',
                builder: (context, state) => const MMADepositCard(
                  fromModule: 'Transfer',
                ),
                routes: [
                  GoRoute(
                    path: 'mma-cash-out/:tabName',
                    builder: (BuildContext context, GoRouterState state) {
                      final String tabName = state.params['tabName']!;

                      return CashOutScreen(tabName: tabName);
                    },
                  ),
                ],
              ),
            ],
          ),
          //==Report====
          GoRoute(
            path: 'report_screen',
            name: 'ReportScreen',
            builder: (context, state) => const ReportScreen(),
            routes: [
              GoRoute(
                path: 'report-filed',
                name: 'ReportFiledCategory',
                builder: (context, state) => FileCategoriesReport(
                  tabLabel: state.queryParams['tabLabel'],
                ),
              ),
            ],
          ),
        ],
      ),

      // Explore More

      GoRoute(
        path: '/explore-more',
        name: 'Explore More',
        builder: ((context, state) => ViewWebsite(
              isfromReport:
                  state.queryParams['isfromReport']!.toLowerCase() == 'false',
              title: state.queryParams['title'],
              url: state.queryParams['url'],
            )),
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
        builder: (_, __) {
          return const LoginScreen();
        },
        routes: [],
      ),
      GoRoute(
        path: '/password',
        builder: (_, __) {
          return const LoginWithPassWord();
        },
      ),
      GoRoute(
        path: '/setpincode',
        builder: (_, __) {
          return const SetPinCode();
        },
      ),
      GoRoute(
        path: '/verify-otp',
        builder: (_, state) => const VerifySetPassword(
            // isForgetPassword:
            //     state.queryParams['isForgetPassword']!.toLowerCase() == 'true',
            ),
      ),
      GoRoute(
        path: '/changepassword',
        builder: (_, state) => ChangePassword(),
      ),
    ]);
