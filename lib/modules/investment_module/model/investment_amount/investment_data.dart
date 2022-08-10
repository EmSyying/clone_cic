import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment_data.freezed.dart';
part 'investment_data.g.dart';

@freezed
class InvestmentDataModel with _$InvestmentDataModel {
  factory InvestmentDataModel(
      {@JsonKey(name: 'total_investment') String? totalInvestment,
      @JsonKey(name: 'about_fif') String? aboutFif,
      String? currency,
      bool? hide}) = _InvestmentDataModel;

  factory InvestmentDataModel.fromJson(Map<String, dynamic> json) =>
      _$InvestmentDataModelFromJson(json);
}
