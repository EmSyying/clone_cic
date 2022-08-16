// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../../core/walk_through/splash_screen.dart' as _i1;
import '../../modules/bonus/screens/bonus_screen.dart' as _i3;
import '../../modules/dashboard/dashboard.dart' as _i2;
import '../../modules/get_funding/models/appliication_card_model.dart' as _i19;
import '../../modules/get_funding/screens/debt_investment/preview_debt_form.dart'
    as _i16;
import '../../modules/get_funding/screens/debt_investment/step1_debt.dart'
    as _i13;
import '../../modules/get_funding/screens/debt_investment/step2_debt.dart'
    as _i14;
import '../../modules/get_funding/screens/debt_investment/step3_debt.dart'
    as _i15;
import '../../modules/get_funding/screens/equity_investment/preview_equity.dart'
    as _i12;
import '../../modules/get_funding/screens/equity_investment/step1_equity.dart'
    as _i9;
import '../../modules/get_funding/screens/equity_investment/step2_equity.dart'
    as _i10;
import '../../modules/get_funding/screens/equity_investment/step3_equity.dart'
    as _i11;
import '../../modules/get_funding/screens/get_funding.dart' as _i4;
import '../../modules/member_directory/screens/directory.dart' as _i6;
import '../../modules/privilege_program/screen/privilege/privilege_screen.dart'
    as _i8;
import '../../modules/report_module/screens/report.dart' as _i7;
import '../../modules/ut_trading/screens/trading_platform.dart' as _i5;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    Splashscreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Splashscreen());
    },
    Dashboard.name: (routeData) {
      final args =
          routeData.argsAs<DashboardArgs>(orElse: () => const DashboardArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.Dashboard(key: args.key, isNavigator: args.isNavigator));
    },
    BonusScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BonusScreen());
    },
    HomePageRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<HomePageRouterArgs>(
          orElse: () => HomePageRouterArgs(
              isNavigator: queryParams.optBool('isNavigator')));
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.HomePage(key: args.key, isNavigator: args.isNavigator));
    },
    UTtrading.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UTtrading());
    },
    Directory.name: (routeData) {
      final args =
          routeData.argsAs<DirectoryArgs>(orElse: () => const DirectoryArgs());
      return _i17.MaterialPageX<dynamic>(
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
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.Report(key: args.key, isNavigator: args.isNavigator));
    },
    PrivilegeScreen.name: (routeData) {
      final args = routeData.argsAs<PrivilegeScreenArgs>(
          orElse: () => const PrivilegeScreenArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.PrivilegeScreen(key: args.key, index: args.index));
    },
    Step1EquityRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Step1EquityRouterArgs>(
          orElse: () => Step1EquityRouterArgs(
              id: pathParams.optInt('id', 0), step: pathParams.optInt('step')));
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.Step1Equiry(key: args.key, id: args.id, step: args.step));
    },
    Step2EquityRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Step2EquityRouterArgs>(
          orElse: () => Step2EquityRouterArgs(
              id: pathParams.optInt('id'), step: pathParams.optInt('step')));
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.Step2Equity(key: args.key, id: args.id, step: args.step));
    },
    Step3EquityRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Step3EquityRouterArgs>(
          orElse: () => Step3EquityRouterArgs(
              id: pathParams.optInt('id'), step: pathParams.optInt('step')));
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.Step3Equity(key: args.key, id: args.id, step: args.step));
    },
    PreviewEquityRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PreviewEquityRouterArgs>(
          orElse: () => PreviewEquityRouterArgs(id: pathParams.optInt('id')));
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.PreviewEquity(key: args.key, id: args.id));
    },
    Step1DebtRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Step1DebtRouterArgs>(
          orElse: () => Step1DebtRouterArgs(
              id: pathParams.optInt('id', 0), step: pathParams.optInt('step')));
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.Step1Debt(key: args.key, id: args.id, step: args.step));
    },
    Step2DebtRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Step2DebtRouterArgs>(
          orElse: () => Step2DebtRouterArgs(
              id: pathParams.optInt('id', 0), step: pathParams.optInt('step')));
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.Step2Debt(key: args.key, id: args.id, step: args.step));
    },
    Step3DebtRouter.name: (routeData) {
      final args = routeData.argsAs<Step3DebtRouterArgs>(
          orElse: () => const Step3DebtRouterArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.Step3Debt(
              key: args.key,
              numberOfStep: args.numberOfStep,
              applicationDetail: args.applicationDetail,
              isDraft: args.isDraft));
    },
    Step4DebtRouter.name: (routeData) {
      final args = routeData.argsAs<Step4DebtRouterArgs>(
          orElse: () => const Step4DebtRouterArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.Step3Debt(
              key: args.key,
              numberOfStep: args.numberOfStep,
              applicationDetail: args.applicationDetail,
              isDraft: args.isDraft));
    },
    PreviewDebtRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PreviewDebtRouterArgs>(
          orElse: () => PreviewDebtRouterArgs(id: pathParams.optInt('id')));
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.PreviewDebtForm(key: args.key, id: args.id));
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(Splashscreen.name, path: '/'),
        _i17.RouteConfig(Dashboard.name, path: '/investment'),
        _i17.RouteConfig(BonusScreen.name, path: '/bonus'),
        _i17.RouteConfig(HomePageRouter.name, path: '/get-funding', children: [
          _i17.RouteConfig(Step1EquityRouter.name,
              path: 'step1equity/:id/:step', parent: HomePageRouter.name),
          _i17.RouteConfig(Step2EquityRouter.name,
              path: 'step2equity/:id/:step', parent: HomePageRouter.name),
          _i17.RouteConfig(Step3EquityRouter.name,
              path: 'step3equity/:id/:step', parent: HomePageRouter.name),
          _i17.RouteConfig(PreviewEquityRouter.name,
              path: 'preview-equity/:id', parent: HomePageRouter.name),
          _i17.RouteConfig(Step1DebtRouter.name,
              path: 'step1debt/:id/:step', parent: HomePageRouter.name),
          _i17.RouteConfig(Step2DebtRouter.name,
              path: 'step2debt/:id/:step', parent: HomePageRouter.name),
          _i17.RouteConfig(Step3DebtRouter.name,
              path: 'step3debt/:id/:step', parent: HomePageRouter.name),
          _i17.RouteConfig(Step4DebtRouter.name,
              path: 'step4debt/:id/:step', parent: HomePageRouter.name),
          _i17.RouteConfig(PreviewDebtRouter.name,
              path: 'preview-debt/:id', parent: HomePageRouter.name)
        ]),
        _i17.RouteConfig(UTtrading.name, path: '/ut-trading'),
        _i17.RouteConfig(Directory.name, path: '/directory'),
        _i17.RouteConfig(Report.name, path: '/report'),
        _i17.RouteConfig(PrivilegeScreen.name, path: '/privilege')
      ];
}

