import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_activities.freezed.dart';
part 'recent_activities.g.dart';

@freezed
class RecentActivities with _$RecentActivities {
  factory RecentActivities({
    final int? id,
    final String? code,
    final String? label,
    @JsonKey(name: 'shop_name') final String? shopName,
    @JsonKey(name: 'shop_logo') final String? shopLogo,
    final String? description,
    @JsonKey(name: 'point_amount') final num? pointAmount,
    final String? amount,
    final String? date,
  }) = _RecentActivities;

  factory RecentActivities.fromJson(Map<String, dynamic> json) =>
      _$RecentActivitiesFromJson(json);
}
