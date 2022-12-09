// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equity_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquitySetting _$EquitySettingFromJson(Map<String, dynamic> json) {
  return _EquitySetting.fromJson(json);
}

/// @nodoc
mixin _$EquitySetting {
  @JsonKey(name: "min_equity_amount")
  int? get minEquityAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "max_equity_amount")
  int? get maxEquityAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "equity_message")
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquitySettingCopyWith<EquitySetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquitySettingCopyWith<$Res> {
  factory $EquitySettingCopyWith(
          EquitySetting value, $Res Function(EquitySetting) then) =
      _$EquitySettingCopyWithImpl<$Res, EquitySetting>;
  @useResult
  $Res call(
      {@JsonKey(name: "min_equity_amount") int? minEquityAmount,
      @JsonKey(name: "max_equity_amount") int? maxEquityAmount,
      @JsonKey(name: "equity_message") String? message});
}

/// @nodoc
class _$EquitySettingCopyWithImpl<$Res, $Val extends EquitySetting>
    implements $EquitySettingCopyWith<$Res> {
  _$EquitySettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minEquityAmount = freezed,
    Object? maxEquityAmount = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      minEquityAmount: freezed == minEquityAmount
          ? _value.minEquityAmount
          : minEquityAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxEquityAmount: freezed == maxEquityAmount
          ? _value.maxEquityAmount
          : maxEquityAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EquitySettingCopyWith<$Res>
    implements $EquitySettingCopyWith<$Res> {
  factory _$$_EquitySettingCopyWith(
          _$_EquitySetting value, $Res Function(_$_EquitySetting) then) =
      __$$_EquitySettingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "min_equity_amount") int? minEquityAmount,
      @JsonKey(name: "max_equity_amount") int? maxEquityAmount,
      @JsonKey(name: "equity_message") String? message});
}

/// @nodoc
class __$$_EquitySettingCopyWithImpl<$Res>
    extends _$EquitySettingCopyWithImpl<$Res, _$_EquitySetting>
    implements _$$_EquitySettingCopyWith<$Res> {
  __$$_EquitySettingCopyWithImpl(
      _$_EquitySetting _value, $Res Function(_$_EquitySetting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minEquityAmount = freezed,
    Object? maxEquityAmount = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_EquitySetting(
      minEquityAmount: freezed == minEquityAmount
          ? _value.minEquityAmount
          : minEquityAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxEquityAmount: freezed == maxEquityAmount
          ? _value.maxEquityAmount
          : maxEquityAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EquitySetting implements _EquitySetting {
  _$_EquitySetting(
      {@JsonKey(name: "min_equity_amount") this.minEquityAmount,
      @JsonKey(name: "max_equity_amount") this.maxEquityAmount,
      @JsonKey(name: "equity_message") this.message});

  factory _$_EquitySetting.fromJson(Map<String, dynamic> json) =>
      _$$_EquitySettingFromJson(json);

  @override
  @JsonKey(name: "min_equity_amount")
  final int? minEquityAmount;
  @override
  @JsonKey(name: "max_equity_amount")
  final int? maxEquityAmount;
  @override
  @JsonKey(name: "equity_message")
  final String? message;

  @override
  String toString() {
    return 'EquitySetting(minEquityAmount: $minEquityAmount, maxEquityAmount: $maxEquityAmount, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EquitySetting &&
            (identical(other.minEquityAmount, minEquityAmount) ||
                other.minEquityAmount == minEquityAmount) &&
            (identical(other.maxEquityAmount, maxEquityAmount) ||
                other.maxEquityAmount == maxEquityAmount) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, minEquityAmount, maxEquityAmount, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EquitySettingCopyWith<_$_EquitySetting> get copyWith =>
      __$$_EquitySettingCopyWithImpl<_$_EquitySetting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EquitySettingToJson(
      this,
    );
  }
}

abstract class _EquitySetting implements EquitySetting {
  factory _EquitySetting(
          {@JsonKey(name: "min_equity_amount") final int? minEquityAmount,
          @JsonKey(name: "max_equity_amount") final int? maxEquityAmount,
          @JsonKey(name: "equity_message") final String? message}) =
      _$_EquitySetting;

  factory _EquitySetting.fromJson(Map<String, dynamic> json) =
      _$_EquitySetting.fromJson;

  @override
  @JsonKey(name: "min_equity_amount")
  int? get minEquityAmount;
  @override
  @JsonKey(name: "max_equity_amount")
  int? get maxEquityAmount;
  @override
  @JsonKey(name: "equity_message")
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_EquitySettingCopyWith<_$_EquitySetting> get copyWith =>
      throw _privateConstructorUsedError;
}
