import 'package:freezed_annotation/freezed_annotation.dart';

part 'mpv_history_model.freezed.dart';
part 'mpv_history_model.g.dart';

@freezed
class MVPHistoryModel with _$MVPHistoryModel {
  factory MVPHistoryModel({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "ref_id") final String? refId,
    @JsonKey(name: "description") final String? description,
    @JsonKey(name: "transaction_type") final String? transactionType,
    @JsonKey(name: "amount") final double? amount,
    @JsonKey(name: "payment_date") final String? paymentDate,
  }) = _MVPHistoryModel;
  factory MVPHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MVPHistoryModelFromJson(json);
}
