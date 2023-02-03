import 'package:freezed_annotation/freezed_annotation.dart';

part 'button_in_slide_model.freezed.dart';
part 'button_in_slide_model.g.dart';

@freezed
class buttonListModel with _$buttonListModel {
  factory buttonListModel({
    String? label,
    String? icon,
    String? target,
  }) = _buttonListModel;

  factory buttonListModel.fromJson(Map<String, dynamic> json) =>
      _$buttonListModelFromJson(json);
}
