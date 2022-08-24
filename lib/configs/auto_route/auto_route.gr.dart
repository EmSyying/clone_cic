// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i32;

import '../../core/walk_through/splash_screen.dart' as _i1;
import '../../modules/bonus/screens/bonus_screen.dart' as _i3;
import '../../modules/dashboard/dashboard.dart' as _i8;
import '../../modules/get_funding/models/appliication_card_model.dart' as _i38;
import '../../modules/get_funding/screens/debt_investment/preview_debt_form.dart'
    as _i27;
import '../../modules/get_funding/screens/debt_investment/step1_debt.dart'
    as _i24;
import '../../modules/get_funding/screens/debt_investment/step2_debt.dart'
    as _i25;
import '../../modules/get_funding/screens/debt_investment/step3_debt.dart'
    as _i26;
import '../../modules/get_funding/screens/equity_investment/preview_equity.dart'
    as _i23;
import '../../modules/get_funding/screens/equity_investment/step1_equity.dart'
    as _i20;
import '../../modules/get_funding/screens/equity_investment/step2_equity.dart'
    as _i21;
import '../../modules/get_funding/screens/equity_investment/step3_equity.dart'
    as _i22;
import '../../modules/get_funding/screens/get_funding.dart' as _i4;
import '../../modules/investment_module/controller/investment_controller.dart'
    as _i35;
import '../../modules/investment_module/model/fif_application/fif_application.dart'
    as _i34;
import '../../modules/investment_module/model/fif_application/schedule/schedule.dart'
    as _i33;
import '../../modules/investment_module/model/fif_contract_option/fif_contract_option.dart'
    as _i36;
import '../../modules/investment_module/model/view_agreement/view_agreement.dart'
    as _i37;
import '../../modules/investment_module/screen/bullet_payment_detail.dart'
    as _i11;
import '../../modules/investment_module/screen/contract_withdraw.dart' as _i13;
import '../../modules/investment_module/screen/deposit_screen.dart' as _i17;
import '../../modules/investment_module/screen/fif_deduc_selection.dart'
    as _i15;
import '../../modules/investment_module/screen/renewal_screen.dart' as _i10;
import '../../modules/investment_module/screen/saving_detail_screen.dart'
    as _i9;
import '../../modules/member_directory/screens/directory.dart' as _i6;
import '../../modules/privilege_program/screen/privilege/privilege_filters.dart'
    as _i31;
import '../../modules/privilege_program/screen/privilege/privilege_screen.dart'
    as _i28;
import '../../modules/privilege_program/screen/privilege/search_screen.dart'
    as _i30;
import '../../modules/privilege_program/screen/privilege_detail/privilege_detail_screen.dart'
    as _i29;
import '../../modules/report_module/screens/report.dart' as _i7;
import '../../modules/setting_modules/screens/sub_setting_screen/contract_terms.dart'
    as _i18;
