import 'package:cicgreenloan/Utils/app_settings/models/guide_line.dart';
import 'package:flutter/material.dart';

class AppSettingModel {
  List<AppSettingData>? data;

  AppSettingModel({this.data});

  AppSettingModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(AppSettingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguageData {
  AppSettingData? marketSession;
  AppSettingData? waring;
  AppSettingData? qR;
  AppSettingData? label1;
  AppSettingData? investment;
  AppSettingData? getFunding;
  AppSettingData? utTrading;
  AppSettingData? directory;
  AppSettingData? marketPlace;
  AppSettingData? event;
  AppSettingData? learning;
  AppSettingData? report;
  AppSettingData? aboutCic;
  AppSettingData? recentDocument;

  LanguageData(
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
      this.recentDocument});

  LanguageData.fromJson(Map<String, dynamic> json) {
    marketSession = json['market_session'] != null
        ? AppSettingData.fromJson(json['market_session'])
        : null;
    waring =
        json['waring'] != null ? AppSettingData.fromJson(json['waring']) : null;
    qR = json['QR'] != null ? AppSettingData.fromJson(json['QR']) : null;
    label1 = json['Label 1'] != null
        ? AppSettingData.fromJson(json['Label 1'])
        : null;
    investment = json['investment'] != null
        ? AppSettingData.fromJson(json['investment'])
        : null;
    getFunding = json['get_funding'] != null
        ? AppSettingData.fromJson(json['get_funding'])
        : null;
    utTrading = json['ut_trading'] != null
        ? AppSettingData.fromJson(json['ut_trading'])
        : null;
    directory = json['directory'] != null
        ? AppSettingData.fromJson(json['directory'])
        : null;
    marketPlace = json['market_place'] != null
        ? AppSettingData.fromJson(json['market_place'])
        : null;
    event =
        json['event'] != null ? AppSettingData.fromJson(json['event']) : null;
    learning = json['learning'] != null
        ? AppSettingData.fromJson(json['learning'])
        : null;
    report =
        json['report'] != null ? AppSettingData.fromJson(json['report']) : null;
    aboutCic = json['about_cic'] != null
        ? AppSettingData.fromJson(json['about_cic'])
        : null;
    recentDocument = json['recent_document'] != null
        ? AppSettingData.fromJson(json['recent_document'])
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
    return data;
  }
}

class AppSettingData {
  int? id;
  String? type;
  dynamic key;
  String? label;
  String? route;
  String? icon;
  String? activeIcon;
  bool? active;
  bool? enable;
  Guideline? guideline;
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;
  double? width;
  double? height;
  double? xPosition;
  double? yPosition;

  AppSettingData(
      {this.id,
      this.type,
      this.key,
      this.label,
      this.route,
      this.icon,
      this.activeIcon,
      this.active,
      this.guideline,
      this.overlayEntry,
      this.overlayState,
      this.width,
      this.height,
      this.xPosition,
      this.yPosition,
      this.enable});

  AppSettingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    key = json['key'];
    label = json['label'];
    route = json['route'];
    icon = json['icon'];
    activeIcon = json['active_icon'];
    active = json['active'];
    enable = json['enable'];
    guideline = json['guideline'] != null
        ? Guideline.fromJson(json['guideline'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['key'] = key;
    data['label'] = label;
    data['route'] = route;
    data['icon'] = icon;
    data['active_icon'] = activeIcon;
    data['active'] = active;
    if (guideline != null) {
      data['guideline'] = guideline!.toJson();
    }
    return data;
  }
}