/// generated route for
/// [_i1.Splashscreen]
class Splashscreen extends _i17.PageRouteInfo<void> {
  const Splashscreen() : super(Splashscreen.name, path: '/');

  static const String name = 'Splashscreen';
}

/// generated route for
/// [_i2.Dashboard]
class Dashboard extends _i17.PageRouteInfo<DashboardArgs> {
  Dashboard({_i18.Key? key, bool? isNavigator})
      : super(Dashboard.name,
            path: '/investment',
            args: DashboardArgs(key: key, isNavigator: isNavigator));

  static const String name = 'Dashboard';
}

class DashboardArgs {
  const DashboardArgs({this.key, this.isNavigator});

  final _i18.Key? key;

  final bool? isNavigator;

  @override
  String toString() {
    return 'DashboardArgs{key: $key, isNavigator: $isNavigator}';
  }
}

/// generated route for
/// [_i3.BonusScreen]
class BonusScreen extends _i17.PageRouteInfo<void> {
  const BonusScreen() : super(BonusScreen.name, path: '/bonus');

  static const String name = 'BonusScreen';
}

/// generated route for
/// [_i4.HomePage]
class HomePageRouter extends _i17.PageRouteInfo<HomePageRouterArgs> {
  HomePageRouter(
      {_i18.Key? key, bool? isNavigator, List<_i17.PageRouteInfo>? children})
      : super(HomePageRouter.name,
            path: '/get-funding',
            args: HomePageRouterArgs(key: key, isNavigator: isNavigator),
            rawQueryParams: {'isNavigator': isNavigator},
            initialChildren: children);

