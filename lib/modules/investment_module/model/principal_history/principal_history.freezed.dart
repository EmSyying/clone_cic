// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'principal_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrincipalHistory _$PrincipalHistoryFromJson(Map<String, dynamic> json) {
  return _PrincipalHistory.fromJson(json);
}

/// @nodoc
mixin _$PrincipalHistory {
  String? get type => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_code')
  String? get colorCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'investment_amount')
  String? get investmentAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrincipalHistoryCopyWith<PrincipalHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrincipalHistoryCopyWith<$Res> {
  factory $PrincipalHistoryCopyWith(
          PrincipalHistory value, $Res Function(PrincipalHistory) then) =
      _$PrincipalHistoryCopyWithImpl<$Res>;
  $Res call(
      {String? type,
      String? label,
      String? date,
      @JsonKey(name: 'color_code') String? colorCode,
      @JsonKey(name: 'investment_amount') String? investmentAmount});
}

/// @nodoc
class _$PrincipalHistoryCopyWithImpl<$Res>
    implements $PrincipalHistoryCopyWith<$Res> {
  _$PrincipalHistoryCopyWithImpl(this._value, this._then);

  final PrincipalHistory _value;
  // ignore: unused_field
  final $Res Function(PrincipalHistory) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? label = freezed,
    Object? date = freezed,
    Object? colorCode = freezed,
    Object? investmentAmount = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentAmount: investmentAmount == freezed
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PrincipalHistoryCopyWith<$Res>
    implements $PrincipalHistoryCopyWith<$Res> {
  factory _$$_PrincipalHistoryCopyWith(
          _$_PrincipalHistory value, $Res Function(_$_PrincipalHistory) then) =
      __$$_PrincipalHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? type,
      String? label,
      String? date,
      @JsonKey(name: 'color_code') String? colorCode,
      @JsonKey(name: 'investment_amount') String? investmentAmount});
}

/// @nodoc
class __$$_PrincipalHistoryCopyWithImpl<$Res>
    extends _$PrincipalHistoryCopyWithImpl<$Res>
    implements _$$_PrincipalHistoryCopyWith<$Res> {
  __$$_PrincipalHistoryCopyWithImpl(
      _$_PrincipalHistory _value, $Res Function(_$_PrincipalHistory) _then)
      : super(_value, (v) => _then(v as _$_PrincipalHistory));

  @override
  _$_PrincipalHistory get _value => super._value as _$_PrincipalHistory;

  @override
  $Res call({
    Object? type = freezed,
    Object? label = freezed,
    Object? date = freezed,
    Object? colorCode = freezed,
    Object? investmentAmount = freezed,
  }) {
    return _then(_$_PrincipalHistory(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentAmount: investmentAmount == freezed
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrincipalHistory implements _PrincipalHistory {
  _$_PrincipalHistory(
      {this.type,
      this.label,
      this.date,
      @JsonKey(name: 'color_code') this.colorCode,
      @JsonKey(name: 'investment_amount') this.investmentAmount});

  factory _$_PrincipalHistory.fromJson(Map<String, dynamic> json) =>
      _$$_PrincipalHistoryFromJson(json);

  @override
  final String? type;
  @override
  final String? label;
  @override
  final String? date;
  @override
  @JsonKey(name: 'color_code')
  final String? colorCode;
  @override
  @JsonKey(name: 'investment_amount')
  final String? investmentAmount;

  @override
  String toString() {
    return 'PrincipalHistory(type: $type, label: $label, date: $date, colorCode: $colorCode, investmentAmount: $investmentAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrincipalHistory &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.colorCode, colorCode) &&
            const DeepCollectionEquality()
                .equals(other.investmentAmount, investmentAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(colorCode),
      const DeepCollectionEquality().hash(investmentAmount));

  @JsonKey(ignore: true)
  @override
  _$$_PrincipalHistoryCopyWith<_$_PrincipalHistory> get copyWith =>
      __$$_PrincipalHistoryCopyWithImpl<_$_PrincipalHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrincipalHistoryToJson(this);
  }
}

abstract class _PrincipalHistory implements PrincipalHistory {
  factory _PrincipalHistory(
          {final String? type,
          final String? label,
          final String? date,
          @JsonKey(name: 'color_code') final String? colorCode,
          @JsonKey(name: 'investment_amount') final String? investmentAmount}) =
      _$_PrincipalHistory;

  factory _PrincipalHistory.fromJson(Map<String, dynamic> json) =
      _$_PrincipalHistory.fromJson;

  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get label => throw _privateConstructorUsedError;
  @override
  String? get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'color_code')
  String? get colorCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'investment_amount')
  String? get investmentAmount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PrincipalHistoryCopyWith<_$_PrincipalHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
