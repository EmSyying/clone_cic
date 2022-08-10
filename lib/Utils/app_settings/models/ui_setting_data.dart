import 'package:cicgreenloan/Utils/app_settings/models/ui_setting.dart';

class UIData {
  UISetting? marketSession;
  UISetting? waring;
  UISetting? qR;
  UISetting? label1;
  UISetting? investment;
  UISetting? getFunding;
  UISetting? utTrading;
  UISetting? directory;
  UISetting? marketPlace;
  UISetting? event;
  UISetting? learning;
  UISetting? report;
  UISetting? aboutCic;
  UISetting? recentDocument;
  UISetting? test001;
  UISetting? availableBalance;
  UISetting? utSummary;
  UISetting? totalGain;
  UISetting? capitalGain;
  UISetting? dividend;
  UISetting? paymentSummary;
  UISetting? upaidUt;
  UISetting? paymentInformation;
  UISetting? confirmBankingInformation;
  UISetting? confirmPaymentInformation;
  UISetting? returnOnInvestment;

  UIData(
      {this.marketSession,
      this.waring,
      this.qR,
      this.label1,
      this.investment,
      this.getFunding,
      this.utTrading,
      this.directory,
      this.marketPlace,
      this.event,
      this.learning,
      this.report,
      this.aboutCic,
      this.recentDocument,
      this.test001,
      this.availableBalance,
      this.utSummary,
      this.totalGain,
      this.capitalGain,
      this.dividend,
      this.paymentSummary,
      this.upaidUt,
      this.paymentInformation,
      this.confirmBankingInformation,
      this.confirmPaymentInformation,
      this.returnOnInvestment});

  UIData.fromJson(Map<String, dynamic> json) {
    marketSession = json['market_session'] != null
        ? UISetting.fromJson(json['market_session'])
        : null;
    waring = json['waring'] != null ? UISetting.fromJson(json['waring']) : null;
    qR = json['QR'] != null ? UISetting.fromJson(json['QR']) : null;
    label1 =
        json['Label 1'] != null ? UISetting.fromJson(json['Label 1']) : null;
    investment = json['investment'] != null
        ? UISetting.fromJson(json['investment'])
        : null;
    getFunding = json['get_funding'] != null
        ? UISetting.fromJson(json['get_funding'])
        : null;
    utTrading = json['ut_trading'] != null
        ? UISetting.fromJson(json['ut_trading'])
        : null;
    directory = json['directory'] != null
        ? UISetting.fromJson(json['directory'])
        : null;
    marketPlace = json['market_place'] != null
        ? UISetting.fromJson(json['market_place'])
        : null;
    event = json['event'] != null ? UISetting.fromJson(json['event']) : null;
    learning =
        json['learning'] != null ? UISetting.fromJson(json['learning']) : null;
    report = json['report'] != null ? UISetting.fromJson(json['report']) : null;
    aboutCic = json['about_cic'] != null
        ? UISetting.fromJson(json['about_cic'])
        : null;
    recentDocument = json['recent_document'] != null
        ? UISetting.fromJson(json['recent_document'])
        : null;
    test001 =
        json['Test001'] != null ? UISetting.fromJson(json['Test001']) : null;
    availableBalance = json['available_balance'] != null
        ? UISetting.fromJson(json['available_balance'])
        : null;
    utSummary = json['ut_summary'] != null
        ? UISetting.fromJson(json['ut_summary'])
        : null;
    totalGain = json['total_gain'] != null
        ? UISetting.fromJson(json['total_gain'])
        : null;
    capitalGain = json['capital_gain'] != null
        ? UISetting.fromJson(json['capital_gain'])
        : null;
    dividend =
        json['dividend'] != null ? UISetting.fromJson(json['dividend']) : null;
    paymentSummary = json['payment_summary'] != null
        ? UISetting.fromJson(json['payment_summary'])
        : null;
    upaidUt =
        json['upaid_ut'] != null ? UISetting.fromJson(json['upaid_ut']) : null;
    paymentInformation = json['payment_info'] != null
        ? UISetting.fromJson(json['payment_info'])
        : null;
    confirmBankingInformation = json['confirm_banking_info'] != null
        ? UISetting.fromJson(json['confirm_banking_info'])
        : null;
    confirmPaymentInformation = json['confirm_payment_information'] != null
        ? UISetting.fromJson(json['confirm_payment_information'])
        : null;
    returnOnInvestment = json['return_on_investment'] != null
        ? UISetting.fromJson(json['return_on_investment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (marketSession != null) {
      data['market_session'] = marketSession!.toJson();
    }
    if (waring != null) {
      data['waring'] = waring!.toJson();
    }
    if (qR != null) {
      data['QR'] = qR!.toJson();
    }
    if (label1 != null) {
      data['Label 1'] = label1!.toJson();
    }
    if (investment != null) {
      data['investment'] = investment!.toJson();
    }
    if (getFunding != null) {
      data['get_funding'] = getFunding!.toJson();
    }
    if (utTrading != null) {
      data['ut_trading'] = utTrading!.toJson();
    }
    if (directory != null) {
      data['directory'] = directory!.toJson();
    }
    if (marketPlace != null) {
      data['market_place'] = marketPlace!.toJson();
    }
    if (event != null) {
      data['event'] = event!.toJson();
    }
    if (learning != null) {
      data['learning'] = learning!.toJson();
    }
    if (report != null) {
      data['report'] = report!.toJson();
    }
    if (aboutCic != null) {
      data['about_cic'] = aboutCic!.toJson();
    }
    if (recentDocument != null) {
      data['recent_document'] = recentDocument!.toJson();
    }
    if (test001 != null) {
      data['Test001'] = test001!.toJson();
    }
    if (availableBalance != null) {
      data['available_balance'] = availableBalance!.toJson();
    }
    if (utSummary != null) {
      data['ut_summary'] = utSummary!.toJson();
    }
    if (totalGain != null) {
      data['total_gain'] = totalGain!.toJson();
    }
    if (capitalGain != null) {
      data['capital_gain'] = capitalGain!.toJson();
    }
    if (dividend != null) {
      data['dividend'] = dividend!.toJson();
    }
    if (paymentSummary != null) {
      data['payment_summary'] = paymentSummary!.toJson();
    }
    if (upaidUt != null) {
      data['upaid_ut'] = upaidUt!.toJson();
    }
    return data;
  }
}
