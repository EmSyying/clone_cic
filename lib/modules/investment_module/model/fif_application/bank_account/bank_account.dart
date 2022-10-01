import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account.freezed.dart';
part 'bank_account.g.dart';

@freezed
class BankAccount with _$BankAccount {
  factory BankAccount({
    int? id,
    String? account,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}
