import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_history_privilege.freezed.dart';
part 'model_history_privilege.g.dart';

@freezed
class PrivilegeHistoryModel with _$PrivilegeHistoryModel {
  factory PrivilegeHistoryModel({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "thumbnail") final String? thumbnail,
    @JsonKey(name: "shop_name") final String? shopName,
    @JsonKey(name: "code") final String? code,
    @JsonKey(name: "amount") final String? amount,
    @JsonKey(name: "payment_date") final String? paymentDate,
  }) = _PrivilegeHistoryModel;

  factory PrivilegeHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeHistoryModelFromJson(json);
}
