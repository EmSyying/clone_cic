import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_point_transaction.freezed.dart';
part 'exchange_point_transaction.g.dart';

@freezed
class ExchangePointTransaction with _$ExchangePointTransaction {
  factory ExchangePointTransaction(
      {final int? id,
      final String? description,
      final String? amount,
      final String? date}) = _ExchangePointTransaction;

  factory ExchangePointTransaction.fromJson(Map<String, dynamic> json) =>
      _$ExchangePointTransactionFromJson(json);
}
