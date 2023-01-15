import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_history_privilege.freezed.dart';
part 'model_history_privilege.g.dart';

@freezed
class PrivilegeHistoryModel with _$PrivilegeHistoryModel {
  factory PrivilegeHistoryModel(
          {@JsonKey(name: "id") final int? id,
          final String? label,
          @JsonKey(name: "shop_logo") final String? thumbnail,
          @JsonKey(name: "shop_name") final String? shopName,
          final String? description,
          @JsonKey(name: "code") final String? code,
          @JsonKey(name: "amount") final String? amount,
          @JsonKey(name: "payment_date") final String? paymentDate,
          @JsonKey(name: "payment_type") final String? paymentType}) =
      _PrivilegeHistoryModel;

  factory PrivilegeHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeHistoryModelFromJson(json);
}
