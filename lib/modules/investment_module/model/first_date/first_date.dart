// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'first_date.freezed.dart';
part 'first_date.g.dart';

@freezed
class FIFApplicationListModel with _$FIFApplicationListModel {
  factory FIFApplicationListModel({
    num? id,
    String? code,
    String? color,
    @JsonKey(name: 'account_name') String? accountName,
    @JsonKey(name: 'investment_amount') String? investmentAmount,
    @JsonKey(name: 'first_payment_date') String? firstPaymentDate,
    bool? hide,
    String? status,
    @JsonKey(name: 'return_payment_method') String? returnPaymentMethod,
    @JsonKey(name: 'mma_account_id') num? mmaAccountId,
    @JsonKey(name: 'bank_id') num? bankId,
  }) = _FIFApplicationListModel;

  factory FIFApplicationListModel.fromJson(Map<String, dynamic> json) =>
      _$FIFApplicationListModelFromJson(json);
}
