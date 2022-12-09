// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  bool? get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivilageLocationCopyWith<PrivilageLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivilageLocationCopyWith<$Res> {
  factory $PrivilageLocationCopyWith(
          PrivilageLocation value, $Res Function(PrivilageLocation) then) =
      _$PrivilageLocationCopyWithImpl<$Res, PrivilageLocation>;
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: 'name_kh') String? nameKh,
      @JsonKey(name: 'name_en') String? nameEn,
      bool? isSelected});
}

/// @nodoc
class _$PrivilageLocationCopyWithImpl<$Res, $Val extends PrivilageLocation>
    implements $PrivilageLocationCopyWith<$Res> {
  _$PrivilageLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? nameKh = freezed,
    Object? nameEn = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKh: freezed == nameKh
          ? _value.nameKh
          : nameKh // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrivilageLocationCopyWith<$Res>
    implements $PrivilageLocationCopyWith<$Res> {
  factory _$$_PrivilageLocationCopyWith(_$_PrivilageLocation value,
          $Res Function(_$_PrivilageLocation) then) =
      __$$_PrivilageLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: 'name_kh') String? nameKh,
      @JsonKey(name: 'name_en') String? nameEn,
      bool? isSelected});
}

/// @nodoc
class __$$_PrivilageLocationCopyWithImpl<$Res>
    extends _$PrivilageLocationCopyWithImpl<$Res, _$_PrivilageLocation>
    implements _$$_PrivilageLocationCopyWith<$Res> {
  __$$_PrivilageLocationCopyWithImpl(
      _$_PrivilageLocation _value, $Res Function(_$_PrivilageLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? nameKh = freezed,
    Object? nameEn = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$_PrivilageLocation(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKh: freezed == nameKh
          ? _value.nameKh
          : nameKh // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrivilageLocation implements _PrivilageLocation {
  _$_PrivilageLocation(
      {this.code,
      @JsonKey(name: 'name_kh') this.nameKh,
      @JsonKey(name: 'name_en') this.nameEn,
      this.isSelected = false});

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
  @JsonKey()
  final bool? isSelected;

  @override
  String toString() {
    return 'PrivilageLocation(code: $code, nameKh: $nameKh, nameEn: $nameEn, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrivilageLocation &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nameKh, nameKh) || other.nameKh == nameKh) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, nameKh, nameEn, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrivilageLocationCopyWith<_$_PrivilageLocation> get copyWith =>
      __$$_PrivilageLocationCopyWithImpl<_$_PrivilageLocation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrivilageLocationToJson(
      this,
    );
  }
}

abstract class _PrivilageLocation implements PrivilageLocation {
  factory _PrivilageLocation(
      {final String? code,
      @JsonKey(name: 'name_kh') final String? nameKh,
      @JsonKey(name: 'name_en') final String? nameEn,
      final bool? isSelected}) = _$_PrivilageLocation;

  factory _PrivilageLocation.fromJson(Map<String, dynamic> json) =
      _$_PrivilageLocation.fromJson;

  @override
  String? get code;
  @override
  @JsonKey(name: 'name_kh')
  String? get nameKh;
  @override
  @JsonKey(name: 'name_en')
  String? get nameEn;
  @override
  bool? get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_PrivilageLocationCopyWith<_$_PrivilageLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
