import 'package:freezed_annotation/freezed_annotation.dart';

part 'transcation_history_template_model.freezed.dart';
part 'transcation_history_template_model.g.dart';

@freezed
class TransactionHisotryTemplateModel with _$TransactionHisotryTemplateModel {
  factory TransactionHisotryTemplateModel({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "template_name") final String? templateName,
    @JsonKey(name: "wallet_number") final String? walletNumber,
    @JsonKey(name: "image") final String? image,
    @JsonKey(name: "default_image") final String? defaultImage,
    @JsonKey(name: "wallet_name") final String? walletName,
    @JsonKey(name: "amount") final String? amount,
    @JsonKey(name: "payment_date") final String? paymentDate,
  }) = _TransactionHisotryTemplateModel;

  factory TransactionHisotryTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHisotryTemplateModelFromJson(json);
}
