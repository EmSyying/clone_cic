import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_mvp_model.freezed.dart';
part 'review_mvp_model.g.dart';

@freezed
class ReviewMvpSuccessModel with _$ReviewMvpSuccessModel {
  factory ReviewMvpSuccessModel({
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "amount") final String? amount,
    @JsonKey(name: "original_amount") final String? originalAmount,
    @JsonKey(name: "to_account_name") final String? toAccountName,
    @JsonKey(name: "transaction_id") final String? transactionId,
    @JsonKey(name: "date") final String? date,
    @JsonKey(name: "reference") final String? reference,
    @JsonKey(name: "from_account_name") final String? fromAccountName,
    @JsonKey(name: "remark") final String? remark,
  }) = _ReviewMvpSuccessModel;

  factory ReviewMvpSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewMvpSuccessModelFromJson(json);
}
