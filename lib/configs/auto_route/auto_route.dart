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

import '../../modules/dashboard/dashboard.dart';
import '../../modules/get_funding/screens/debt_investment/step2_debt.dart';
import '../../modules/get_funding/screens/debt_investment/step3_debt.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Splashscreen, initial: true),
    AutoRoute(page: Dashboard, path: '/investment'),
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