import '../../modules/ut_trading/screens/trading_platform.dart' as _i5;
import '../../Utils/helper/custom_success_screen.dart' as _i12;
import '../../Utils/web_view/web_view.dart' as _i14;
import '../../widgets/investments/fif_option1.dart' as _i16;
import '../../widgets/investments/view_agreement_list.dart' as _i19;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i32.GlobalKey<_i32.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    Splashscreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Splashscreen());
    },
    MyInvestmentRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    BonusScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BonusScreen());
    },
    HomePageRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<HomePageRouterArgs>(
          orElse: () => HomePageRouterArgs(
              isNavigator: queryParams.optBool('isNavigator')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.HomePage(key: args.key, isNavigator: args.isNavigator));
    },
    UTtrading.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UTtrading());
    },
    Directory.name: (routeData) {
      final args =
          routeData.argsAs<DirectoryArgs>(orElse: () => const DirectoryArgs());
      return _i2.MaterialPageX<dynamic>(
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
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.Report(
              key: args.key,
              isNavigator: args.isNavigator,
              currentTabIndex: args.currentTabIndex));
    },
    PrivilegeRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    Dashboard.name: (routeData) {
      final args =
          routeData.argsAs<DashboardArgs>(orElse: () => const DashboardArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.Dashboard(
              key: args.key,
              isNavigator: args.isNavigator,
              tabName: args.tabName));
    },
    SavingDetailScreenRouter.name: (routeData) {
      final args = routeData.argsAs<SavingDetailScreenRouterArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.SavingDetailScreen(
              key: args.key,
              accountName: args.accountName,
              paddings: args.paddings,
              code: args.code,
              id: args.id,
              scheduleModelList: args.scheduleModelList,
              hide: args.hide,
              index: args.index,
              investAmonut: args.investAmonut,
              currentPrincipal: args.currentPrincipal,
              fromPage: args.fromPage));
    },
    RenewalScreenRouter.name: (routeData) {
      final args = routeData.argsAs<RenewalScreenRouterArgs>(
          orElse: () => const RenewalScreenRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.RenewalScreen(
              key: args.key,
              investAmount: args.investAmount,
              fiFApplicationModel: args.fiFApplicationModel,
              id: args.id,
              interestEarned: args.interestEarned,
              annually: args.annually,
              accountName: args.accountName,
              contractCode: args.contractCode));
    },
    RenewReviewRouter.name: (routeData) {
      final args = routeData.argsAs<RenewReviewRouterArgs>(
          orElse: () => const RenewReviewRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.BulletPaymentDetail(
              key: args.key,
              isAnnullyRate: args.isAnnullyRate,
              productName: args.productName,
              isRenewal: args.isRenewal,
              renewBy: args.renewBy,
              renewDate: args.renewDate,
              renewPeriod: args.renewPeriod,
              oldDate: args.oldDate,
              newDate: args.newDate,
              investDate: args.investDate,
              investDuration: args.investDuration,
              firstPayDate: args.firstPayDate,
              maturityDate: args.maturityDate,
              investAmount: args.investAmount,
              withdrawer: args.withdrawer,
              withdrawAmount: args.withdrawAmount,
              noticeDate: args.noticeDate,
              disbursementDate: args.disbursementDate,
              contractStatus: args.contractStatus,
              isWithdraw: args.isWithdraw,
              isStatusPending: args.isStatusPending,
              id: args.id,
              fiFApplicationDetailModel: args.fiFApplicationDetailModel,
              isNoUSD: args.isNoUSD,
              status: args.status,
              titles: args.titles,
              oncallBack: args.oncallBack,
              annually: args.annually,
              fromPage: args.fromPage));
    },
    RenewSuccessRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<RenewSuccessRouterArgs>(
          orElse: () => RenewSuccessRouterArgs(
              title: queryParams.optString('title'),
              description: queryParams.optString('description'),
              icon: queryParams.get('icon'),
              buttonTitle: queryParams.optString('buttonTitle'),
              backgroundColor: queryParams.get('backgroundColor'),
              descriptionPadding: queryParams.get('descriptionPadding')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.CustomSucessScreen(
              key: args.key,
              title: args.title,
              description: args.description,
              icon: args.icon,
              onPressedButton: args.onPressedButton,
              buttonTitle: args.buttonTitle,
              backgroundColor: args.backgroundColor,
              descriptionPadding: args.descriptionPadding));
    },
    ContractWithdrawScreenRouter.name: (routeData) {
      final args = routeData.argsAs<ContractWithdrawScreenRouterArgs>(
          orElse: () => const ContractWithdrawScreenRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.ContractWithdrawScreen(
              key: args.key,
              investAmount: args.investAmount,
              interestEarned: args.interestEarned,
              id: args.id,
              productName: args.productName,
              contractCode: args.contractCode,
              accountName: args.accountName));
    },
    ReviewWithdrawRouter.name: (routeData) {
      final args = routeData.argsAs<ReviewWithdrawRouterArgs>(
          orElse: () => const ReviewWithdrawRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.BulletPaymentDetail(
              key: args.key,
              isAnnullyRate: args.isAnnullyRate,
              productName: args.productName,
              isRenewal: args.isRenewal,
              renewBy: args.renewBy,
              renewDate: args.renewDate,
              renewPeriod: args.renewPeriod,
              oldDate: args.oldDate,
              newDate: args.newDate,
              investDate: args.investDate,
              investDuration: args.investDuration,
              firstPayDate: args.firstPayDate,
              maturityDate: args.maturityDate,
              investAmount: args.investAmount,
              withdrawer: args.withdrawer,
              withdrawAmount: args.withdrawAmount,
              noticeDate: args.noticeDate,
              disbursementDate: args.disbursementDate,
              contractStatus: args.contractStatus,
              isWithdraw: args.isWithdraw,
              isStatusPending: args.isStatusPending,
              id: args.id,
              fiFApplicationDetailModel: args.fiFApplicationDetailModel,
              isNoUSD: args.isNoUSD,
              status: args.status,
              titles: args.titles,
              oncallBack: args.oncallBack,
              annually: args.annually,
              fromPage: args.fromPage));
    },
    RedemptionSuccessRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<RedemptionSuccessRouterArgs>(
          orElse: () => RedemptionSuccessRouterArgs(
              title: queryParams.optString('title'),
              description: queryParams.optString('description'),
              icon: queryParams.get('icon'),
              buttonTitle: queryParams.optString('buttonTitle'),
              backgroundColor: queryParams.get('backgroundColor'),
              descriptionPadding: queryParams.get('descriptionPadding')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.CustomSucessScreen(
              key: args.key,
              title: args.title,
              description: args.description,
              icon: args.icon,
              onPressedButton: args.onPressedButton,
              buttonTitle: args.buttonTitle,
              backgroundColor: args.backgroundColor,
              descriptionPadding: args.descriptionPadding));
    },
    AboutFiFRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<AboutFiFRouterArgs>(
          orElse: () => AboutFiFRouterArgs(
              url: queryParams.optString('url'),
              title: queryParams.optString('title'),
              isfromReport: queryParams.optBool('isfromReport', false)));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.ViewWebsite(
              key: args.key,
              url: args.url,
              title: args.title,
              isfromReport: args.isfromReport));
    },
    FIFDeucSelectionRouter.name: (routeData) {
      final args = routeData.argsAs<FIFDeucSelectionRouterArgs>(
          orElse: () => const FIFDeucSelectionRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.FIFDeucSelection(key: args.key, id: args.id));
    },
    ExploreMoreRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ExploreMoreRouterArgs>(
          orElse: () => ExploreMoreRouterArgs(
              url: queryParams.optString('url'),
              title: queryParams.optString('title'),
              isfromReport: queryParams.optBool('isfromReport', false)));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.ViewWebsite(
              key: args.key,
              url: args.url,
              title: args.title,
              isfromReport: args.isfromReport));
    },
    FIFOption1Router.name: (routeData) {
      final args = routeData.argsAs<FIFOption1RouterArgs>(
          orElse: () => const FIFOption1RouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.FIFOption1(
              key: args.key,
              paymentDate: args.paymentDate,
              id: args.id,
              options: args.options));
    },
    ReviewApplicationRouter.name: (routeData) {
      final args = routeData.argsAs<ReviewApplicationRouterArgs>(
          orElse: () => const ReviewApplicationRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.BulletPaymentDetail(
              key: args.key,
              isAnnullyRate: args.isAnnullyRate,
              productName: args.productName,
              isRenewal: args.isRenewal,
              renewBy: args.renewBy,
              renewDate: args.renewDate,
              renewPeriod: args.renewPeriod,
              oldDate: args.oldDate,
              newDate: args.newDate,
              investDate: args.investDate,
              investDuration: args.investDuration,
              firstPayDate: args.firstPayDate,
              maturityDate: args.maturityDate,
              investAmount: args.investAmount,
              withdrawer: args.withdrawer,
              withdrawAmount: args.withdrawAmount,
              noticeDate: args.noticeDate,
              disbursementDate: args.disbursementDate,
              contractStatus: args.contractStatus,
              isWithdraw: args.isWithdraw,
              isStatusPending: args.isStatusPending,
              id: args.id,
              fiFApplicationDetailModel: args.fiFApplicationDetailModel,
              isNoUSD: args.isNoUSD,
              status: args.status,
              titles: args.titles,
              oncallBack: args.oncallBack,
              annually: args.annually,
              fromPage: args.fromPage));
    },
    CustomSucessScreenRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<CustomSucessScreenRouterArgs>(
          orElse: () => CustomSucessScreenRouterArgs(
              title: queryParams.optString('title'),
              description: queryParams.optString('description'),
              icon: queryParams.get('icon'),
              buttonTitle: queryParams.optString('buttonTitle'),
              backgroundColor: queryParams.get('backgroundColor'),
              descriptionPadding: queryParams.get('descriptionPadding')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.CustomSucessScreen(
              key: args.key,
              title: args.title,
              description: args.description,
              icon: args.icon,
              onPressedButton: args.onPressedButton,
              buttonTitle: args.buttonTitle,
              backgroundColor: args.backgroundColor,
              descriptionPadding: args.descriptionPadding));
    },
    ConfirmDetailRouter.name: (routeData) {
      final args = routeData.argsAs<ConfirmDetailRouterArgs>(
          orElse: () => const ConfirmDetailRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.DepositeScreen(key: args.key, id: args.id));
    },
    PendingDetailRouter.name: (routeData) {
      final args = routeData.argsAs<PendingDetailRouterArgs>(
          orElse: () => const PendingDetailRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.BulletPaymentDetail(
              key: args.key,
              isAnnullyRate: args.isAnnullyRate,
              productName: args.productName,
              isRenewal: args.isRenewal,
              renewBy: args.renewBy,
              renewDate: args.renewDate,
              renewPeriod: args.renewPeriod,
              oldDate: args.oldDate,
              newDate: args.newDate,
              investDate: args.investDate,
              investDuration: args.investDuration,
              firstPayDate: args.firstPayDate,
              maturityDate: args.maturityDate,
              investAmount: args.investAmount,
              withdrawer: args.withdrawer,
              withdrawAmount: args.withdrawAmount,
              noticeDate: args.noticeDate,
              disbursementDate: args.disbursementDate,
              contractStatus: args.contractStatus,
              isWithdraw: args.isWithdraw,
              isStatusPending: args.isStatusPending,
              id: args.id,
              fiFApplicationDetailModel: args.fiFApplicationDetailModel,
              isNoUSD: args.isNoUSD,
              status: args.status,
              titles: args.titles,
              oncallBack: args.oncallBack,
              annually: args.annually,
              fromPage: args.fromPage));
    },
    ServiceAgreementRouter.name: (routeData) {
      final args = routeData.argsAs<ServiceAgreementRouterArgs>(
          orElse: () => const ServiceAgreementRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.ContractTerm(key: args.key, fromPage: args.fromPage));
    },
    ViewAgreementRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ViewAgreementRouterArgs>(
          orElse: () => ViewAgreementRouterArgs(
              url: queryParams.optString('url'),
              title: queryParams.optString('title'),
              isfromReport: queryParams.optBool('isfromReport', false)));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.ViewWebsite(
              key: args.key,
              url: args.url,
              title: args.title,
              isfromReport: args.isfromReport));
    },
    ViewAgreementListRouter.name: (routeData) {
      final args = routeData.argsAs<ViewAgreementListRouterArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i19.ViewAgreementList(
              key: args.key, listAgreeMent: args.listAgreeMent));
    },
    Step1EquityRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<Step1EquityRouterArgs>(
          orElse: () => Step1EquityRouterArgs(
              id: queryParams.optInt('id', 0),
              step: queryParams.optInt('step')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.Step1Equiry(key: args.key, id: args.id, step: args.step));
    },
    Step2EquityRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Step2EquityRouterArgs>(
          orElse: () => Step2EquityRouterArgs(
              id: pathParams.optInt('id'), step: pathParams.optInt('step')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i21.Step2Equity(key: args.key, id: args.id, step: args.step));
    },
    Step3EquityRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<Step3EquityRouterArgs>(
          orElse: () => Step3EquityRouterArgs(
              id: queryParams.optInt('id'), step: queryParams.optInt('step')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i22.Step3Equity(key: args.key, id: args.id, step: args.step));
    },
    PreviewEquityRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PreviewEquityRouterArgs>(
          orElse: () => PreviewEquityRouterArgs(id: pathParams.optInt('id')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.PreviewEquity(key: args.key, id: args.id));
    },
    Step1DebtRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Step1DebtRouterArgs>(
          orElse: () => Step1DebtRouterArgs(
              id: pathParams.optInt('id', 0), step: pathParams.optInt('step')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i24.Step1Debt(key: args.key, id: args.id, step: args.step));
    },
    Step2DebtRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Step2DebtRouterArgs>(
          orElse: () => Step2DebtRouterArgs(
              id: pathParams.optInt('id', 0), step: pathParams.optInt('step')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i25.Step2Debt(key: args.key, id: args.id, step: args.step));
    },
    Step3DebtRouter.name: (routeData) {
      final args = routeData.argsAs<Step3DebtRouterArgs>(
          orElse: () => const Step3DebtRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i26.Step3Debt(
              key: args.key,
              numberOfStep: args.numberOfStep,
              applicationDetail: args.applicationDetail,
              isDraft: args.isDraft));
    },
    Step4DebtRouter.name: (routeData) {
      final args = routeData.argsAs<Step4DebtRouterArgs>(
          orElse: () => const Step4DebtRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i26.Step3Debt(
              key: args.key,
              numberOfStep: args.numberOfStep,
              applicationDetail: args.applicationDetail,
              isDraft: args.isDraft));
    },
    PreviewDebtRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PreviewDebtRouterArgs>(
          orElse: () => PreviewDebtRouterArgs(id: pathParams.optInt('id')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i27.PreviewDebtForm(key: args.key, id: args.id));
    },
    PrivilegeScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.PrivilegeScreen());
    },
    PrivilegeDetailScreen.name: (routeData) {
      final args = routeData.argsAs<PrivilegeDetailScreenArgs>(
          orElse: () => const PrivilegeDetailScreenArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i29.PrivilegeDetailScreen(
              key: args.key, isColorsHours: args.isColorsHours, id: args.id));
    },
    SearchScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i30.SearchScreen());
    },
    PrivilegeFilters.name: (routeData) {
      final args = routeData.argsAs<PrivilegeFiltersArgs>(
          orElse: () => const PrivilegeFiltersArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i31.PrivilegeFilters(key: args.key, index: args.index));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(Splashscreen.name, path: '/'),
        _i2.RouteConfig(MyInvestmentRouter.name,
            path: '/investment',
            children: [
              _i2.RouteConfig(Dashboard.name,
                  path: '', parent: MyInvestmentRouter.name),
              _i2.RouteConfig(SavingDetailScreenRouter.name,
                  path: 'investment/saving-detail',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(RenewalScreenRouter.name,
                  path: 'investment/saving-detail/renew-contract',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(RenewReviewRouter.name,
                  path: 'investment/saving-detail/renew-contract/renew-review',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(RenewSuccessRouter.name,
                  path:
                      'investment/saving-detail/renew-contract/renew-review/success',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(ContractWithdrawScreenRouter.name,
                  path: 'investment/saving-detail/redemption',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(ReviewWithdrawRouter.name,
                  path: 'investment/saving-detail/redemption/redemption-review',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(RedemptionSuccessRouter.name,
                  path:
                      'investment/saving-detail/redemption/redemption-review/success',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(AboutFiFRouter.name,
                  path: 'investment/about-fif',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(FIFDeucSelectionRouter.name,
                  path: 'investment/fif-select-product',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(ExploreMoreRouter.name,
                  path: 'investment/fif-select-product/explore-more',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(FIFOption1Router.name,
                  path: 'investment/fif-select-product/fif-Application',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(ReviewApplicationRouter.name,
                  path: 'investment/fif-select-product/fif-Application/review',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(CustomSucessScreenRouter.name,
                  path:
                      'investment/fif-select-product/fif-Application/review/success',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(ConfirmDetailRouter.name,
                  path: 'investment/confirm-detail',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(PendingDetailRouter.name,
                  path: 'investment/pending-detail',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(ServiceAgreementRouter.name,
                  path: 'investment/service-agreement',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(ViewAgreementRouter.name,
                  path: 'investment/view-agreement',
                  parent: MyInvestmentRouter.name),
              _i2.RouteConfig(ViewAgreementListRouter.name,
                  path: 'investment/view-agreement-list',
                  parent: MyInvestmentRouter.name)
            ]),
        _i2.RouteConfig(BonusScreen.name, path: '/bonus'),
        _i2.RouteConfig(HomePageRouter.name, path: '/get-funding', children: [
          _i2.RouteConfig(Step1EquityRouter.name,
              path: 'step1equity/:id/:step', parent: HomePageRouter.name),
          _i2.RouteConfig(Step2EquityRouter.name,
              path: 'step2equity/:id/:step', parent: HomePageRouter.name),
          _i2.RouteConfig(Step3EquityRouter.name,
              path: 'step3equity/:id/:step', parent: HomePageRouter.name),
          _i2.RouteConfig(PreviewEquityRouter.name,
              path: 'preview-equity/:id', parent: HomePageRouter.name),
          _i2.RouteConfig(Step1DebtRouter.name,
              path: 'step1debt/:id/:step', parent: HomePageRouter.name),
          _i2.RouteConfig(Step2DebtRouter.name,
              path: 'step2debt/:id/:step', parent: HomePageRouter.name),
          _i2.RouteConfig(Step3DebtRouter.name,
              path: 'step3debt/:id/:step', parent: HomePageRouter.name),
          _i2.RouteConfig(Step4DebtRouter.name,
              path: 'step4debt/:id/:step', parent: HomePageRouter.name),
          _i2.RouteConfig(PreviewDebtRouter.name,
              path: 'preview-debt/:id', parent: HomePageRouter.name)
        ]),
        _i2.RouteConfig(UTtrading.name, path: '/ut-trading'),
        _i2.RouteConfig(Directory.name, path: '/directory'),
        _i2.RouteConfig(Report.name, path: '/report'),
        _i2.RouteConfig(PrivilegeRouter.name, path: '/privilege', children: [
          _i2.RouteConfig(PrivilegeScreen.name,
              path: '', parent: PrivilegeRouter.name),
          _i2.RouteConfig(PrivilegeDetailScreen.name,
              path: 'privilege/:id', parent: PrivilegeRouter.name),
          _i2.RouteConfig(SearchScreen.name,
              path: 'privilege-search', parent: PrivilegeRouter.name),
          _i2.RouteConfig(PrivilegeFilters.name,
              path: 'privilege-filters', parent: PrivilegeRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.Splashscreen]
class Splashscreen extends _i2.PageRouteInfo<void> {
  const Splashscreen() : super(Splashscreen.name, path: '/');

  static const String name = 'Splashscreen';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class MyInvestmentRouter extends _i2.PageRouteInfo<void> {
  const MyInvestmentRouter({List<_i2.PageRouteInfo>? children})
      : super(MyInvestmentRouter.name,
            path: '/investment', initialChildren: children);

  static const String name = 'MyInvestmentRouter';
}

/// generated route for
/// [_i3.BonusScreen]
class BonusScreen extends _i2.PageRouteInfo<void> {
  const BonusScreen() : super(BonusScreen.name, path: '/bonus');

  static const String name = 'BonusScreen';
}

/// generated route for
/// [_i4.HomePage]
class HomePageRouter extends _i2.PageRouteInfo<HomePageRouterArgs> {
  HomePageRouter(
      {_i32.Key? key, bool? isNavigator, List<_i2.PageRouteInfo>? children})
      : super(HomePageRouter.name,
            path: '/get-funding',
            args: HomePageRouterArgs(key: key, isNavigator: isNavigator),
            rawQueryParams: {'isNavigator': isNavigator},
            initialChildren: children);

  static const String name = 'HomePageRouter';
}

class HomePageRouterArgs {
  const HomePageRouterArgs({this.key, this.isNavigator});

  final _i32.Key? key;

  final bool? isNavigator;

  @override
  String toString() {
    return 'HomePageRouterArgs{key: $key, isNavigator: $isNavigator}';
  }
}

/// generated route for
/// [_i5.UTtrading]
class UTtrading extends _i2.PageRouteInfo<void> {
  const UTtrading() : super(UTtrading.name, path: '/ut-trading');

  static const String name = 'UTtrading';
}

/// generated route for
/// [_i6.Directory]
class Directory extends _i2.PageRouteInfo<DirectoryArgs> {
  Directory(
      {_i32.Key? key,
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

  final _i32.Key? key;

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
class Report extends _i2.PageRouteInfo<ReportArgs> {
  Report({_i32.Key? key, bool? isNavigator, int? currentTabIndex})
      : super(Report.name,
            path: '/report',
            args: ReportArgs(
                key: key,
                isNavigator: isNavigator,
                currentTabIndex: currentTabIndex));

  static const String name = 'Report';
}

class ReportArgs {
  const ReportArgs({this.key, this.isNavigator, this.currentTabIndex});

  final _i32.Key? key;

  final bool? isNavigator;

  final int? currentTabIndex;

  @override
  String toString() {
    return 'ReportArgs{key: $key, isNavigator: $isNavigator, currentTabIndex: $currentTabIndex}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PrivilegeRouter extends _i2.PageRouteInfo<void> {
  const PrivilegeRouter({List<_i2.PageRouteInfo>? children})
      : super(PrivilegeRouter.name,
            path: '/privilege', initialChildren: children);

  static const String name = 'PrivilegeRouter';
}

/// generated route for
/// [_i8.Dashboard]
class Dashboard extends _i2.PageRouteInfo<DashboardArgs> {
  Dashboard({_i32.Key? key, bool? isNavigator, String? tabName})
      : super(Dashboard.name,
            path: '',
            args: DashboardArgs(
                key: key, isNavigator: isNavigator, tabName: tabName));

  static const String name = 'Dashboard';
}

class DashboardArgs {
  const DashboardArgs({this.key, this.isNavigator, this.tabName});

  final _i32.Key? key;

  final bool? isNavigator;

  final String? tabName;

  @override
  String toString() {
    return 'DashboardArgs{key: $key, isNavigator: $isNavigator, tabName: $tabName}';
  }
}

/// generated route for
/// [_i9.SavingDetailScreen]
class SavingDetailScreenRouter
    extends _i2.PageRouteInfo<SavingDetailScreenRouterArgs> {
  SavingDetailScreenRouter(
      {_i32.Key? key,
      String? accountName,
      required _i32.EdgeInsets paddings,
      String? code,
      num? id,
      List<_i33.ScheduleModelList>? scheduleModelList,
      bool? hide,
      int? index,
      String? investAmonut,
      String? currentPrincipal,
      String? fromPage})
      : super(SavingDetailScreenRouter.name,
            path: 'investment/saving-detail',
            args: SavingDetailScreenRouterArgs(
                key: key,
                accountName: accountName,
                paddings: paddings,
                code: code,
                id: id,
                scheduleModelList: scheduleModelList,
                hide: hide,
                index: index,
                investAmonut: investAmonut,
                currentPrincipal: currentPrincipal,
                fromPage: fromPage));

  static const String name = 'SavingDetailScreenRouter';
}

class SavingDetailScreenRouterArgs {
  const SavingDetailScreenRouterArgs(
      {this.key,
      this.accountName,
      required this.paddings,
      this.code,
      this.id,
      this.scheduleModelList,
      this.hide,
      this.index,
      this.investAmonut,
      this.currentPrincipal,
      this.fromPage});

  final _i32.Key? key;

  final String? accountName;

  final _i32.EdgeInsets paddings;

  final String? code;

  final num? id;

  final List<_i33.ScheduleModelList>? scheduleModelList;

  final bool? hide;

  final int? index;

  final String? investAmonut;

  final String? currentPrincipal;

  final String? fromPage;

  @override
  String toString() {
    return 'SavingDetailScreenRouterArgs{key: $key, accountName: $accountName, paddings: $paddings, code: $code, id: $id, scheduleModelList: $scheduleModelList, hide: $hide, index: $index, investAmonut: $investAmonut, currentPrincipal: $currentPrincipal, fromPage: $fromPage}';
  }
}

/// generated route for
/// [_i10.RenewalScreen]
class RenewalScreenRouter extends _i2.PageRouteInfo<RenewalScreenRouterArgs> {
  RenewalScreenRouter(
      {_i32.Key? key,
      String? investAmount,
      _i34.FiFApplicationDetailModel? fiFApplicationModel,
      num? id,
      String? interestEarned,
      String? annually,
      String? accountName,
      String? contractCode})
      : super(RenewalScreenRouter.name,
            path: 'investment/saving-detail/renew-contract',
            args: RenewalScreenRouterArgs(
                key: key,
                investAmount: investAmount,
                fiFApplicationModel: fiFApplicationModel,
                id: id,
                interestEarned: interestEarned,
                annually: annually,
                accountName: accountName,
                contractCode: contractCode));

  static const String name = 'RenewalScreenRouter';
}

class RenewalScreenRouterArgs {
  const RenewalScreenRouterArgs(
      {this.key,
      this.investAmount,
      this.fiFApplicationModel,
      this.id,
      this.interestEarned,
      this.annually,
      this.accountName,
      this.contractCode});

  final _i32.Key? key;

  final String? investAmount;

  final _i34.FiFApplicationDetailModel? fiFApplicationModel;

  final num? id;

  final String? interestEarned;

  final String? annually;

  final String? accountName;

  final String? contractCode;

  @override
  String toString() {
    return 'RenewalScreenRouterArgs{key: $key, investAmount: $investAmount, fiFApplicationModel: $fiFApplicationModel, id: $id, interestEarned: $interestEarned, annually: $annually, accountName: $accountName, contractCode: $contractCode}';
  }
}

/// generated route for
/// [_i11.BulletPaymentDetail]
class RenewReviewRouter extends _i2.PageRouteInfo<RenewReviewRouterArgs> {
  RenewReviewRouter(
      {_i32.Key? key,
      bool? isAnnullyRate = false,
      String? productName,
      bool? isRenewal = false,
      String? renewBy,
      String? renewDate,
      String? renewPeriod,
      String? oldDate,
      String? newDate,
      String? investDate,
      num? investDuration,
      String? firstPayDate,
      String? maturityDate,
      String? investAmount,
      String? withdrawer,
      String? withdrawAmount,
      String? noticeDate,
      String? disbursementDate,
      String? contractStatus,
      bool? isWithdraw = false,
      bool? isStatusPending = false,
      num? id,
      _i34.FiFApplicationDetailModel? fiFApplicationDetailModel,
      bool isNoUSD = false,
      String? status,
      String? titles,
      void Function()? oncallBack,
      String? annually,
      String? fromPage})
      : super(RenewReviewRouter.name,
            path: 'investment/saving-detail/renew-contract/renew-review',
            args: RenewReviewRouterArgs(
                key: key,
                isAnnullyRate: isAnnullyRate,
                productName: productName,
                isRenewal: isRenewal,
                renewBy: renewBy,
                renewDate: renewDate,
                renewPeriod: renewPeriod,
                oldDate: oldDate,
                newDate: newDate,
                investDate: investDate,
                investDuration: investDuration,
                firstPayDate: firstPayDate,
                maturityDate: maturityDate,
                investAmount: investAmount,
                withdrawer: withdrawer,
                withdrawAmount: withdrawAmount,
                noticeDate: noticeDate,
                disbursementDate: disbursementDate,
                contractStatus: contractStatus,
                isWithdraw: isWithdraw,
                isStatusPending: isStatusPending,
                id: id,
                fiFApplicationDetailModel: fiFApplicationDetailModel,
                isNoUSD: isNoUSD,
                status: status,
                titles: titles,
                oncallBack: oncallBack,
                annually: annually,
                fromPage: fromPage));

  static const String name = 'RenewReviewRouter';
}

class RenewReviewRouterArgs {
  const RenewReviewRouterArgs(
      {this.key,
      this.isAnnullyRate = false,
      this.productName,
      this.isRenewal = false,
      this.renewBy,
      this.renewDate,
      this.renewPeriod,
      this.oldDate,
      this.newDate,
      this.investDate,
      this.investDuration,
      this.firstPayDate,
      this.maturityDate,
      this.investAmount,
      this.withdrawer,
      this.withdrawAmount,
      this.noticeDate,
      this.disbursementDate,
      this.contractStatus,
      this.isWithdraw = false,
      this.isStatusPending = false,
      this.id,
      this.fiFApplicationDetailModel,
      this.isNoUSD = false,
      this.status,
      this.titles,
      this.oncallBack,
      this.annually,
      this.fromPage});

  final _i32.Key? key;

  final bool? isAnnullyRate;

  final String? productName;

  final bool? isRenewal;

  final String? renewBy;

  final String? renewDate;

  final String? renewPeriod;

  final String? oldDate;

  final String? newDate;

  final String? investDate;

  final num? investDuration;

  final String? firstPayDate;

  final String? maturityDate;

  final String? investAmount;

  final String? withdrawer;

  final String? withdrawAmount;

  final String? noticeDate;

  final String? disbursementDate;

  final String? contractStatus;

  final bool? isWithdraw;

  final bool? isStatusPending;

  final num? id;

  final _i34.FiFApplicationDetailModel? fiFApplicationDetailModel;

  final bool isNoUSD;

  final String? status;

  final String? titles;

  final void Function()? oncallBack;

  final String? annually;

  final String? fromPage;

  @override
  String toString() {
    return 'RenewReviewRouterArgs{key: $key, isAnnullyRate: $isAnnullyRate, productName: $productName, isRenewal: $isRenewal, renewBy: $renewBy, renewDate: $renewDate, renewPeriod: $renewPeriod, oldDate: $oldDate, newDate: $newDate, investDate: $investDate, investDuration: $investDuration, firstPayDate: $firstPayDate, maturityDate: $maturityDate, investAmount: $investAmount, withdrawer: $withdrawer, withdrawAmount: $withdrawAmount, noticeDate: $noticeDate, disbursementDate: $disbursementDate, contractStatus: $contractStatus, isWithdraw: $isWithdraw, isStatusPending: $isStatusPending, id: $id, fiFApplicationDetailModel: $fiFApplicationDetailModel, isNoUSD: $isNoUSD, status: $status, titles: $titles, oncallBack: $oncallBack, annually: $annually, fromPage: $fromPage}';
  }
}

/// generated route for
/// [_i12.CustomSucessScreen]
class RenewSuccessRouter extends _i2.PageRouteInfo<RenewSuccessRouterArgs> {
  RenewSuccessRouter(
      {_i32.Key? key,
      String? title,
      String? description,
      _i32.Widget? icon,
      void Function()? onPressedButton,
      String? buttonTitle,
      _i32.Color? backgroundColor,
      _i32.EdgeInsetsGeometry? descriptionPadding})
      : super(RenewSuccessRouter.name,
            path:
                'investment/saving-detail/renew-contract/renew-review/success',
            args: RenewSuccessRouterArgs(
                key: key,
                title: title,
                description: description,
                icon: icon,
                onPressedButton: onPressedButton,
                buttonTitle: buttonTitle,
                backgroundColor: backgroundColor,
                descriptionPadding: descriptionPadding),
            rawQueryParams: {
              'title': title,
              'description': description,
              'icon': icon,
              'buttonTitle': buttonTitle,
              'backgroundColor': backgroundColor,
              'descriptionPadding': descriptionPadding
            });

  static const String name = 'RenewSuccessRouter';
}

class RenewSuccessRouterArgs {
  const RenewSuccessRouterArgs(
      {this.key,
      this.title,
      this.description,
      this.icon,
      this.onPressedButton,
      this.buttonTitle,
      this.backgroundColor,
      this.descriptionPadding});

  final _i32.Key? key;

  final String? title;

  final String? description;

  final _i32.Widget? icon;

  final void Function()? onPressedButton;

  final String? buttonTitle;

  final _i32.Color? backgroundColor;

  final _i32.EdgeInsetsGeometry? descriptionPadding;

  @override
  String toString() {
    return 'RenewSuccessRouterArgs{key: $key, title: $title, description: $description, icon: $icon, onPressedButton: $onPressedButton, buttonTitle: $buttonTitle, backgroundColor: $backgroundColor, descriptionPadding: $descriptionPadding}';
  }
}

/// generated route for
/// [_i13.ContractWithdrawScreen]
class ContractWithdrawScreenRouter
    extends _i2.PageRouteInfo<ContractWithdrawScreenRouterArgs> {
  ContractWithdrawScreenRouter(
      {_i32.Key? key,
      String? investAmount,
      String? interestEarned,
      num? id,
      String? productName,
      String? contractCode,
      String? accountName})
      : super(ContractWithdrawScreenRouter.name,
            path: 'investment/saving-detail/redemption',
            args: ContractWithdrawScreenRouterArgs(
                key: key,
                investAmount: investAmount,
                interestEarned: interestEarned,
                id: id,
                productName: productName,
                contractCode: contractCode,
                accountName: accountName));

  static const String name = 'ContractWithdrawScreenRouter';
}

class ContractWithdrawScreenRouterArgs {
  const ContractWithdrawScreenRouterArgs(
      {this.key,
      this.investAmount,
      this.interestEarned,
      this.id,
      this.productName,
      this.contractCode,
      this.accountName});

  final _i32.Key? key;

  final String? investAmount;

  final String? interestEarned;

  final num? id;

  final String? productName;

  final String? contractCode;

  final String? accountName;

  @override
  String toString() {
    return 'ContractWithdrawScreenRouterArgs{key: $key, investAmount: $investAmount, interestEarned: $interestEarned, id: $id, productName: $productName, contractCode: $contractCode, accountName: $accountName}';
  }
}

/// generated route for
/// [_i11.BulletPaymentDetail]
class ReviewWithdrawRouter extends _i2.PageRouteInfo<ReviewWithdrawRouterArgs> {
  ReviewWithdrawRouter(
      {_i32.Key? key,
      bool? isAnnullyRate = false,
      String? productName,
      bool? isRenewal = false,
      String? renewBy,
      String? renewDate,
      String? renewPeriod,
      String? oldDate,
      String? newDate,
      String? investDate,
      num? investDuration,
      String? firstPayDate,
      String? maturityDate,
      String? investAmount,
      String? withdrawer,
      String? withdrawAmount,
      String? noticeDate,
      String? disbursementDate,
      String? contractStatus,
      bool? isWithdraw = false,
      bool? isStatusPending = false,
      num? id,
      _i34.FiFApplicationDetailModel? fiFApplicationDetailModel,
      bool isNoUSD = false,
      String? status,
      String? titles,
      void Function()? oncallBack,
      String? annually,
      String? fromPage})
      : super(ReviewWithdrawRouter.name,
            path: 'investment/saving-detail/redemption/redemption-review',
            args: ReviewWithdrawRouterArgs(
                key: key,
                isAnnullyRate: isAnnullyRate,
                productName: productName,
                isRenewal: isRenewal,
                renewBy: renewBy,
                renewDate: renewDate,
                renewPeriod: renewPeriod,
                oldDate: oldDate,
                newDate: newDate,
                investDate: investDate,
                investDuration: investDuration,
                firstPayDate: firstPayDate,
                maturityDate: maturityDate,
                investAmount: investAmount,
                withdrawer: withdrawer,
                withdrawAmount: withdrawAmount,
                noticeDate: noticeDate,
                disbursementDate: disbursementDate,
                contractStatus: contractStatus,
                isWithdraw: isWithdraw,
                isStatusPending: isStatusPending,
                id: id,
                fiFApplicationDetailModel: fiFApplicationDetailModel,
                isNoUSD: isNoUSD,
                status: status,
                titles: titles,
                oncallBack: oncallBack,
                annually: annually,
                fromPage: fromPage));

  static const String name = 'ReviewWithdrawRouter';
}

class ReviewWithdrawRouterArgs {
  const ReviewWithdrawRouterArgs(
      {this.key,
      this.isAnnullyRate = false,
      this.productName,
      this.isRenewal = false,
      this.renewBy,
      this.renewDate,
      this.renewPeriod,
      this.oldDate,
      this.newDate,
      this.investDate,
      this.investDuration,
      this.firstPayDate,
      this.maturityDate,
      this.investAmount,
      this.withdrawer,
      this.withdrawAmount,
      this.noticeDate,
      this.disbursementDate,
      this.contractStatus,
      this.isWithdraw = false,
      this.isStatusPending = false,
      this.id,
      this.fiFApplicationDetailModel,
      this.isNoUSD = false,
      this.status,
      this.titles,
      this.oncallBack,
      this.annually,
      this.fromPage});

  final _i32.Key? key;

  final bool? isAnnullyRate;

  final String? productName;

  final bool? isRenewal;

  final String? renewBy;

  final String? renewDate;

  final String? renewPeriod;

  final String? oldDate;

  final String? newDate;

  final String? investDate;

  final num? investDuration;

  final String? firstPayDate;

  final String? maturityDate;

  final String? investAmount;

  final String? withdrawer;

  final String? withdrawAmount;

  final String? noticeDate;

  final String? disbursementDate;

  final String? contractStatus;

  final bool? isWithdraw;

  final bool? isStatusPending;

  final num? id;

  final _i34.FiFApplicationDetailModel? fiFApplicationDetailModel;

  final bool isNoUSD;

  final String? status;

  final String? titles;

  final void Function()? oncallBack;

  final String? annually;

  final String? fromPage;

  @override
  String toString() {
    return 'ReviewWithdrawRouterArgs{key: $key, isAnnullyRate: $isAnnullyRate, productName: $productName, isRenewal: $isRenewal, renewBy: $renewBy, renewDate: $renewDate, renewPeriod: $renewPeriod, oldDate: $oldDate, newDate: $newDate, investDate: $investDate, investDuration: $investDuration, firstPayDate: $firstPayDate, maturityDate: $maturityDate, investAmount: $investAmount, withdrawer: $withdrawer, withdrawAmount: $withdrawAmount, noticeDate: $noticeDate, disbursementDate: $disbursementDate, contractStatus: $contractStatus, isWithdraw: $isWithdraw, isStatusPending: $isStatusPending, id: $id, fiFApplicationDetailModel: $fiFApplicationDetailModel, isNoUSD: $isNoUSD, status: $status, titles: $titles, oncallBack: $oncallBack, annually: $annually, fromPage: $fromPage}';
  }
}

/// generated route for
/// [_i12.CustomSucessScreen]
class RedemptionSuccessRouter
    extends _i2.PageRouteInfo<RedemptionSuccessRouterArgs> {
  RedemptionSuccessRouter(
      {_i32.Key? key,
      String? title,
      String? description,
      _i32.Widget? icon,
      void Function()? onPressedButton,
      String? buttonTitle,
      _i32.Color? backgroundColor,
      _i32.EdgeInsetsGeometry? descriptionPadding})
      : super(RedemptionSuccessRouter.name,
            path:
                'investment/saving-detail/redemption/redemption-review/success',
            args: RedemptionSuccessRouterArgs(
                key: key,
                title: title,
                description: description,
                icon: icon,
                onPressedButton: onPressedButton,
                buttonTitle: buttonTitle,
                backgroundColor: backgroundColor,
                descriptionPadding: descriptionPadding),
            rawQueryParams: {
              'title': title,
              'description': description,
              'icon': icon,
              'buttonTitle': buttonTitle,
              'backgroundColor': backgroundColor,
              'descriptionPadding': descriptionPadding
            });

  static const String name = 'RedemptionSuccessRouter';
}

class RedemptionSuccessRouterArgs {
  const RedemptionSuccessRouterArgs(
      {this.key,
      this.title,
      this.description,
      this.icon,
      this.onPressedButton,
      this.buttonTitle,
      this.backgroundColor,
      this.descriptionPadding});

  final _i32.Key? key;

  final String? title;

  final String? description;

  final _i32.Widget? icon;

  final void Function()? onPressedButton;

  final String? buttonTitle;

  final _i32.Color? backgroundColor;

  final _i32.EdgeInsetsGeometry? descriptionPadding;

  @override
  String toString() {
    return 'RedemptionSuccessRouterArgs{key: $key, title: $title, description: $description, icon: $icon, onPressedButton: $onPressedButton, buttonTitle: $buttonTitle, backgroundColor: $backgroundColor, descriptionPadding: $descriptionPadding}';
  }
}

/// generated route for
/// [_i14.ViewWebsite]
class AboutFiFRouter extends _i2.PageRouteInfo<AboutFiFRouterArgs> {
  AboutFiFRouter(
      {_i32.Key? key, String? url, String? title, bool? isfromReport = false})
      : super(AboutFiFRouter.name,
            path: 'investment/about-fif',
            args: AboutFiFRouterArgs(
                key: key, url: url, title: title, isfromReport: isfromReport),
            rawQueryParams: {
              'url': url,
              'title': title,
              'isfromReport': isfromReport
            });

  static const String name = 'AboutFiFRouter';
}

class AboutFiFRouterArgs {
  const AboutFiFRouterArgs(
      {this.key, this.url, this.title, this.isfromReport = false});

  final _i32.Key? key;

  final String? url;

  final String? title;

  final bool? isfromReport;

  @override
  String toString() {
    return 'AboutFiFRouterArgs{key: $key, url: $url, title: $title, isfromReport: $isfromReport}';
  }
}

/// generated route for
/// [_i15.FIFDeucSelection]
class FIFDeucSelectionRouter
    extends _i2.PageRouteInfo<FIFDeucSelectionRouterArgs> {
  FIFDeucSelectionRouter({_i32.Key? key, int? id})
      : super(FIFDeucSelectionRouter.name,
            path: 'investment/fif-select-product',
            args: FIFDeucSelectionRouterArgs(key: key, id: id));

  static const String name = 'FIFDeucSelectionRouter';
}

class FIFDeucSelectionRouterArgs {
  const FIFDeucSelectionRouterArgs({this.key, this.id});

  final _i32.Key? key;

  final int? id;

  @override
  String toString() {
    return 'FIFDeucSelectionRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i14.ViewWebsite]
class ExploreMoreRouter extends _i2.PageRouteInfo<ExploreMoreRouterArgs> {
  ExploreMoreRouter(
      {_i32.Key? key, String? url, String? title, bool? isfromReport = false})
      : super(ExploreMoreRouter.name,
            path: 'investment/fif-select-product/explore-more',
            args: ExploreMoreRouterArgs(
                key: key, url: url, title: title, isfromReport: isfromReport),
            rawQueryParams: {
              'url': url,
              'title': title,
              'isfromReport': isfromReport
            });

  static const String name = 'ExploreMoreRouter';
}

class ExploreMoreRouterArgs {
  const ExploreMoreRouterArgs(
      {this.key, this.url, this.title, this.isfromReport = false});

  final _i32.Key? key;

  final String? url;

  final String? title;

  final bool? isfromReport;

  @override
  String toString() {
    return 'ExploreMoreRouterArgs{key: $key, url: $url, title: $title, isfromReport: $isfromReport}';
  }
}

/// generated route for
/// [_i16.FIFOption1]
class FIFOption1Router extends _i2.PageRouteInfo<FIFOption1RouterArgs> {
  FIFOption1Router(
      {_i32.Key? key,
      _i35.PaymentDate? paymentDate,
      int? id = 0,
      List<_i36.FIFoptionModel>? options})
      : super(FIFOption1Router.name,
            path: 'investment/fif-select-product/fif-Application',
            args: FIFOption1RouterArgs(
                key: key, paymentDate: paymentDate, id: id, options: options));

  static const String name = 'FIFOption1Router';
}

class FIFOption1RouterArgs {
  const FIFOption1RouterArgs(
      {this.key, this.paymentDate, this.id = 0, this.options});

  final _i32.Key? key;

  final _i35.PaymentDate? paymentDate;

  final int? id;

  final List<_i36.FIFoptionModel>? options;

  @override
  String toString() {
    return 'FIFOption1RouterArgs{key: $key, paymentDate: $paymentDate, id: $id, options: $options}';
  }
}

/// generated route for
/// [_i11.BulletPaymentDetail]
class ReviewApplicationRouter
    extends _i2.PageRouteInfo<ReviewApplicationRouterArgs> {
  ReviewApplicationRouter(
      {_i32.Key? key,
      bool? isAnnullyRate = false,
      String? productName,
      bool? isRenewal = false,
      String? renewBy,
      String? renewDate,
      String? renewPeriod,
      String? oldDate,
      String? newDate,
      String? investDate,
      num? investDuration,
      String? firstPayDate,
      String? maturityDate,
      String? investAmount,
      String? withdrawer,
      String? withdrawAmount,
      String? noticeDate,
      String? disbursementDate,
      String? contractStatus,
      bool? isWithdraw = false,
      bool? isStatusPending = false,
      num? id,
      _i34.FiFApplicationDetailModel? fiFApplicationDetailModel,
      bool isNoUSD = false,
      String? status,
      String? titles,
      void Function()? oncallBack,
      String? annually,
      String? fromPage})
      : super(ReviewApplicationRouter.name,
            path: 'investment/fif-select-product/fif-Application/review',
            args: ReviewApplicationRouterArgs(
                key: key,
                isAnnullyRate: isAnnullyRate,
                productName: productName,
                isRenewal: isRenewal,
                renewBy: renewBy,
                renewDate: renewDate,
                renewPeriod: renewPeriod,
                oldDate: oldDate,
                newDate: newDate,
                investDate: investDate,
                investDuration: investDuration,
                firstPayDate: firstPayDate,
                maturityDate: maturityDate,
                investAmount: investAmount,
                withdrawer: withdrawer,
                withdrawAmount: withdrawAmount,
                noticeDate: noticeDate,
                disbursementDate: disbursementDate,
                contractStatus: contractStatus,
                isWithdraw: isWithdraw,
                isStatusPending: isStatusPending,
                id: id,
                fiFApplicationDetailModel: fiFApplicationDetailModel,
                isNoUSD: isNoUSD,
                status: status,
                titles: titles,
                oncallBack: oncallBack,
                annually: annually,
                fromPage: fromPage));

  static const String name = 'ReviewApplicationRouter';
}

class ReviewApplicationRouterArgs {
  const ReviewApplicationRouterArgs(
      {this.key,
      this.isAnnullyRate = false,
      this.productName,
      this.isRenewal = false,
      this.renewBy,
      this.renewDate,
      this.renewPeriod,
      this.oldDate,
      this.newDate,
      this.investDate,
      this.investDuration,
      this.firstPayDate,
      this.maturityDate,
      this.investAmount,
      this.withdrawer,
      this.withdrawAmount,
      this.noticeDate,
      this.disbursementDate,
      this.contractStatus,
      this.isWithdraw = false,
      this.isStatusPending = false,
      this.id,
      this.fiFApplicationDetailModel,
      this.isNoUSD = false,
      this.status,
      this.titles,
      this.oncallBack,
      this.annually,
      this.fromPage});

  final _i32.Key? key;

  final bool? isAnnullyRate;

  final String? productName;

  final bool? isRenewal;

  final String? renewBy;

  final String? renewDate;

  final String? renewPeriod;

  final String? oldDate;

  final String? newDate;

  final String? investDate;

  final num? investDuration;

  final String? firstPayDate;

  final String? maturityDate;

  final String? investAmount;

  final String? withdrawer;

  final String? withdrawAmount;

  final String? noticeDate;

  final String? disbursementDate;

  final String? contractStatus;

  final bool? isWithdraw;

  final bool? isStatusPending;

  final num? id;

  final _i34.FiFApplicationDetailModel? fiFApplicationDetailModel;

  final bool isNoUSD;

  final String? status;

  final String? titles;

  final void Function()? oncallBack;

  final String? annually;

  final String? fromPage;

  @override
  String toString() {
    return 'ReviewApplicationRouterArgs{key: $key, isAnnullyRate: $isAnnullyRate, productName: $productName, isRenewal: $isRenewal, renewBy: $renewBy, renewDate: $renewDate, renewPeriod: $renewPeriod, oldDate: $oldDate, newDate: $newDate, investDate: $investDate, investDuration: $investDuration, firstPayDate: $firstPayDate, maturityDate: $maturityDate, investAmount: $investAmount, withdrawer: $withdrawer, withdrawAmount: $withdrawAmount, noticeDate: $noticeDate, disbursementDate: $disbursementDate, contractStatus: $contractStatus, isWithdraw: $isWithdraw, isStatusPending: $isStatusPending, id: $id, fiFApplicationDetailModel: $fiFApplicationDetailModel, isNoUSD: $isNoUSD, status: $status, titles: $titles, oncallBack: $oncallBack, annually: $annually, fromPage: $fromPage}';
  }
}

/// generated route for
/// [_i12.CustomSucessScreen]
class CustomSucessScreenRouter
    extends _i2.PageRouteInfo<CustomSucessScreenRouterArgs> {
  CustomSucessScreenRouter(
      {_i32.Key? key,
      String? title,
      String? description,
      _i32.Widget? icon,
      void Function()? onPressedButton,
      String? buttonTitle,
      _i32.Color? backgroundColor,
      _i32.EdgeInsetsGeometry? descriptionPadding})
      : super(CustomSucessScreenRouter.name,
            path:
                'investment/fif-select-product/fif-Application/review/success',
            args: CustomSucessScreenRouterArgs(
                key: key,
                title: title,
                description: description,
                icon: icon,
                onPressedButton: onPressedButton,
                buttonTitle: buttonTitle,
                backgroundColor: backgroundColor,
                descriptionPadding: descriptionPadding),
            rawQueryParams: {
              'title': title,
              'description': description,
              'icon': icon,
              'buttonTitle': buttonTitle,
              'backgroundColor': backgroundColor,
              'descriptionPadding': descriptionPadding
            });

  static const String name = 'CustomSucessScreenRouter';
}

class CustomSucessScreenRouterArgs {
  const CustomSucessScreenRouterArgs(
      {this.key,
      this.title,
      this.description,
      this.icon,
      this.onPressedButton,
      this.buttonTitle,
      this.backgroundColor,
      this.descriptionPadding});

  final _i32.Key? key;

  final String? title;

  final String? description;

  final _i32.Widget? icon;

  final void Function()? onPressedButton;

  final String? buttonTitle;

  final _i32.Color? backgroundColor;

  final _i32.EdgeInsetsGeometry? descriptionPadding;

  @override
  String toString() {
    return 'CustomSucessScreenRouterArgs{key: $key, title: $title, description: $description, icon: $icon, onPressedButton: $onPressedButton, buttonTitle: $buttonTitle, backgroundColor: $backgroundColor, descriptionPadding: $descriptionPadding}';
  }
}

/// generated route for
/// [_i17.DepositeScreen]
class ConfirmDetailRouter extends _i2.PageRouteInfo<ConfirmDetailRouterArgs> {
  ConfirmDetailRouter({_i32.Key? key, int? id})
      : super(ConfirmDetailRouter.name,
            path: 'investment/confirm-detail',
            args: ConfirmDetailRouterArgs(key: key, id: id));

  static const String name = 'ConfirmDetailRouter';
}

class ConfirmDetailRouterArgs {
  const ConfirmDetailRouterArgs({this.key, this.id});

  final _i32.Key? key;

  final int? id;

  @override
  String toString() {
    return 'ConfirmDetailRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i11.BulletPaymentDetail]
class PendingDetailRouter extends _i2.PageRouteInfo<PendingDetailRouterArgs> {
  PendingDetailRouter(
      {_i32.Key? key,
      bool? isAnnullyRate = false,
      String? productName,
      bool? isRenewal = false,
      String? renewBy,
      String? renewDate,
      String? renewPeriod,
      String? oldDate,
      String? newDate,
      String? investDate,
      num? investDuration,
      String? firstPayDate,
      String? maturityDate,
      String? investAmount,
      String? withdrawer,
      String? withdrawAmount,
      String? noticeDate,
      String? disbursementDate,
      String? contractStatus,
      bool? isWithdraw = false,
      bool? isStatusPending = false,
      num? id,
      _i34.FiFApplicationDetailModel? fiFApplicationDetailModel,
      bool isNoUSD = false,
      String? status,
      String? titles,
      void Function()? oncallBack,
      String? annually,
      String? fromPage})
      : super(PendingDetailRouter.name,
            path: 'investment/pending-detail',
            args: PendingDetailRouterArgs(
                key: key,
                isAnnullyRate: isAnnullyRate,
                productName: productName,
                isRenewal: isRenewal,
                renewBy: renewBy,
                renewDate: renewDate,
                renewPeriod: renewPeriod,
                oldDate: oldDate,
                newDate: newDate,
                investDate: investDate,
                investDuration: investDuration,
                firstPayDate: firstPayDate,
                maturityDate: maturityDate,
                investAmount: investAmount,
                withdrawer: withdrawer,
                withdrawAmount: withdrawAmount,
                noticeDate: noticeDate,
                disbursementDate: disbursementDate,
                contractStatus: contractStatus,
                isWithdraw: isWithdraw,
                isStatusPending: isStatusPending,
                id: id,
                fiFApplicationDetailModel: fiFApplicationDetailModel,
                isNoUSD: isNoUSD,
                status: status,
                titles: titles,
                oncallBack: oncallBack,
                annually: annually,
                fromPage: fromPage));

  static const String name = 'PendingDetailRouter';
}

class PendingDetailRouterArgs {
  const PendingDetailRouterArgs(
      {this.key,
      this.isAnnullyRate = false,
      this.productName,
      this.isRenewal = false,
      this.renewBy,
      this.renewDate,
      this.renewPeriod,
      this.oldDate,
      this.newDate,
      this.investDate,
      this.investDuration,
      this.firstPayDate,
      this.maturityDate,
      this.investAmount,
      this.withdrawer,
      this.withdrawAmount,
      this.noticeDate,
      this.disbursementDate,
      this.contractStatus,
      this.isWithdraw = false,
      this.isStatusPending = false,
      this.id,
      this.fiFApplicationDetailModel,
      this.isNoUSD = false,
      this.status,
      this.titles,
      this.oncallBack,
      this.annually,
      this.fromPage});

  final _i32.Key? key;

  final bool? isAnnullyRate;

  final String? productName;

  final bool? isRenewal;

  final String? renewBy;

  final String? renewDate;

  final String? renewPeriod;

  final String? oldDate;

  final String? newDate;

  final String? investDate;

  final num? investDuration;

  final String? firstPayDate;

  final String? maturityDate;

  final String? investAmount;

  final String? withdrawer;

  final String? withdrawAmount;

  final String? noticeDate;

  final String? disbursementDate;

  final String? contractStatus;

  final bool? isWithdraw;

  final bool? isStatusPending;

  final num? id;

  final _i34.FiFApplicationDetailModel? fiFApplicationDetailModel;

  final bool isNoUSD;

  final String? status;

  final String? titles;

  final void Function()? oncallBack;

  final String? annually;

  final String? fromPage;

  @override
  String toString() {
    return 'PendingDetailRouterArgs{key: $key, isAnnullyRate: $isAnnullyRate, productName: $productName, isRenewal: $isRenewal, renewBy: $renewBy, renewDate: $renewDate, renewPeriod: $renewPeriod, oldDate: $oldDate, newDate: $newDate, investDate: $investDate, investDuration: $investDuration, firstPayDate: $firstPayDate, maturityDate: $maturityDate, investAmount: $investAmount, withdrawer: $withdrawer, withdrawAmount: $withdrawAmount, noticeDate: $noticeDate, disbursementDate: $disbursementDate, contractStatus: $contractStatus, isWithdraw: $isWithdraw, isStatusPending: $isStatusPending, id: $id, fiFApplicationDetailModel: $fiFApplicationDetailModel, isNoUSD: $isNoUSD, status: $status, titles: $titles, oncallBack: $oncallBack, annually: $annually, fromPage: $fromPage}';
  }
}

/// generated route for
/// [_i18.ContractTerm]
class ServiceAgreementRouter
    extends _i2.PageRouteInfo<ServiceAgreementRouterArgs> {
  ServiceAgreementRouter({_i32.Key? key, String? fromPage})
      : super(ServiceAgreementRouter.name,
            path: 'investment/service-agreement',
            args: ServiceAgreementRouterArgs(key: key, fromPage: fromPage));

  static const String name = 'ServiceAgreementRouter';
}

class ServiceAgreementRouterArgs {
  const ServiceAgreementRouterArgs({this.key, this.fromPage});

  final _i32.Key? key;

  final String? fromPage;

  @override
  String toString() {
    return 'ServiceAgreementRouterArgs{key: $key, fromPage: $fromPage}';
  }
}

/// generated route for
/// [_i14.ViewWebsite]
class ViewAgreementRouter extends _i2.PageRouteInfo<ViewAgreementRouterArgs> {
  ViewAgreementRouter(
      {_i32.Key? key, String? url, String? title, bool? isfromReport = false})
      : super(ViewAgreementRouter.name,
            path: 'investment/view-agreement',
            args: ViewAgreementRouterArgs(
                key: key, url: url, title: title, isfromReport: isfromReport),
            rawQueryParams: {
              'url': url,
              'title': title,
              'isfromReport': isfromReport
            });

  static const String name = 'ViewAgreementRouter';
}

class ViewAgreementRouterArgs {
  const ViewAgreementRouterArgs(
      {this.key, this.url, this.title, this.isfromReport = false});

  final _i32.Key? key;

  final String? url;

  final String? title;

  final bool? isfromReport;

  @override
  String toString() {
    return 'ViewAgreementRouterArgs{key: $key, url: $url, title: $title, isfromReport: $isfromReport}';
  }
}

/// generated route for
/// [_i19.ViewAgreementList]
class ViewAgreementListRouter
    extends _i2.PageRouteInfo<ViewAgreementListRouterArgs> {
  ViewAgreementListRouter(
      {_i32.Key? key, required List<_i37.ViewAgreement> listAgreeMent})
      : super(ViewAgreementListRouter.name,
            path: 'investment/view-agreement-list',
            args: ViewAgreementListRouterArgs(
                key: key, listAgreeMent: listAgreeMent));

  static const String name = 'ViewAgreementListRouter';
}

class ViewAgreementListRouterArgs {
  const ViewAgreementListRouterArgs({this.key, required this.listAgreeMent});

  final _i32.Key? key;

  final List<_i37.ViewAgreement> listAgreeMent;

  @override
  String toString() {
    return 'ViewAgreementListRouterArgs{key: $key, listAgreeMent: $listAgreeMent}';
  }
}

/// generated route for
/// [_i20.Step1Equiry]
class Step1EquityRouter extends _i2.PageRouteInfo<Step1EquityRouterArgs> {
  Step1EquityRouter({_i32.Key? key, int? id = 0, int? step})
      : super(Step1EquityRouter.name,
            path: 'step1equity/:id/:step',
            args: Step1EquityRouterArgs(key: key, id: id, step: step),
            rawQueryParams: {'id': id, 'step': step});

  static const String name = 'Step1EquityRouter';
}

class Step1EquityRouterArgs {
  const Step1EquityRouterArgs({this.key, this.id = 0, this.step});

  final _i32.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step1EquityRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i21.Step2Equity]
class Step2EquityRouter extends _i2.PageRouteInfo<Step2EquityRouterArgs> {
  Step2EquityRouter({_i32.Key? key, int? id, int? step})
      : super(Step2EquityRouter.name,
            path: 'step2equity/:id/:step',
            args: Step2EquityRouterArgs(key: key, id: id, step: step),
            rawPathParams: {'id': id, 'step': step});

  static const String name = 'Step2EquityRouter';
}

class Step2EquityRouterArgs {
  const Step2EquityRouterArgs({this.key, this.id, this.step});

  final _i32.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step2EquityRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i22.Step3Equity]
class Step3EquityRouter extends _i2.PageRouteInfo<Step3EquityRouterArgs> {
  Step3EquityRouter({_i32.Key? key, int? id, int? step})
      : super(Step3EquityRouter.name,
            path: 'step3equity/:id/:step',
            args: Step3EquityRouterArgs(key: key, id: id, step: step),
            rawQueryParams: {'id': id, 'step': step});

  static const String name = 'Step3EquityRouter';
}

class Step3EquityRouterArgs {
  const Step3EquityRouterArgs({this.key, this.id, this.step});

  final _i32.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step3EquityRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i23.PreviewEquity]
class PreviewEquityRouter extends _i2.PageRouteInfo<PreviewEquityRouterArgs> {
  PreviewEquityRouter({_i32.Key? key, int? id})
      : super(PreviewEquityRouter.name,
            path: 'preview-equity/:id',
            args: PreviewEquityRouterArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'PreviewEquityRouter';
}

class PreviewEquityRouterArgs {
  const PreviewEquityRouterArgs({this.key, this.id});

  final _i32.Key? key;

  final int? id;

  @override
  String toString() {
    return 'PreviewEquityRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i24.Step1Debt]
class Step1DebtRouter extends _i2.PageRouteInfo<Step1DebtRouterArgs> {
  Step1DebtRouter({_i32.Key? key, int? id = 0, int? step})
      : super(Step1DebtRouter.name,
            path: 'step1debt/:id/:step',
            args: Step1DebtRouterArgs(key: key, id: id, step: step),
            rawPathParams: {'id': id, 'step': step});

  static const String name = 'Step1DebtRouter';
}

class Step1DebtRouterArgs {
  const Step1DebtRouterArgs({this.key, this.id = 0, this.step});

  final _i32.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step1DebtRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i25.Step2Debt]
class Step2DebtRouter extends _i2.PageRouteInfo<Step2DebtRouterArgs> {
  Step2DebtRouter({_i32.Key? key, int? id = 0, int? step})
      : super(Step2DebtRouter.name,
            path: 'step2debt/:id/:step',
            args: Step2DebtRouterArgs(key: key, id: id, step: step),
            rawPathParams: {'id': id, 'step': step});

  static const String name = 'Step2DebtRouter';
}

class Step2DebtRouterArgs {
  const Step2DebtRouterArgs({this.key, this.id = 0, this.step});

  final _i32.Key? key;

  final int? id;

  final int? step;

  @override
  String toString() {
    return 'Step2DebtRouterArgs{key: $key, id: $id, step: $step}';
  }
}

/// generated route for
/// [_i26.Step3Debt]
class Step3DebtRouter extends _i2.PageRouteInfo<Step3DebtRouterArgs> {
  Step3DebtRouter(
      {_i32.Key? key,
      int? numberOfStep,
      _i38.ApplicationData? applicationDetail,
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

  final _i32.Key? key;

  final int? numberOfStep;

  final _i38.ApplicationData? applicationDetail;

  final String? isDraft;

  @override
  String toString() {
    return 'Step3DebtRouterArgs{key: $key, numberOfStep: $numberOfStep, applicationDetail: $applicationDetail, isDraft: $isDraft}';
  }
}

/// generated route for
/// [_i26.Step3Debt]
class Step4DebtRouter extends _i2.PageRouteInfo<Step4DebtRouterArgs> {
  Step4DebtRouter(
      {_i32.Key? key,
      int? numberOfStep,
      _i38.ApplicationData? applicationDetail,
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

  final _i32.Key? key;

  final int? numberOfStep;

  final _i38.ApplicationData? applicationDetail;

  final String? isDraft;

  @override
  String toString() {
    return 'Step4DebtRouterArgs{key: $key, numberOfStep: $numberOfStep, applicationDetail: $applicationDetail, isDraft: $isDraft}';
  }
}

/// generated route for
/// [_i27.PreviewDebtForm]
class PreviewDebtRouter extends _i2.PageRouteInfo<PreviewDebtRouterArgs> {
  PreviewDebtRouter({_i32.Key? key, int? id})
      : super(PreviewDebtRouter.name,
            path: 'preview-debt/:id',
            args: PreviewDebtRouterArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'PreviewDebtRouter';
}

class PreviewDebtRouterArgs {
  const PreviewDebtRouterArgs({this.key, this.id});

  final _i32.Key? key;

  final int? id;

  @override
  String toString() {
    return 'PreviewDebtRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i28.PrivilegeScreen]
class PrivilegeScreen extends _i2.PageRouteInfo<void> {
  const PrivilegeScreen() : super(PrivilegeScreen.name, path: '');

  static const String name = 'PrivilegeScreen';
}

/// generated route for
/// [_i29.PrivilegeDetailScreen]
class PrivilegeDetailScreen
    extends _i2.PageRouteInfo<PrivilegeDetailScreenArgs> {
  PrivilegeDetailScreen({_i32.Key? key, bool? isColorsHours = false, num? id})
      : super(PrivilegeDetailScreen.name,
            path: 'privilege/:id',
            args: PrivilegeDetailScreenArgs(
                key: key, isColorsHours: isColorsHours, id: id));

  static const String name = 'PrivilegeDetailScreen';
}

class PrivilegeDetailScreenArgs {
  const PrivilegeDetailScreenArgs(
      {this.key, this.isColorsHours = false, this.id});

  final _i32.Key? key;

  final bool? isColorsHours;

  final num? id;

  @override
  String toString() {
    return 'PrivilegeDetailScreenArgs{key: $key, isColorsHours: $isColorsHours, id: $id}';
  }
}

/// generated route for
/// [_i30.SearchScreen]
class SearchScreen extends _i2.PageRouteInfo<void> {
  const SearchScreen() : super(SearchScreen.name, path: 'privilege-search');

  static const String name = 'SearchScreen';
}

/// generated route for
/// [_i31.PrivilegeFilters]
class PrivilegeFilters extends _i2.PageRouteInfo<PrivilegeFiltersArgs> {
  PrivilegeFilters({_i32.Key? key, int? index})
      : super(PrivilegeFilters.name,
            path: 'privilege-filters',
            args: PrivilegeFiltersArgs(key: key, index: index));

  static const String name = 'PrivilegeFilters';
}

class PrivilegeFiltersArgs {
  const PrivilegeFiltersArgs({this.key, this.index});

  final _i32.Key? key;

  final int? index;

  @override
  String toString() {
    return 'PrivilegeFiltersArgs{key: $key, index: $index}';
  }
}
