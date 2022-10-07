import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_detail.freezed.dart';
part 'deposit_detail.g.dart';

@freezed
class DepositDetail with _$DepositDetail {
  factory DepositDetail({
    final int? id,
    final String? title,
    @JsonKey(name: 'transaction_id') final String? transactionId,
    @JsonKey(name: 'deposit_method') final String? depositMethod,
    final String? date,
    final String? time,
    final String? amount,
  }) = _DepositDetail;

  factory DepositDetail.fromJson(Map<String, dynamic> json) =>
      _$DepositDetailFromJson(json);
}
