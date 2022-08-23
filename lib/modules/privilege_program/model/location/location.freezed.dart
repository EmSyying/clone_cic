// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrivilageLocation _$PrivilageLocationFromJson(Map<String, dynamic> json) {
  return _PrivilageLocation.fromJson(json);
}

/// @nodoc
mixin _$PrivilageLocation {
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_kh')
  String? get nameKh => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_en')
  String? get nameEn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivilageLocationCopyWith<PrivilageLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivilageLocationCopyWith<$Res> {
  factory $PrivilageLocationCopyWith(
          PrivilageLocation value, $Res Function(PrivilageLocation) then) =
      _$PrivilageLocationCopyWithImpl<$Res>;
  $Res call(
      {String? code,
      @JsonKey(name: 'name_kh') String? nameKh,
      @JsonKey(name: 'name_en') String? nameEn});
}

/// @nodoc
class _$PrivilageLocationCopyWithImpl<$Res>
    implements $PrivilageLocationCopyWith<$Res> {
  _$PrivilageLocationCopyWithImpl(this._value, this._then);

  final PrivilageLocation _value;
  // ignore: unused_field
  final $Res Function(PrivilageLocation) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? nameKh = freezed,
    Object? nameEn = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKh: nameKh == freezed
          ? _value.nameKh
          : nameKh // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PrivilageLocationCopyWith<$Res>
    implements $PrivilageLocationCopyWith<$Res> {
  factory _$$_PrivilageLocationCopyWith(_$_PrivilageLocation value,
          $Res Function(_$_PrivilageLocation) then) =
      __$$_PrivilageLocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? code,
      @JsonKey(name: 'name_kh') String? nameKh,
      @JsonKey(name: 'name_en') String? nameEn});
}

/// @nodoc
class __$$_PrivilageLocationCopyWithImpl<$Res>
    extends _$PrivilageLocationCopyWithImpl<$Res>
    implements _$$_PrivilageLocationCopyWith<$Res> {
  __$$_PrivilageLocationCopyWithImpl(
      _$_PrivilageLocation _value, $Res Function(_$_PrivilageLocation) _then)
      : super(_value, (v) => _then(v as _$_PrivilageLocation));

  @override
  _$_PrivilageLocation get _value => super._value as _$_PrivilageLocation;

  @override
  $Res call({
    Object? code = freezed,
    Object? nameKh = freezed,
    Object? nameEn = freezed,
  }) {
    return _then(_$_PrivilageLocation(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKh: nameKh == freezed
          ? _value.nameKh
          : nameKh // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrivilageLocation implements _PrivilageLocation {
  _$_PrivilageLocation(
      {this.code,
      @JsonKey(name: 'name_kh') this.nameKh,
      @JsonKey(name: 'name_en') this.nameEn});

  factory _$_PrivilageLocation.fromJson(Map<String, dynamic> json) =>
      _$$_PrivilageLocationFromJson(json);

  @override
  final String? code;
  @override
  @JsonKey(name: 'name_kh')
  final String? nameKh;
  @override
  @JsonKey(name: 'name_en')
  final String? nameEn;

  @override
  String toString() {
    return 'PrivilageLocation(code: $code, nameKh: $nameKh, nameEn: $nameEn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrivilageLocation &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.nameKh, nameKh) &&
            const DeepCollectionEquality().equals(other.nameEn, nameEn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(nameKh),
      const DeepCollectionEquality().hash(nameEn));

  @JsonKey(ignore: true)
  @override
  _$$_PrivilageLocationCopyWith<_$_PrivilageLocation> get copyWith =>
      __$$_PrivilageLocationCopyWithImpl<_$_PrivilageLocation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrivilageLocationToJson(this);
  }
}

abstract class _PrivilageLocation implements PrivilageLocation {
  factory _PrivilageLocation(
      {final String? code,
      @JsonKey(name: 'name_kh') final String? nameKh,
      @JsonKey(name: 'name_en') final String? nameEn}) = _$_PrivilageLocation;

  factory _PrivilageLocation.fromJson(Map<String, dynamic> json) =
      _$_PrivilageLocation.fromJson;

  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name_kh')
  String? get nameKh => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name_en')
  String? get nameEn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PrivilageLocationCopyWith<_$_PrivilageLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
