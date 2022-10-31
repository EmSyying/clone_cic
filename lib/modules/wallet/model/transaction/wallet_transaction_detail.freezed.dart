// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_transaction_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletTransactionDetail _$WalletTransactionDetailFromJson(
    Map<String, dynamic> json) {
  return _WalletTransactionDetail.fromJson(json);
}

/// @nodoc
mixin _$WalletTransactionDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'deposit_method')
  String? get depositMethod => throw _privateConstructorUsedError;
  String? get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type')
  String? get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_nummber')
  String? get bnakAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletTransactionDetailCopyWith<WalletTransactionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionDetailCopyWith<$Res> {
  factory $WalletTransactionDetailCopyWith(WalletTransactionDetail value,
          $Res Function(WalletTransactionDetail) then) =
      _$WalletTransactionDetailCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? label,
      String? amount,
      String? status,
      String? date,
      String? time,
      @JsonKey(name: 'deposit_method') String? depositMethod,
      String? remark,
      @JsonKey(name: 'transaction_type') String? transactionType,
      @JsonKey(name: 'bank_account_nummber') String? bnakAccountNumber,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'transaction_id') String? transactionId});
}

/// @nodoc
class _$WalletTransactionDetailCopyWithImpl<$Res>
    implements $WalletTransactionDetailCopyWith<$Res> {
  _$WalletTransactionDetailCopyWithImpl(this._value, this._then);

  final WalletTransactionDetail _value;
  // ignore: unused_field
  final $Res Function(WalletTransactionDetail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? depositMethod = freezed,
    Object? remark = freezed,
    Object? transactionType = freezed,
    Object? bnakAccountNumber = freezed,
    Object? bankName = freezed,
    Object? transactionId = freezed,
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
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      depositMethod: depositMethod == freezed
          ? _value.depositMethod
          : depositMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: remark == freezed
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      bnakAccountNumber: bnakAccountNumber == freezed
          ? _value.bnakAccountNumber
          : bnakAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_WalletTransactionDetailCopyWith<$Res>
    implements $WalletTransactionDetailCopyWith<$Res> {
  factory _$$_WalletTransactionDetailCopyWith(_$_WalletTransactionDetail value,
          $Res Function(_$_WalletTransactionDetail) then) =
      __$$_WalletTransactionDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? label,
      String? amount,
      String? status,
      String? date,
      String? time,
      @JsonKey(name: 'deposit_method') String? depositMethod,
      String? remark,
      @JsonKey(name: 'transaction_type') String? transactionType,
      @JsonKey(name: 'bank_account_nummber') String? bnakAccountNumber,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'transaction_id') String? transactionId});
}

/// @nodoc
class __$$_WalletTransactionDetailCopyWithImpl<$Res>
    extends _$WalletTransactionDetailCopyWithImpl<$Res>
    implements _$$_WalletTransactionDetailCopyWith<$Res> {
  __$$_WalletTransactionDetailCopyWithImpl(_$_WalletTransactionDetail _value,
      $Res Function(_$_WalletTransactionDetail) _then)
      : super(_value, (v) => _then(v as _$_WalletTransactionDetail));

  @override
  _$_WalletTransactionDetail get _value =>
      super._value as _$_WalletTransactionDetail;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? depositMethod = freezed,
    Object? remark = freezed,
    Object? transactionType = freezed,
    Object? bnakAccountNumber = freezed,
    Object? bankName = freezed,
    Object? transactionId = freezed,
  }) {
    return _then(_$_WalletTransactionDetail(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      depositMethod: depositMethod == freezed
          ? _value.depositMethod
          : depositMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: remark == freezed
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      bnakAccountNumber: bnakAccountNumber == freezed
          ? _value.bnakAccountNumber
          : bnakAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletTransactionDetail implements _WalletTransactionDetail {
  _$_WalletTransactionDetail(
      {this.id,
      this.label,
      this.amount,
      this.status,
      this.date,
      this.time,
      @JsonKey(name: 'deposit_method') this.depositMethod,
      this.remark,
      @JsonKey(name: 'transaction_type') this.transactionType,
      @JsonKey(name: 'bank_account_nummber') this.bnakAccountNumber,
      @JsonKey(name: 'bank_name') this.bankName,
      @JsonKey(name: 'transaction_id') this.transactionId});

  factory _$_WalletTransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$$_WalletTransactionDetailFromJson(json);

  @override
  final int? id;
  @override
  final String? label;
  @override
  final String? amount;
  @override
  final String? status;
  @override
  final String? date;
  @override
  final String? time;
  @override
  @JsonKey(name: 'deposit_method')
  final String? depositMethod;
  @override
  final String? remark;
  @override
  @JsonKey(name: 'transaction_type')
  final String? transactionType;
  @override
  @JsonKey(name: 'bank_account_nummber')
  final String? bnakAccountNumber;
  @override
  @JsonKey(name: 'bank_name')
  final String? bankName;
  @override
  @JsonKey(name: 'transaction_id')
  final String? transactionId;

  @override
  String toString() {
    return 'WalletTransactionDetail(id: $id, label: $label, amount: $amount, status: $status, date: $date, time: $time, depositMethod: $depositMethod, remark: $remark, transactionType: $transactionType, bnakAccountNumber: $bnakAccountNumber, bankName: $bankName, transactionId: $transactionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletTransactionDetail &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.depositMethod, depositMethod) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            const DeepCollectionEquality()
                .equals(other.transactionType, transactionType) &&
            const DeepCollectionEquality()
                .equals(other.bnakAccountNumber, bnakAccountNumber) &&
            const DeepCollectionEquality().equals(other.bankName, bankName) &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(depositMethod),
      const DeepCollectionEquality().hash(remark),
      const DeepCollectionEquality().hash(transactionType),
      const DeepCollectionEquality().hash(bnakAccountNumber),
      const DeepCollectionEquality().hash(bankName),
      const DeepCollectionEquality().hash(transactionId));

  @JsonKey(ignore: true)
  @override
  _$$_WalletTransactionDetailCopyWith<_$_WalletTransactionDetail>
      get copyWith =>
          __$$_WalletTransactionDetailCopyWithImpl<_$_WalletTransactionDetail>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletTransactionDetailToJson(this);
  }
}

abstract class _WalletTransactionDetail implements WalletTransactionDetail {
  factory _WalletTransactionDetail(
      {final int? id,
      final String? label,
      final String? amount,
      final String? status,
      final String? date,
      final String? time,
      @JsonKey(name: 'deposit_method')
          final String? depositMethod,
      final String? remark,
      @JsonKey(name: 'transaction_type')
          final String? transactionType,
      @JsonKey(name: 'bank_account_nummber')
          final String? bnakAccountNumber,
      @JsonKey(name: 'bank_name')
          final String? bankName,
      @JsonKey(name: 'transaction_id')
          final String? transactionId}) = _$_WalletTransactionDetail;

  factory _WalletTransactionDetail.fromJson(Map<String, dynamic> json) =
      _$_WalletTransactionDetail.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get label => throw _privateConstructorUsedError;
  @override
  String? get amount => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get date => throw _privateConstructorUsedError;
  @override
  String? get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'deposit_method')
  String? get depositMethod => throw _privateConstructorUsedError;
  @override
  String? get remark => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'transaction_type')
  String? get transactionType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'bank_account_nummber')
  String? get bnakAccountNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WalletTransactionDetailCopyWith<_$_WalletTransactionDetail>
      get copyWith => throw _privateConstructorUsedError;
}
