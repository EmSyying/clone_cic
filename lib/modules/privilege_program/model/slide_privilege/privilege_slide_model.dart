import 'package:cicgreenloan/modules/privilege_program/model/slide_privilege/button_in_slide_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'privilege_slide_model.freezed.dart';
part 'privilege_slide_model.g.dart';

@freezed
class PrivilegeSlideModel with _$PrivilegeSlideModel {
  factory PrivilegeSlideModel({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "module") String? module,
    @JsonKey(name: "shop_id") int? shopId,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "destination") String? destination,
    @JsonKey(name: "url_target") String? urlTarget,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: 'button') ButtonListModel? buttonList,
  }) = _PrivilegeSlideModel;

  factory PrivilegeSlideModel.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeSlideModelFromJson(json);
}
