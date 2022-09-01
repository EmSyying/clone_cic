import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_trading_web_view_info.freezed.dart';
part 'last_trading_web_view_info.g.dart';

@freezed
class ViewLastTradingInfoUrl with _$ViewLastTradingInfoUrl {
  factory ViewLastTradingInfoUrl({
    final bool? success,
    @JsonKey(name: 'link_trading_info') final String? linkTradingInfo,
  }) = _ViewLastTradingInfoUrl;

  factory ViewLastTradingInfoUrl.fromJson(Map<String, dynamic> json) =>
      _$ViewLastTradingInfoUrlFromJson(json);
}
