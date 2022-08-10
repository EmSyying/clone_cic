import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_categories.freezed.dart';
part 'model_categories.g.dart';

@freezed
class ModelsCategories with _$ModelsCategories {
  factory ModelsCategories({
    String? title,
    String? svgPicture,
  }) = _ModelsCategories;

  factory ModelsCategories.fromJson(Map<String, dynamic> json) =>
      _$ModelsCategoriesFromJson(json);
}
