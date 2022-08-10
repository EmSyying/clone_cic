import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_stores.freezed.dart';
part 'model_stores.g.dart';

@freezed
class ModelsStores with _$ModelsStores {
  factory ModelsStores({
    String? steusTitle,
    String? titleStores,
    String? paragraph,
    String? titleLocation,
    String? imageStores,
    int? numberPercentage,
  }) = _ModelsStores;

  factory ModelsStores.fromJson(Map<String, dynamic> json) =>
      _$ModelsStoresFromJson(json);
}
