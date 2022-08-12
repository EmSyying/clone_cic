// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i11;

import '../../core/walk_through/splash_screen.dart' as _i1;
import '../../modules/bonus/screens/bonus_screen.dart' as _i3;
import '../../modules/dashboard/dashboard.dart' as _i2;
import '../../modules/get_funding/screens/equity_investment/preview_equity.dart'
    as _i10;
import '../../modules/get_funding/screens/get_funding.dart' as _i9;
import '../../modules/member_directory/screens/directory.dart' as _i6;
import '../../modules/privilege_program/screen/privilege/privilege_screen.dart'
    as _i8;
import '../../modules/report_module/screens/report.dart' as _i7;
import '../../modules/ut_trading/screens/trading_platform.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Splashscreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Splashscreen());
    },
    Dashboard.name: (routeData) {
      final args =
          routeData.argsAs<DashboardArgs>(orElse: () => const DashboardArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.Dashboard(key: args.key, isNavigator: args.isNavigator));
    },
    BonusScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BonusScreen());
    },
    EmptyRouterRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    UTtrading.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UTtrading());
    },
    Directory.name: (routeData) {
      final args =
          routeData.argsAs<DirectoryArgs>(orElse: () => const DirectoryArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.Directory(
              key: args.key,
              isNavigator: args.isNavigator,
              fromPage: args.fromPage,
              onTap: args.onTap,
              isShowCiCTeam: args.isShowCiCTeam));
    },
    Report.name: (routeData) {
      final args =
          routeData.argsAs<ReportArgs>(orElse: () => const ReportArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.Report(key: args.key, isNavigator: args.isNavigator));
    },
    PrivilegeScreen.name: (routeData) {
      final args = routeData.argsAs<PrivilegeScreenArgs>(
          orElse: () => const PrivilegeScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.PrivilegeScreen(key: args.key, index: args.index));
    },
    HomePageRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<HomePageRouterArgs>(
          orElse: () => HomePageRouterArgs(
              isNavigator: queryParams.optBool('isNavigator')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.HomePage(key: args.key, isNavigator: args.isNavigator));
    },
    PreviewEquityRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PreviewEquityRouterArgs>(
          orElse: () => PreviewEquityRouterArgs(id: pathParams.optInt('id')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.PreviewEquity(key: args.key, id: args.id));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(Splashscreen.name, path: '/'),
        _i4.RouteConfig(Dashboard.name, path: '/investment'),
        _i4.RouteConfig(BonusScreen.name, path: '/bonus'),
        _i4.RouteConfig(EmptyRouterRoute.name, path: '/get-funding', children: [
          _i4.RouteConfig(HomePageRouter.name,
              path: '', parent: EmptyRouterRoute.name),
          _i4.RouteConfig(PreviewEquityRouter.name,
              path: 'preview-equity/:id', parent: EmptyRouterRoute.name)
        ]),
        _i4.RouteConfig(UTtrading.name, path: '/ut-trading'),
        _i4.RouteConfig(Directory.name, path: '/directory'),
        _i4.RouteConfig(Report.name, path: '/report'),
        _i4.RouteConfig(PrivilegeScreen.name, path: '/privilege')
      ];
}

/// generated route for
/// [_i1.Splashscreen]
class Splashscreen extends _i4.PageRouteInfo<void> {
  const Splashscreen() : super(Splashscreen.name, path: '/');

  static const String name = 'Splashscreen';
}

/// generated route for
/// [_i2.Dashboard]
class Dashboard extends _i4.PageRouteInfo<DashboardArgs> {
  Dashboard({_i11.Key? key, bool? isNavigator})
      : super(Dashboard.name,
            path: '/investment',
            args: DashboardArgs(key: key, isNavigator: isNavigator));

  static const String name = 'Dashboard';
}

class DashboardArgs {
  const DashboardArgs({this.key, this.isNavigator});

  final _i11.Key? key;

  final bool? isNavigator;

  @override
  String toString() {
    return 'DashboardArgs{key: $key, isNavigator: $isNavigator}';
  }
}

/// generated route for
/// [_i3.BonusScreen]
class BonusScreen extends _i4.PageRouteInfo<void> {
  const BonusScreen() : super(BonusScreen.name, path: '/bonus');

