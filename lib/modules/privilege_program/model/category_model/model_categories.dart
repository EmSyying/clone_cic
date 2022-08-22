import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_categories.freezed.dart';
part 'model_categories.g.dart';

@freezed
class ModelsCategories with _$ModelsCategories {
  factory ModelsCategories({
    int? id,
    String? name,
    String? image,
  }) = _ModelsCategories;

  factory ModelsCategories.fromJson(Map<String, dynamic> json) =>
      _$ModelsCategoriesFromJson(json);
}
