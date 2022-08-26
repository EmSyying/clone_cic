import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_location_list.freezed.dart';
part 'search_location_list.g.dart';

@freezed
class SearchLocationListModel with _$SearchLocationListModel {
  factory SearchLocationListModel(
          {final String? code,
          final String? province,
          @JsonKey(name: 'full_address') final String? fullAdress}) =
      _SearchLocationListModel;

  factory SearchLocationListModel.fromJson(Map<String, dynamic> json) =>
      _$SearchLocationListModelFromJson(json);
}
