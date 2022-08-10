// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'fif_contract_option.freezed.dart';
part 'fif_contract_option.g.dart';

@freezed
class FIFoptionModel with _$FIFoptionModel {
  factory FIFoptionModel({
    int? id,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_code") String? productCode,
    @JsonKey(name: "sub_product_id") int? subid,
    @JsonKey(name: "sub_product_name") String? subproductName,
    @JsonKey(name: "sub_product_code") String? subproductCode,
    @JsonKey(name: "annually_interest_rate") String? annuallyInterestRate,
    String? description,
    @JsonKey(name: "url_webview") String? urlWebview,
    @JsonKey(name: "investment_minimum") num? investmentMinimum,
    @JsonKey(name: "investment_default") num? investmentDefault,
    @JsonKey(name: "investment_maximum") num? investmentMaximum,
    @JsonKey(name: "investment_message") String? investmentMessage,
    @JsonKey(name: "duration_minimum") num? durationMinimum,
    @JsonKey(name: "duration_default") num? durationDefault,
    @JsonKey(name: "duration_maximum") num? durationMaximum,
    @JsonKey(name: "duration_message") String? durationMessage,
    List<FIFoptionModel>? options,
  }) = _FIFoptionModel;

  factory FIFoptionModel.fromJson(Map<String, dynamic> json) =>
      _$FIFoptionModelFromJson(json);
}
