import 'package:cicgreenloan/configs/route_management/route_name.dart';
import 'package:cicgreenloan/core/walk_through/splash_screen.dart';
import 'package:cicgreenloan/modules/about_cic/screen/about_cic.dart';
import 'package:cicgreenloan/modules/dashboard/dashboard.dart';
import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/modules/event_module/models/event_detail_argument.dart';
import 'package:cicgreenloan/modules/event_module/screen/event.dart';
import 'package:cicgreenloan/modules/event_module/screen/event_detail.dart';
import 'package:cicgreenloan/modules/learning_platform_module/screens/learning_home.dart';
import 'package:cicgreenloan/modules/member_directory/screens/directory.dart';
import 'package:cicgreenloan/modules/member_directory/screens/member_detail.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_screen.dart';
import 'package:cicgreenloan/modules/report_module/screens/report.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/trading_platform.dart';
import 'package:cicgreenloan/modules/bonus/screens/bonus_screen.dart';
import 'package:cicgreenloan/modules/get_funding/screens/get_funding.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/trading_option.dart';
import 'package:cicgreenloan/modules/google_map_module/google_map.dart';
import 'package:cicgreenloan/modules/dashboard/buttom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../Utils/helper/screen_agrument/member_screen_argument.dart';
import '../../modules/market_place/Screens/market_place.dart';
import '../../modules/ut_trading/screens/add_inquiry.dart';

Route<dynamic> routeSetting(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.INVESTMENT:
      return MaterialPageRoute(
        builder: (context) => const Dashboard(isNavigator: true),
      );
    case RouteName.GETFUNDING:
      final argument = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => const HomePage(
          isNavigator: true,
        ),
        settings: RouteSettings(arguments: argument),
      );
    case RouteName.UTTRADING:
      return MaterialPageRoute(
        builder: (context) => const UTtrading(),
      );
    case RouteName.DIRECTORY:
      return MaterialPageRoute(
        builder: (context) => const Directory(isNavigator: true),
      );
    case RouteName.MARKETPLACE:
      return MaterialPageRoute(
        builder: (context) => const MarketPlace(isNavigator: true),
      );
    case RouteName.EVENTS:
      return MaterialPageRoute(
        builder: (context) => const EventScreen(isNavigator: true),
      );
    case RouteName.LEARNINGPLATFORM:
      return MaterialPageRoute(
        builder: (context) => const LearningHome(isNavigator: true),
      );
    case RouteName.REPORTS:
      return MaterialPageRoute(
        builder: (context) => Report(isNavigator: true),
      );
    case RouteName.ABOUTCIC:
      return MaterialPageRoute(
        builder: (context) => AboutCIC(isNavigator: true),
      );
    case RouteName.SPLASHSCREEN:
      return MaterialPageRoute(
        builder: (context) => const Splashscreen(),
      );
    case RouteName.TRADING:
      var tradeArgument = settings.arguments as InquiryModel;
      return MaterialPageRoute(
        settings: RouteSettings(arguments: tradeArgument),
        builder: (context) => const Trading(),
      );
    case RouteName.ADDINQUIRY:
      var addtradingArgument = settings.arguments as InquiryModel;
      return MaterialPageRoute(
        settings: RouteSettings(arguments: addtradingArgument),
        builder: (context) => const AddInquiry(),
      );
    case RouteName.EVENTDETAIL:
      final eventArgument = settings.arguments as EventDetailArgument;
      return MaterialPageRoute(
        settings: RouteSettings(arguments: eventArgument),
        builder: (context) => const EventDetail(),
      );
    case RouteName.MENUPAGE:
      return MaterialPageRoute(builder: (context) => const PaymentSchedule());
    case RouteName.GOOGLEMAPPAGE:
      final argument = settings.arguments as EventData;
      return MaterialPageRoute(
          builder: (context) => const GoogleMapsPage(),
          settings: RouteSettings(arguments: argument));
    case RouteName.MEMBERDETAIL:
      final argument = settings.arguments as MemberDetailAgrument;
      return MaterialPageRoute(
          builder: (context) => const MemberDetail(),
          settings: RouteSettings(arguments: argument));
    case RouteName.BONUS:
      // final argument = settings.arguments as BonusArgument;
      return MaterialPageRoute(
          builder: (context) => const BonusScreen(),
          settings: const RouteSettings());
    case RouteName.PRIVILEGE:
      return MaterialPageRoute(
          builder: (context) => const PrivilegeScreen(),
          settings: const RouteSettings());
    default:
      return MaterialPageRoute(
        builder: (context) => const Splashscreen(),
      );
  }
}
