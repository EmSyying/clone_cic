import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class PrivilageLocation with _$PrivilageLocation {
  factory PrivilageLocation(
      {final String? code,
      @JsonKey(name: 'name_kh') final String? nameKh,
      @JsonKey(name: 'name_en') final String? nameEn,
      @Default(false) final bool? isSelected}) = _PrivilageLocation;

  factory PrivilageLocation.fromJson(Map<String, dynamic> json) =>
      _$PrivilageLocationFromJson(json);
}
