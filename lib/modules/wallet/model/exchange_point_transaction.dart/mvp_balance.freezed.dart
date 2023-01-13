// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mvp_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MVPBalance _$MVPBalanceFromJson(Map<String, dynamic> json) {
  return _MVPBalance.fromJson(json);
}

/// @nodoc
mixin _$MVPBalance {
  @JsonKey(name: 'mvp_amount')
  num? get mvpAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'mvp_amount_format')
  String? get mvpAmountFormat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MVPBalanceCopyWith<MVPBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MVPBalanceCopyWith<$Res> {
  factory $MVPBalanceCopyWith(
          MVPBalance value, $Res Function(MVPBalance) then) =
      _$MVPBalanceCopyWithImpl<$Res, MVPBalance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mvp_amount') num? mvpAmount,
      @JsonKey(name: 'mvp_amount_format') String? mvpAmountFormat});
}

/// @nodoc
class _$MVPBalanceCopyWithImpl<$Res, $Val extends MVPBalance>
    implements $MVPBalanceCopyWith<$Res> {
  _$MVPBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mvpAmount = freezed,
    Object? mvpAmountFormat = freezed,
  }) {
    return _then(_value.copyWith(
      mvpAmount: freezed == mvpAmount
          ? _value.mvpAmount
          : mvpAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      mvpAmountFormat: freezed == mvpAmountFormat
          ? _value.mvpAmountFormat
          : mvpAmountFormat // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MVPBalanceCopyWith<$Res>
    implements $MVPBalanceCopyWith<$Res> {
  factory _$$_MVPBalanceCopyWith(
          _$_MVPBalance value, $Res Function(_$_MVPBalance) then) =
      __$$_MVPBalanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mvp_amount') num? mvpAmount,
      @JsonKey(name: 'mvp_amount_format') String? mvpAmountFormat});
}

/// @nodoc
class __$$_MVPBalanceCopyWithImpl<$Res>
    extends _$MVPBalanceCopyWithImpl<$Res, _$_MVPBalance>
    implements _$$_MVPBalanceCopyWith<$Res> {
  __$$_MVPBalanceCopyWithImpl(
      _$_MVPBalance _value, $Res Function(_$_MVPBalance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mvpAmount = freezed,
    Object? mvpAmountFormat = freezed,
  }) {
    return _then(_$_MVPBalance(
      mvpAmount: freezed == mvpAmount
          ? _value.mvpAmount
          : mvpAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      mvpAmountFormat: freezed == mvpAmountFormat
          ? _value.mvpAmountFormat
          : mvpAmountFormat // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MVPBalance implements _MVPBalance {
  _$_MVPBalance(
      {@JsonKey(name: 'mvp_amount') this.mvpAmount,
      @JsonKey(name: 'mvp_amount_format') this.mvpAmountFormat});

  factory _$_MVPBalance.fromJson(Map<String, dynamic> json) =>
      _$$_MVPBalanceFromJson(json);

  @override
  @JsonKey(name: 'mvp_amount')
  final num? mvpAmount;
  @override
  @JsonKey(name: 'mvp_amount_format')
  final String? mvpAmountFormat;

  @override
  String toString() {
    return 'MVPBalance(mvpAmount: $mvpAmount, mvpAmountFormat: $mvpAmountFormat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MVPBalance &&
            (identical(other.mvpAmount, mvpAmount) ||
                other.mvpAmount == mvpAmount) &&
            (identical(other.mvpAmountFormat, mvpAmountFormat) ||
                other.mvpAmountFormat == mvpAmountFormat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mvpAmount, mvpAmountFormat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MVPBalanceCopyWith<_$_MVPBalance> get copyWith =>
      __$$_MVPBalanceCopyWithImpl<_$_MVPBalance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MVPBalanceToJson(
      this,
    );
  }
}

abstract class _MVPBalance implements MVPBalance {
  factory _MVPBalance(
          {@JsonKey(name: 'mvp_amount') final num? mvpAmount,
          @JsonKey(name: 'mvp_amount_format') final String? mvpAmountFormat}) =
      _$_MVPBalance;

  factory _MVPBalance.fromJson(Map<String, dynamic> json) =
      _$_MVPBalance.fromJson;

  @override
  @JsonKey(name: 'mvp_amount')
  num? get mvpAmount;
  @override
  @JsonKey(name: 'mvp_amount_format')
  String? get mvpAmountFormat;
  @override
  @JsonKey(ignore: true)
  _$$_MVPBalanceCopyWith<_$_MVPBalance> get copyWith =>
      throw _privateConstructorUsedError;
}
