import 'package:auto_route/auto_route.dart';
import 'package:cicgreenloan/core/walk_through/splash_screen.dart';
import 'package:cicgreenloan/modules/bonus/screens/bonus_screen.dart';
import 'package:cicgreenloan/modules/get_funding/screens/debt_investment/preview_debt_form.dart';
import 'package:cicgreenloan/modules/get_funding/screens/debt_investment/step1_debt.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/preview_equity.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/step1_equity.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/step2_equity.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/step3_equity.dart';
import 'package:cicgreenloan/modules/get_funding/screens/get_funding.dart';
import 'package:cicgreenloan/modules/member_directory/screens/directory.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_screen.dart';
import 'package:cicgreenloan/modules/report_module/screens/report.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/trading_platform.dart';

import '../../Utils/helper/custom_success_screen.dart';
import '../../Utils/web_view/web_view.dart';
import '../../modules/dashboard/dashboard.dart';
import '../../modules/get_funding/screens/debt_investment/step2_debt.dart';
import '../../modules/get_funding/screens/debt_investment/step3_debt.dart';
import '../../modules/investment_module/screen/bullet_payment_detail.dart';
import '../../modules/investment_module/screen/contract_withdraw.dart';
import '../../modules/investment_module/screen/deposit_screen.dart';
import '../../modules/investment_module/screen/fif_deduc_selection.dart';
import '../../modules/investment_module/screen/renewal_screen.dart';
import '../../modules/investment_module/screen/saving_detail_screen.dart';
import '../../modules/setting_modules/screens/sub_setting_screen/contract_terms.dart';
import '../../widgets/investments/fif_option1.dart';
import '../../widgets/investments/view_agreement_list.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Splashscreen, initial: true),
    AutoRoute(
      page: EmptyRouterPage,
      path: '/investment',
      name: 'MyInvestmentRouter',
      children: [
        AutoRoute(
          page: Dashboard,
          path: '',
        ),
        //renewal screen
        AutoRoute(
          page: SavingDetailScreen,
          path: 'investment/saving-detail',
          name: 'SavingDetailScreenRouter',
        ),
        AutoRoute(
          page: RenewalScreen,
          path: 'investment/saving-detail/renew-contract',
          name: 'RenewalScreenRouter',
        ),
        AutoRoute(
          page: BulletPaymentDetail,
          path: 'investment/saving-detail/renew-contract/renew-review',
          name: 'RenewReviewRouter',
        ),
        AutoRoute(
          page: CustomSucessScreen,
          path: 'investment/saving-detail/renew-contract/renew-review/success',
          name: 'RenewSuccessRouter',
        ),
        //contract withdraw screen
        AutoRoute(
          page: ContractWithdrawScreen,
          path: 'investment/saving-detail/redemption',
          name: 'ContractWithdrawScreenRouter',
        ),
        AutoRoute(
          page: BulletPaymentDetail,
          path: 'investment/saving-detail/redemption/redemption-review',
          name: 'ReviewWithdrawRouter',
        ),
        AutoRoute(
          page: CustomSucessScreen,
          path: 'investment/saving-detail/redemption/redemption-review/success',
          name: 'RedemptionSuccessRouter',
        ),
        AutoRoute(
          page: ViewWebsite,
          path: 'investment/about-fif',
          name: 'AboutFiFRouter',
        ),
        //craete application
        AutoRoute(
          page: FIFDeucSelection,
          name: 'FIFDeucSelectionRouter',
          path: 'investment/fif-select-product',
        ),
        AutoRoute(
          page: ViewWebsite,
          name: 'ExploreMoreRouter',
          path: 'investment/fif-select-product/explore-more',
        ),
        AutoRoute(
          page: FIFOption1,
          name: 'FIFOption1Router',
          path: 'investment/fif-select-product/fif-Application',
        ),
        AutoRoute(
          page: BulletPaymentDetail,
          name: 'ReviewApplicationRouter',
          path: 'investment/fif-select-product/fif-Application/review',
        ),
        AutoRoute(
          page: CustomSucessScreen,
          name: 'CustomSucessScreenRouter',
          path: 'investment/fif-select-product/fif-Application/review/success',
        ),
        //confirm application
        AutoRoute(
          page: DepositeScreen,
          path: 'investment/confirm-detail',
          name: 'ConfirmDetailRouter',
        ),
        //pending application
        AutoRoute(
          page: BulletPaymentDetail,
          path: 'investment/pending-detail',
          name: 'PendingDetailRouter',
        ),
        AutoRoute(
          page: ContractTerm,
          path: 'investment/service-agreement',
          name: 'ServiceAgreementRouter',
        ),
        //view agreement
        AutoRoute(
          page: ViewWebsite,
          path: 'investment/view-agreement',
          name: 'ViewAgreementRouter',
        ),
        AutoRoute(
          page: ViewAgreementList,
          path: 'investment/view-agreement-list',
          name: 'ViewAgreementListRouter',
        ),
      ],
    ),
    AutoRoute(page: BonusScreen, path: '/bonus'),
    AutoRoute(
        path: '/get-funding',
        page: HomePage,
        name: 'HomePageRouter',
        children: [
          // Equity Auto Route
          AutoRoute(
              path: 'step1equity/:id/:step',
              page: Step1Equiry,
              name: 'Step1EquityRouter'),
          AutoRoute(
              path: 'step2equity/:id/:step',
              page: Step2Equity,
              name: 'Step2EquityRouter'),
          AutoRoute(
              path: 'step3equity/:id/:step',
              page: Step3Equity,
              name: 'Step3EquityRouter'),
          AutoRoute(
              path: 'preview-equity/:id',
              page: PreviewEquity,
              name: 'PreviewEquityRouter'),
          // Debt Auto Route
          AutoRoute(
              path: 'step1debt/:id/:step',
              page: Step1Debt,
              name: 'Step1DebtRouter'),
          AutoRoute(
              path: 'step2debt/:id/:step',
              page: Step2Debt,
              name: 'Step2DebtRouter'),
          AutoRoute(
              path: 'step3debt/:id/:step',
              page: Step3Debt,
              name: 'Step3DebtRouter'),
          AutoRoute(
              path: 'step4debt/:id/:step',
              page: Step3Debt,
              name: 'Step4DebtRouter'),
          AutoRoute(
              path: 'preview-debt/:id',
              page: PreviewDebtForm,
              name: 'PreviewDebtRouter')
        ]),
    AutoRoute(page: UTtrading, path: '/ut-trading'),
    AutoRoute(page: Directory, path: '/directory'),
    AutoRoute(page: Report, path: '/report'),
    AutoRoute(page: PrivilegeScreen, path: '/privilege')
  ],
)
class $AppRouter {}
