import 'package:auto_route/auto_route.dart';
import 'package:cicgreenloan/core/walk_through/splash_screen.dart';
import 'package:cicgreenloan/modules/bonus/screens/bonus_screen.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/preview_equity.dart';
import 'package:cicgreenloan/modules/get_funding/screens/get_funding.dart';
import 'package:cicgreenloan/modules/member_directory/screens/directory.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_screen.dart';
import 'package:cicgreenloan/modules/report_module/screens/report.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/trading_platform.dart';

import '../../modules/dashboard/dashboard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Splashscreen, initial: true),
    AutoRoute(page: Dashboard, path: '/investment'),
    AutoRoute(page: BonusScreen, path: '/bonus'),
    AutoRoute(page: EmptyRouterPage, path: '/get-funding', children: [
      AutoRoute(path: '', page: HomePage, name: 'HomePageRouter'),
      AutoRoute(
          path: 'preview-equity/:id',
          page: PreviewEquity,
          name: 'PreviewEquityRouter')
    ]),
    AutoRoute(page: UTtrading, path: '/ut-trading'),
    AutoRoute(page: Directory, path: '/directory'),
    AutoRoute(page: Report, path: '/report'),
    AutoRoute(page: PrivilegeScreen, path: '/privilege')
  ],
)
class $AppRouter {}
