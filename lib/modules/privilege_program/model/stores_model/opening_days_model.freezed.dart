// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'opening_days_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpeningDaysModel _$OpeningDaysModelFromJson(Map<String, dynamic> json) {
  return _OpeningDaysModel.fromJson(json);
}

/// @nodoc
mixin _$OpeningDaysModel {
  @JsonKey(name: 'day_name')
  String? get dayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_a_hours')
  String? get shiftAHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_b_hours')
  String? get shiftBHours => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpeningDaysModelCopyWith<OpeningDaysModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningDaysModelCopyWith<$Res> {
  factory $OpeningDaysModelCopyWith(
          OpeningDaysModel value, $Res Function(OpeningDaysModel) then) =
      _$OpeningDaysModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'day_name') String? dayName,
      @JsonKey(name: 'shift_a_hours') String? shiftAHours,
      @JsonKey(name: 'shift_b_hours') String? shiftBHours});
}

/// @nodoc
class _$OpeningDaysModelCopyWithImpl<$Res>
    implements $OpeningDaysModelCopyWith<$Res> {
  _$OpeningDaysModelCopyWithImpl(this._value, this._then);

  final OpeningDaysModel _value;
  // ignore: unused_field
  final $Res Function(OpeningDaysModel) _then;

  @override
  $Res call({
    Object? dayName = freezed,
    Object? shiftAHours = freezed,
    Object? shiftBHours = freezed,
  }) {
    return _then(_value.copyWith(
      dayName: dayName == freezed
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftAHours: shiftAHours == freezed
          ? _value.shiftAHours
          : shiftAHours // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftBHours: shiftBHours == freezed
          ? _value.shiftBHours
          : shiftBHours // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_OpeningDaysModelCopyWith<$Res>
    implements $OpeningDaysModelCopyWith<$Res> {
  factory _$$_OpeningDaysModelCopyWith(
          _$_OpeningDaysModel value, $Res Function(_$_OpeningDaysModel) then) =
      __$$_OpeningDaysModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'day_name') String? dayName,
      @JsonKey(name: 'shift_a_hours') String? shiftAHours,
      @JsonKey(name: 'shift_b_hours') String? shiftBHours});
}

/// @nodoc
class __$$_OpeningDaysModelCopyWithImpl<$Res>
    extends _$OpeningDaysModelCopyWithImpl<$Res>
    implements _$$_OpeningDaysModelCopyWith<$Res> {
  __$$_OpeningDaysModelCopyWithImpl(
      _$_OpeningDaysModel _value, $Res Function(_$_OpeningDaysModel) _then)
      : super(_value, (v) => _then(v as _$_OpeningDaysModel));

  @override
  _$_OpeningDaysModel get _value => super._value as _$_OpeningDaysModel;

  @override
  $Res call({
    Object? dayName = freezed,
    Object? shiftAHours = freezed,
    Object? shiftBHours = freezed,
  }) {
    return _then(_$_OpeningDaysModel(
      dayName: dayName == freezed
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftAHours: shiftAHours == freezed
          ? _value.shiftAHours
          : shiftAHours // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftBHours: shiftBHours == freezed
          ? _value.shiftBHours
          : shiftBHours // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OpeningDaysModel implements _OpeningDaysModel {
  _$_OpeningDaysModel(
      {@JsonKey(name: 'day_name') this.dayName,
      @JsonKey(name: 'shift_a_hours') this.shiftAHours,
      @JsonKey(name: 'shift_b_hours') this.shiftBHours});

  factory _$_OpeningDaysModel.fromJson(Map<String, dynamic> json) =>
      _$$_OpeningDaysModelFromJson(json);

  @override
  @JsonKey(name: 'day_name')
  final String? dayName;
  @override
  @JsonKey(name: 'shift_a_hours')
  final String? shiftAHours;
  @override
  @JsonKey(name: 'shift_b_hours')
  final String? shiftBHours;

  @override
  String toString() {
    return 'OpeningDaysModel(dayName: $dayName, shiftAHours: $shiftAHours, shiftBHours: $shiftBHours)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpeningDaysModel &&
            const DeepCollectionEquality().equals(other.dayName, dayName) &&
            const DeepCollectionEquality()
                .equals(other.shiftAHours, shiftAHours) &&
            const DeepCollectionEquality()
                .equals(other.shiftBHours, shiftBHours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dayName),
      const DeepCollectionEquality().hash(shiftAHours),
      const DeepCollectionEquality().hash(shiftBHours));

  @JsonKey(ignore: true)
  @override
  _$$_OpeningDaysModelCopyWith<_$_OpeningDaysModel> get copyWith =>
      __$$_OpeningDaysModelCopyWithImpl<_$_OpeningDaysModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OpeningDaysModelToJson(this);
  }
}

abstract class _OpeningDaysModel implements OpeningDaysModel {
  factory _OpeningDaysModel(
          {@JsonKey(name: 'day_name') final String? dayName,
          @JsonKey(name: 'shift_a_hours') final String? shiftAHours,
          @JsonKey(name: 'shift_b_hours') final String? shiftBHours}) =
      _$_OpeningDaysModel;

  factory _OpeningDaysModel.fromJson(Map<String, dynamic> json) =
      _$_OpeningDaysModel.fromJson;

  @override
  @JsonKey(name: 'day_name')
  String? get dayName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'shift_a_hours')
  String? get shiftAHours => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'shift_b_hours')
  String? get shiftBHours => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OpeningDaysModelCopyWith<_$_OpeningDaysModel> get copyWith =>
      throw _privateConstructorUsedError;
}