  static const String name = 'BonusScreen';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class EmptyRouterRoute extends _i4.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i4.PageRouteInfo>? children})
      : super(EmptyRouterRoute.name,
            path: '/get-funding', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i5.UTtrading]
class UTtrading extends _i4.PageRouteInfo<void> {
  const UTtrading() : super(UTtrading.name, path: '/ut-trading');

  static const String name = 'UTtrading';
}

/// generated route for
/// [_i6.Directory]
class Directory extends _i4.PageRouteInfo<DirectoryArgs> {
  Directory(
      {_i11.Key? key,
      bool? isNavigator,
      String? fromPage,
      Function? onTap,
      int? isShowCiCTeam})
      : super(Directory.name,
            path: '/directory',
            args: DirectoryArgs(
                key: key,
                isNavigator: isNavigator,
                fromPage: fromPage,
                onTap: onTap,
                isShowCiCTeam: isShowCiCTeam));

  static const String name = 'Directory';
}

class DirectoryArgs {
  const DirectoryArgs(
      {this.key,
      this.isNavigator,
      this.fromPage,
      this.onTap,
      this.isShowCiCTeam});

  final _i11.Key? key;

  final bool? isNavigator;

  final String? fromPage;

  final Function? onTap;

  final int? isShowCiCTeam;

  @override
  String toString() {
    return 'DirectoryArgs{key: $key, isNavigator: $isNavigator, fromPage: $fromPage, onTap: $onTap, isShowCiCTeam: $isShowCiCTeam}';
  }
}

/// generated route for
/// [_i7.Report]
class Report extends _i4.PageRouteInfo<ReportArgs> {
  Report({_i11.Key? key, bool? isNavigator})
      : super(Report.name,
            path: '/report',
            args: ReportArgs(key: key, isNavigator: isNavigator));

  static const String name = 'Report';
}

class ReportArgs {
  const ReportArgs({this.key, this.isNavigator});

  final _i11.Key? key;

  final bool? isNavigator;

  @override
  String toString() {
    return 'ReportArgs{key: $key, isNavigator: $isNavigator}';
  }
}

/// generated route for
/// [_i8.PrivilegeScreen]
class PrivilegeScreen extends _i4.PageRouteInfo<PrivilegeScreenArgs> {
  PrivilegeScreen({_i11.Key? key, int? index})
      : super(PrivilegeScreen.name,
            path: '/privilege',
            args: PrivilegeScreenArgs(key: key, index: index));

  static const String name = 'PrivilegeScreen';
}

class PrivilegeScreenArgs {
  const PrivilegeScreenArgs({this.key, this.index});

  final _i11.Key? key;

  final int? index;

  @override
  String toString() {
    return 'PrivilegeScreenArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i9.HomePage]
class HomePageRouter extends _i4.PageRouteInfo<HomePageRouterArgs> {
  HomePageRouter({_i11.Key? key, bool? isNavigator})
      : super(HomePageRouter.name,
            path: '',
            args: HomePageRouterArgs(key: key, isNavigator: isNavigator),
            rawQueryParams: {'isNavigator': isNavigator});

  static const String name = 'HomePageRouter';
}

class HomePageRouterArgs {
  const HomePageRouterArgs({this.key, this.isNavigator});

  final _i11.Key? key;

  final bool? isNavigator;

  @override
  String toString() {
    return 'HomePageRouterArgs{key: $key, isNavigator: $isNavigator}';
  }
}

/// generated route for
/// [_i10.PreviewEquity]
class PreviewEquityRouter extends _i4.PageRouteInfo<PreviewEquityRouterArgs> {
  PreviewEquityRouter({_i11.Key? key, int? id})
      : super(PreviewEquityRouter.name,
            path: 'preview-equity/:id',
            args: PreviewEquityRouterArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'PreviewEquityRouter';
}

class PreviewEquityRouterArgs {
  const PreviewEquityRouterArgs({this.key, this.id});

  final _i11.Key? key;

  final int? id;

  @override
  String toString() {
    return 'PreviewEquityRouterArgs{key: $key, id: $id}';
  }
}
