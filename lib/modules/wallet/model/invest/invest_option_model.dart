import 'package:cicgreenloan/modules/wallet/model/invest/fif_detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invest_option_model.freezed.dart';
part 'invest_option_model.g.dart';

@freezed
class InvestOptionModel with _$InvestOptionModel {
  factory InvestOptionModel({
    final int? id,
    final String? title,
    final String? background,
    @JsonKey(name: 'explore_more') final String? exploreMore,
    final String? route,
    @JsonKey(name: 'detail') final List<FiFDetailModel>? details,
  }) = _InvestOptionModel;

  factory InvestOptionModel.fromJson(Map<String, dynamic> json) =>
      _$InvestOptionModelFromJson(json);
}