  static const String name = 'HomePageRouter';
}

class HomePageRouterArgs {
  const HomePageRouterArgs({this.key, this.isNavigator});

  final _i18.Key? key;

  final bool? isNavigator;

  @override
  String toString() {
    return 'HomePageRouterArgs{key: $key, isNavigator: $isNavigator}';
  }
}

/// generated route for
/// [_i5.UTtrading]
class UTtrading extends _i17.PageRouteInfo<void> {
  const UTtrading() : super(UTtrading.name, path: '/ut-trading');

  static const String name = 'UTtrading';
}

/// generated route for
/// [_i6.Directory]
class Directory extends _i17.PageRouteInfo<DirectoryArgs> {
  Directory(
      {_i18.Key? key,
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

  final _i18.Key? key;

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
class Report extends _i17.PageRouteInfo<ReportArgs> {
  Report({_i18.Key? key, bool? isNavigator})
      : super(Report.name,
            path: '/report',
            args: ReportArgs(key: key, isNavigator: isNavigator));

  static const String name = 'Report';
}

class ReportArgs {
  const ReportArgs({this.key, this.isNavigator});

  final _i18.Key? key;

  final bool? isNavigator;

  @override
  String toString() {
    return 'ReportArgs{key: $key, isNavigator: $isNavigator}';
  }
}

/// generated route for
/// [_i8.PrivilegeScreen]
class PrivilegeScreen extends _i17.PageRouteInfo<PrivilegeScreenArgs> {
  PrivilegeScreen({_i18.Key? key, int? index})
      : super(PrivilegeScreen.name,
            path: '/privilege',
            args: PrivilegeScreenArgs(key: key, index: index));

  static const String name = 'PrivilegeScreen';
}

class PrivilegeScreenArgs {
  const PrivilegeScreenArgs({this.key, this.index});

  final _i18.Key? key;

  final int? index;

  @override
  String toString() {
    return 'PrivilegeScreenArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i9.Step1Equiry]
class Step1EquityRouter extends _i17.PageRouteInfo<Step1EquityRouterArgs> {
  Step1EquityRouter({_i18.Key? key, int? id = 0, int? step})
      : super(Step1EquityRouter.name,
            path: 'step1equity/:id/:step',
            args: Step1EquityRouterArgs(key: key, id: id, step: step),
            rawPathParams: {'id': id, 'step': step});

  static const String name = 'Step1EquityRouter';
}

class Step1EquityRouterArgs {
  const Step1EquityRouterArgs({this.key, this.id = 0, this.step});

  final _i18.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step1EquityRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i10.Step2Equity]
class Step2EquityRouter extends _i17.PageRouteInfo<Step2EquityRouterArgs> {
  Step2EquityRouter({_i18.Key? key, int? id, int? step})
      : super(Step2EquityRouter.name,
            path: 'step2equity/:id/:step',
            args: Step2EquityRouterArgs(key: key, id: id, step: step),
            rawPathParams: {'id': id, 'step': step});

  static const String name = 'Step2EquityRouter';
}

class Step2EquityRouterArgs {
  const Step2EquityRouterArgs({this.key, this.id, this.step});

  final _i18.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step2EquityRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i11.Step3Equity]
class Step3EquityRouter extends _i17.PageRouteInfo<Step3EquityRouterArgs> {
  Step3EquityRouter({_i18.Key? key, int? id, int? step})
      : super(Step3EquityRouter.name,
            path: 'step3equity/:id/:step',
            args: Step3EquityRouterArgs(key: key, id: id, step: step),
            rawPathParams: {'id': id, 'step': step});

  static const String name = 'Step3EquityRouter';
}

class Step3EquityRouterArgs {
  const Step3EquityRouterArgs({this.key, this.id, this.step});

  final _i18.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step3EquityRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i12.PreviewEquity]
class PreviewEquityRouter extends _i17.PageRouteInfo<PreviewEquityRouterArgs> {
  PreviewEquityRouter({_i18.Key? key, int? id})
      : super(PreviewEquityRouter.name,
            path: 'preview-equity/:id',
            args: PreviewEquityRouterArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'PreviewEquityRouter';
}

class PreviewEquityRouterArgs {
  const PreviewEquityRouterArgs({this.key, this.id});

  final _i18.Key? key;

  final int? id;

  @override
  String toString() {
    return 'PreviewEquityRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i13.Step1Debt]
class Step1DebtRouter extends _i17.PageRouteInfo<Step1DebtRouterArgs> {
  Step1DebtRouter({_i18.Key? key, int? id = 0, int? step})
      : super(Step1DebtRouter.name,
            path: 'step1debt/:id/:step',
            args: Step1DebtRouterArgs(key: key, id: id, step: step),
            rawPathParams: {'id': id, 'step': step});

  static const String name = 'Step1DebtRouter';
}

class Step1DebtRouterArgs {
  const Step1DebtRouterArgs({this.key, this.id = 0, this.step});

  final _i18.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step1DebtRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i14.Step2Debt]
class Step2DebtRouter extends _i17.PageRouteInfo<Step2DebtRouterArgs> {
  Step2DebtRouter({_i18.Key? key, int? id = 0, int? step})
      : super(Step2DebtRouter.name,
            path: 'step2debt/:id/:step',
            args: Step2DebtRouterArgs(key: key, id: id, step: step),
            rawPathParams: {'id': id, 'step': step});

  static const String name = 'Step2DebtRouter';
}

class Step2DebtRouterArgs {
  const Step2DebtRouterArgs({this.key, this.id = 0, this.step});

  final _i18.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step2DebtRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i15.Step3Debt]
class Step3DebtRouter extends _i17.PageRouteInfo<Step3DebtRouterArgs> {
  Step3DebtRouter(
      {_i18.Key? key,
      int? numberOfStep,
      _i19.ApplicationData? applicationDetail,
      String? isDraft})
      : super(Step3DebtRouter.name,
            path: 'step3debt/:id/:step',
            args: Step3DebtRouterArgs(
                key: key,
                numberOfStep: numberOfStep,
                applicationDetail: applicationDetail,
                isDraft: isDraft));

  static const String name = 'Step3DebtRouter';
}

class Step3DebtRouterArgs {
  const Step3DebtRouterArgs(
      {this.key, this.numberOfStep, this.applicationDetail, this.isDraft});

  final _i18.Key? key;

  final int? numberOfStep;

  final _i19.ApplicationData? applicationDetail;

  final String? isDraft;

  @override
  String toString() {
    return 'Step3DebtRouterArgs{key: $key, numberOfStep: $numberOfStep, applicationDetail: $applicationDetail, isDraft: $isDraft}';
  }
}

/// generated route for
/// [_i15.Step3Debt]
class Step4DebtRouter extends _i17.PageRouteInfo<Step4DebtRouterArgs> {
  Step4DebtRouter(
      {_i18.Key? key,
      int? numberOfStep,
      _i19.ApplicationData? applicationDetail,
      String? isDraft})
      : super(Step4DebtRouter.name,
            path: 'step4debt/:id/:step',
            args: Step4DebtRouterArgs(
                key: key,
                numberOfStep: numberOfStep,
                applicationDetail: applicationDetail,
                isDraft: isDraft));

  static const String name = 'Step4DebtRouter';
}

class Step4DebtRouterArgs {
  const Step4DebtRouterArgs(
      {this.key, this.numberOfStep, this.applicationDetail, this.isDraft});

  final _i18.Key? key;

  final int? numberOfStep;

  final _i19.ApplicationData? applicationDetail;

  final String? isDraft;

  @override
  String toString() {
    return 'Step4DebtRouterArgs{key: $key, numberOfStep: $numberOfStep, applicationDetail: $applicationDetail, isDraft: $isDraft}';
  }
}

/// generated route for
/// [_i16.PreviewDebtForm]
class PreviewDebtRouter extends _i17.PageRouteInfo<PreviewDebtRouterArgs> {
  PreviewDebtRouter({_i18.Key? key, int? id})
      : super(PreviewDebtRouter.name,
            path: 'preview-debt/:id',
            args: PreviewDebtRouterArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'PreviewDebtRouter';
}

class PreviewDebtRouterArgs {
  const PreviewDebtRouterArgs({this.key, this.id});

  final _i18.Key? key;

  final int? id;

  @override
  String toString() {
    return 'PreviewDebtRouterArgs{key: $key, id: $id}';
  }
}
