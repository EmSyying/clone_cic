// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletAmountModel _$WalletAmountModelFromJson(Map<String, dynamic> json) {
  return _WalletAmountModel.fromJson(json);
}

/// @nodoc
mixin _$WalletAmountModel {
  @JsonKey(name: 'balance')
  num? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_format')
  String? get balanceFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number')
  String? get accountNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletAmountModelCopyWith<WalletAmountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletAmountModelCopyWith<$Res> {
  factory $WalletAmountModelCopyWith(
          WalletAmountModel value, $Res Function(WalletAmountModel) then) =
      _$WalletAmountModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'balance') num? balance,
      @JsonKey(name: 'balance_format') String? balanceFormat,
      @JsonKey(name: 'account_number') String? accountNumber});
}

/// @nodoc
class _$WalletAmountModelCopyWithImpl<$Res>
    implements $WalletAmountModelCopyWith<$Res> {
  _$WalletAmountModelCopyWithImpl(this._value, this._then);

  final WalletAmountModel _value;
  // ignore: unused_field
  final $Res Function(WalletAmountModel) _then;

  @override
  $Res call({
    Object? balance = freezed,
    Object? balanceFormat = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      balanceFormat: balanceFormat == freezed
          ? _value.balanceFormat
          : balanceFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_WalletAmountModelCopyWith<$Res>
    implements $WalletAmountModelCopyWith<$Res> {
  factory _$$_WalletAmountModelCopyWith(_$_WalletAmountModel value,
          $Res Function(_$_WalletAmountModel) then) =
      __$$_WalletAmountModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'balance') num? balance,
      @JsonKey(name: 'balance_format') String? balanceFormat,
      @JsonKey(name: 'account_number') String? accountNumber});
}

/// @nodoc
class __$$_WalletAmountModelCopyWithImpl<$Res>
    extends _$WalletAmountModelCopyWithImpl<$Res>
    implements _$$_WalletAmountModelCopyWith<$Res> {
  __$$_WalletAmountModelCopyWithImpl(
      _$_WalletAmountModel _value, $Res Function(_$_WalletAmountModel) _then)
      : super(_value, (v) => _then(v as _$_WalletAmountModel));

  @override
  _$_WalletAmountModel get _value => super._value as _$_WalletAmountModel;

  @override
  $Res call({
    Object? balance = freezed,
    Object? balanceFormat = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_$_WalletAmountModel(
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      balanceFormat: balanceFormat == freezed
          ? _value.balanceFormat
          : balanceFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletAmountModel implements _WalletAmountModel {
  _$_WalletAmountModel(
      {@JsonKey(name: 'balance') this.balance,
      @JsonKey(name: 'balance_format') this.balanceFormat,
      @JsonKey(name: 'account_number') this.accountNumber});

  factory _$_WalletAmountModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletAmountModelFromJson(json);

  @override
  @JsonKey(name: 'balance')
  final num? balance;
  @override
  @JsonKey(name: 'balance_format')
  final String? balanceFormat;
  @override
  @JsonKey(name: 'account_number')
  final String? accountNumber;

  @override
  String toString() {
    return 'WalletAmountModel(balance: $balance, balanceFormat: $balanceFormat, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletAmountModel &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality()
                .equals(other.balanceFormat, balanceFormat) &&
            const DeepCollectionEquality()
                .equals(other.accountNumber, accountNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(balanceFormat),
      const DeepCollectionEquality().hash(accountNumber));

  @JsonKey(ignore: true)
  @override
  _$$_WalletAmountModelCopyWith<_$_WalletAmountModel> get copyWith =>
      __$$_WalletAmountModelCopyWithImpl<_$_WalletAmountModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletAmountModelToJson(this);
  }
}

abstract class _WalletAmountModel implements WalletAmountModel {
  factory _WalletAmountModel(
          {@JsonKey(name: 'balance') final num? balance,
          @JsonKey(name: 'balance_format') final String? balanceFormat,
          @JsonKey(name: 'account_number') final String? accountNumber}) =
      _$_WalletAmountModel;

  factory _WalletAmountModel.fromJson(Map<String, dynamic> json) =
      _$_WalletAmountModel.fromJson;

  @override
  @JsonKey(name: 'balance')
  num? get balance => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'balance_format')
  String? get balanceFormat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'account_number')
  String? get accountNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WalletAmountModelCopyWith<_$_WalletAmountModel> get copyWith =>
      throw _privateConstructorUsedError;
}
