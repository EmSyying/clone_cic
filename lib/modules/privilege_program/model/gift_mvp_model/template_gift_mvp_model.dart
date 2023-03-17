import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_gift_mvp_model.freezed.dart';
part 'template_gift_mvp_model.g.dart';

@freezed
class TemplateGiftMVPModel with _$TemplateGiftMVPModel {
  factory TemplateGiftMVPModel({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "user_id") final int? userId,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "wallet_number") final String? walletNumber,
    @JsonKey(name: "type_code") final String? typeCode,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "updated_at") final String? updatedAt,
  }) = _TemplateGiftMVPModel;

  factory TemplateGiftMVPModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateGiftMVPModelFromJson(json);
}
