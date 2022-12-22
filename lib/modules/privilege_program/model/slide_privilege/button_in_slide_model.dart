import 'package:freezed_annotation/freezed_annotation.dart';

part 'button_in_slide_model.freezed.dart';
part 'button_in_slide_model.g.dart';

@freezed
class ButtonListModel with _$ButtonListModel {
  factory ButtonListModel({
    String? label,
    String? icon,
    String? target,
  }) = _ButtonListModel;

  factory ButtonListModel.fromJson(Map<String, dynamic> json) =>
      _$ButtonListModelFromJson(json);
}
