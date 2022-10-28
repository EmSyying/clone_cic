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
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type')
  String? get transactionType => throw _privateConstructorUsedError;

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
  $Res call(
      {int? id,
      String? label,
      String? status,
      String? amount,
      String? date,
      String? time,
      @JsonKey(name: 'transaction_type') String? transactionType});
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
    Object? id = freezed,
    Object? label = freezed,
    Object? status = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? transactionType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {int? id,
      String? label,
      String? status,
      String? amount,
      String? date,
      String? time,
      @JsonKey(name: 'transaction_type') String? transactionType});
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
    Object? id = freezed,
    Object? label = freezed,
    Object? status = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? transactionType = freezed,
  }) {
    return _then(_$_WalletTransaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletTransaction implements _WalletTransaction {
  _$_WalletTransaction(
      {this.id,
      this.label,
      this.status,
      this.amount,
      this.date,
      this.time,
      @JsonKey(name: 'transaction_type') this.transactionType});

  factory _$_WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_WalletTransactionFromJson(json);

  @override
  final int? id;
  @override
  final String? label;
  @override
  final String? status;
  @override
  final String? amount;
  @override
  final String? date;
  @override
  final String? time;
  @override
  @JsonKey(name: 'transaction_type')
  final String? transactionType;

  @override
  String toString() {
    return 'WalletTransaction(id: $id, label: $label, status: $status, amount: $amount, date: $date, time: $time, transactionType: $transactionType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletTransaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.transactionType, transactionType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(transactionType));

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
          {final int? id,
          final String? label,
          final String? status,
          final String? amount,
          final String? date,
          final String? time,
          @JsonKey(name: 'transaction_type') final String? transactionType}) =
      _$_WalletTransaction;

  factory _WalletTransaction.fromJson(Map<String, dynamic> json) =
      _$_WalletTransaction.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get label => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get amount => throw _privateConstructorUsedError;
  @override
  String? get date => throw _privateConstructorUsedError;
  @override
  String? get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'transaction_type')
  String? get transactionType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WalletTransactionCopyWith<_$_WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
