// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_payment.freezed.dart';
part 'data_payment.g.dart';

@freezed
class PaymentData with _$PaymentData {
  factory PaymentData({
    num? id,
    String? type,
    @JsonKey(name: 'bank_name') String? bankName,
    @JsonKey(name: 'account_name') String? accounName,
    @JsonKey(name: 'account_number') String? accountNumber,
    String? image,
  }) = _PaymentData;

  factory PaymentData.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataFromJson(json);
}
