// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) {
  return _WalletTransaction.fromJson(json);
}

/// @nodoc
mixin _$WalletTransaction {
  String? get date => throw _privateConstructorUsedError;
  List<WalletTransactionDetail>? get transaction =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletTransactionCopyWith<WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionCopyWith<$Res> {
  factory $WalletTransactionCopyWith(
          WalletTransaction value, $Res Function(WalletTransaction) then) =
      _$WalletTransactionCopyWithImpl<$Res>;
  $Res call({String? date, List<WalletTransactionDetail>? transaction});
}

/// @nodoc
class _$WalletTransactionCopyWithImpl<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  _$WalletTransactionCopyWithImpl(this._value, this._then);

  final WalletTransaction _value;
  // ignore: unused_field
  final $Res Function(WalletTransaction) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? transaction = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction: transaction == freezed
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as List<WalletTransactionDetail>?,
    ));
  }
}

/// @nodoc
abstract class _$$_WalletTransactionCopyWith<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  factory _$$_WalletTransactionCopyWith(_$_WalletTransaction value,
          $Res Function(_$_WalletTransaction) then) =
      __$$_WalletTransactionCopyWithImpl<$Res>;
  @override
  $Res call({String? date, List<WalletTransactionDetail>? transaction});
}

/// @nodoc
class __$$_WalletTransactionCopyWithImpl<$Res>
    extends _$WalletTransactionCopyWithImpl<$Res>
    implements _$$_WalletTransactionCopyWith<$Res> {
  __$$_WalletTransactionCopyWithImpl(
      _$_WalletTransaction _value, $Res Function(_$_WalletTransaction) _then)
      : super(_value, (v) => _then(v as _$_WalletTransaction));

  @override
  _$_WalletTransaction get _value => super._value as _$_WalletTransaction;

  @override
  $Res call({
    Object? date = freezed,
    Object? transaction = freezed,
  }) {
    return _then(_$_WalletTransaction(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction: transaction == freezed
          ? _value._transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as List<WalletTransactionDetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletTransaction implements _WalletTransaction {
  _$_WalletTransaction(
      {this.date, final List<WalletTransactionDetail>? transaction})
      : _transaction = transaction;

  factory _$_WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_WalletTransactionFromJson(json);

  @override
  final String? date;
  final List<WalletTransactionDetail>? _transaction;
  @override
  List<WalletTransactionDetail>? get transaction {
    final value = _transaction;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WalletTransaction(date: $date, transaction: $transaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletTransaction &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other._transaction, _transaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(_transaction));

  @JsonKey(ignore: true)
  @override
  _$$_WalletTransactionCopyWith<_$_WalletTransaction> get copyWith =>
      __$$_WalletTransactionCopyWithImpl<_$_WalletTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletTransactionToJson(this);
  }
}

abstract class _WalletTransaction implements WalletTransaction {
  factory _WalletTransaction(
      {final String? date,
      final List<WalletTransactionDetail>? transaction}) = _$_WalletTransaction;

  factory _WalletTransaction.fromJson(Map<String, dynamic> json) =
      _$_WalletTransaction.fromJson;

  @override
  String? get date => throw _privateConstructorUsedError;
  @override
  List<WalletTransactionDetail>? get transaction =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WalletTransactionCopyWith<_$_WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
