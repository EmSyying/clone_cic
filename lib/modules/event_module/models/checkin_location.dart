import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin_location.freezed.dart';
part 'checkin_location.g.dart';

@freezed
class CheckInLocation with _$CheckInLocation {
  factory CheckInLocation({
    String? name,
    String? address,
    String? latitude,
    String? longitude,
  }) = _CheckInLocation;

  factory CheckInLocation.fromJson(Map<String, dynamic> json) =>
      _$CheckInLocationFromJson(json);
}
