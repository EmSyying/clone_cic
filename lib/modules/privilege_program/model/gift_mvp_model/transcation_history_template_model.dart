import 'package:freezed_annotation/freezed_annotation.dart';

part 'transcation_history_template_model.freezed.dart';
part 'transcation_history_template_model.g.dart';

@freezed
class TransactionHisotryTemplateModel with _$TransactionHisotryTemplateModel {
  factory TransactionHisotryTemplateModel({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "wallet_name") final String? walletName,
    @JsonKey(name: "amount") final String? amount,
    @JsonKey(name: "payment_date") final String? paymentDate,
  }) = _TransactionHisotryTemplateModel;

  factory TransactionHisotryTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHisotryTemplateModelFromJson(json);
}
