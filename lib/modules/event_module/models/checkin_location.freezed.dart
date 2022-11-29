// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checkin_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckInLocation _$CheckInLocationFromJson(Map<String, dynamic> json) {
  return _CheckInLocation.fromJson(json);
}

/// @nodoc
mixin _$CheckInLocation {
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckInLocationCopyWith<CheckInLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInLocationCopyWith<$Res> {
  factory $CheckInLocationCopyWith(
          CheckInLocation value, $Res Function(CheckInLocation) then) =
      _$CheckInLocationCopyWithImpl<$Res>;
  $Res call(
      {String? name, String? address, String? latitude, String? longitude});
}

/// @nodoc
class _$CheckInLocationCopyWithImpl<$Res>
    implements $CheckInLocationCopyWith<$Res> {
  _$CheckInLocationCopyWithImpl(this._value, this._then);

  final CheckInLocation _value;
  // ignore: unused_field
  final $Res Function(CheckInLocation) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CheckInLocationCopyWith<$Res>
    implements $CheckInLocationCopyWith<$Res> {
  factory _$$_CheckInLocationCopyWith(
          _$_CheckInLocation value, $Res Function(_$_CheckInLocation) then) =
      __$$_CheckInLocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name, String? address, String? latitude, String? longitude});
}

/// @nodoc
class __$$_CheckInLocationCopyWithImpl<$Res>
    extends _$CheckInLocationCopyWithImpl<$Res>
    implements _$$_CheckInLocationCopyWith<$Res> {
  __$$_CheckInLocationCopyWithImpl(
      _$_CheckInLocation _value, $Res Function(_$_CheckInLocation) _then)
      : super(_value, (v) => _then(v as _$_CheckInLocation));

  @override
  _$_CheckInLocation get _value => super._value as _$_CheckInLocation;

  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_CheckInLocation(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckInLocation implements _CheckInLocation {
  _$_CheckInLocation({this.name, this.address, this.latitude, this.longitude});

  factory _$_CheckInLocation.fromJson(Map<String, dynamic> json) =>
      _$$_CheckInLocationFromJson(json);

  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? latitude;
  @override
  final String? longitude;

  @override
  String toString() {
    return 'CheckInLocation(name: $name, address: $address, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckInLocation &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$$_CheckInLocationCopyWith<_$_CheckInLocation> get copyWith =>
      __$$_CheckInLocationCopyWithImpl<_$_CheckInLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckInLocationToJson(this);
  }
}

abstract class _CheckInLocation implements CheckInLocation {
  factory _CheckInLocation(
      {final String? name,
      final String? address,
      final String? latitude,
      final String? longitude}) = _$_CheckInLocation;

  factory _CheckInLocation.fromJson(Map<String, dynamic> json) =
      _$_CheckInLocation.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  String? get latitude => throw _privateConstructorUsedError;
  @override
  String? get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CheckInLocationCopyWith<_$_CheckInLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
