// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "label")
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "remark")
  String? get remark => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: "point_amount")
  String? get pointAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "deposit_method")
  String? get depositMethod => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_name")
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: "transaction_type")
  String? get transactionType => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: "transaction_id")
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_account_number")
  String? get bankAccountNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletTransactionDetailCopyWith<WalletTransactionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionDetailCopyWith<$Res> {
  factory $WalletTransactionDetailCopyWith(WalletTransactionDetail value,
          $Res Function(WalletTransactionDetail) then) =
      _$WalletTransactionDetailCopyWithImpl<$Res, WalletTransactionDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "label") String? label,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "remark") String? remark,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "time") String? time,
      @JsonKey(name: "point_amount") String? pointAmount,
      @JsonKey(name: "deposit_method") String? depositMethod,
      @JsonKey(name: "bank_name") String? bankName,
      @JsonKey(name: "transaction_type") String? transactionType,
      String? model,
      @JsonKey(name: "transaction_id") String? transactionId,
      @JsonKey(name: "bank_account_number") String? bankAccountNumber});
}

/// @nodoc
class _$WalletTransactionDetailCopyWithImpl<$Res,
        $Val extends WalletTransactionDetail>
    implements $WalletTransactionDetailCopyWith<$Res> {
  _$WalletTransactionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? remark = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? pointAmount = freezed,
    Object? depositMethod = freezed,
    Object? bankName = freezed,
    Object? transactionType = freezed,
    Object? model = freezed,
    Object? transactionId = freezed,
    Object? bankAccountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      pointAmount: freezed == pointAmount
          ? _value.pointAmount
          : pointAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      depositMethod: freezed == depositMethod
          ? _value.depositMethod
          : depositMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletTransactionDetailCopyWith<$Res>
    implements $WalletTransactionDetailCopyWith<$Res> {
  factory _$$_WalletTransactionDetailCopyWith(_$_WalletTransactionDetail value,
          $Res Function(_$_WalletTransactionDetail) then) =
      __$$_WalletTransactionDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "label") String? label,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "remark") String? remark,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "time") String? time,
      @JsonKey(name: "point_amount") String? pointAmount,
      @JsonKey(name: "deposit_method") String? depositMethod,
      @JsonKey(name: "bank_name") String? bankName,
      @JsonKey(name: "transaction_type") String? transactionType,
      String? model,
      @JsonKey(name: "transaction_id") String? transactionId,
      @JsonKey(name: "bank_account_number") String? bankAccountNumber});
}

/// @nodoc
class __$$_WalletTransactionDetailCopyWithImpl<$Res>
    extends _$WalletTransactionDetailCopyWithImpl<$Res,
        _$_WalletTransactionDetail>
    implements _$$_WalletTransactionDetailCopyWith<$Res> {
  __$$_WalletTransactionDetailCopyWithImpl(_$_WalletTransactionDetail _value,
      $Res Function(_$_WalletTransactionDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? remark = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? pointAmount = freezed,
    Object? depositMethod = freezed,
    Object? bankName = freezed,
    Object? transactionType = freezed,
    Object? model = freezed,
    Object? transactionId = freezed,
    Object? bankAccountNumber = freezed,
  }) {
    return _then(_$_WalletTransactionDetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      pointAmount: freezed == pointAmount
          ? _value.pointAmount
          : pointAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      depositMethod: freezed == depositMethod
          ? _value.depositMethod
          : depositMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletTransactionDetail implements _WalletTransactionDetail {
  _$_WalletTransactionDetail(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "label") this.label,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "remark") this.remark,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "time") this.time,
      @JsonKey(name: "point_amount") this.pointAmount,
      @JsonKey(name: "deposit_method") this.depositMethod,
      @JsonKey(name: "bank_name") this.bankName,
      @JsonKey(name: "transaction_type") this.transactionType,
      this.model,
      @JsonKey(name: "transaction_id") this.transactionId,
      @JsonKey(name: "bank_account_number") this.bankAccountNumber});

  factory _$_WalletTransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$$_WalletTransactionDetailFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "label")
  final String? label;
  @override
  @JsonKey(name: "amount")
  final String? amount;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "remark")
  final String? remark;
  @override
  @JsonKey(name: "date")
  final String? date;
  @override
  @JsonKey(name: "time")
  final String? time;
  @override
  @JsonKey(name: "point_amount")
  final String? pointAmount;
  @override
  @JsonKey(name: "deposit_method")
  final String? depositMethod;
  @override
  @JsonKey(name: "bank_name")
  final String? bankName;
  @override
  @JsonKey(name: "transaction_type")
  final String? transactionType;
  @override
  final String? model;
  @override
  @JsonKey(name: "transaction_id")
  final String? transactionId;
  @override
  @JsonKey(name: "bank_account_number")
  final String? bankAccountNumber;

  @override
  String toString() {
    return 'WalletTransactionDetail(id: $id, label: $label, amount: $amount, status: $status, remark: $remark, date: $date, time: $time, pointAmount: $pointAmount, depositMethod: $depositMethod, bankName: $bankName, transactionType: $transactionType, model: $model, transactionId: $transactionId, bankAccountNumber: $bankAccountNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletTransactionDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.pointAmount, pointAmount) ||
                other.pointAmount == pointAmount) &&
            (identical(other.depositMethod, depositMethod) ||
                other.depositMethod == depositMethod) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      amount,
      status,
      remark,
      date,
      time,
      pointAmount,
      depositMethod,
      bankName,
      transactionType,
      model,
      transactionId,
      bankAccountNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletTransactionDetailCopyWith<_$_WalletTransactionDetail>
      get copyWith =>
          __$$_WalletTransactionDetailCopyWithImpl<_$_WalletTransactionDetail>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletTransactionDetailToJson(
      this,
    );
  }
}

abstract class _WalletTransactionDetail implements WalletTransactionDetail {
  factory _WalletTransactionDetail(
      {@JsonKey(name: "id")
          final int? id,
      @JsonKey(name: "label")
          final String? label,
      @JsonKey(name: "amount")
          final String? amount,
      @JsonKey(name: "status")
          final String? status,
      @JsonKey(name: "remark")
          final String? remark,
      @JsonKey(name: "date")
          final String? date,
      @JsonKey(name: "time")
          final String? time,
      @JsonKey(name: "point_amount")
          final String? pointAmount,
      @JsonKey(name: "deposit_method")
          final String? depositMethod,
      @JsonKey(name: "bank_name")
          final String? bankName,
      @JsonKey(name: "transaction_type")
          final String? transactionType,
      final String? model,
      @JsonKey(name: "transaction_id")
          final String? transactionId,
      @JsonKey(name: "bank_account_number")
          final String? bankAccountNumber}) = _$_WalletTransactionDetail;

  factory _WalletTransactionDetail.fromJson(Map<String, dynamic> json) =
      _$_WalletTransactionDetail.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "label")
  String? get label;
  @override
  @JsonKey(name: "amount")
  String? get amount;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "remark")
  String? get remark;
  @override
  @JsonKey(name: "date")
  String? get date;
  @override
  @JsonKey(name: "time")
  String? get time;
  @override
  @JsonKey(name: "point_amount")
  String? get pointAmount;
  @override
  @JsonKey(name: "deposit_method")
  String? get depositMethod;
  @override
  @JsonKey(name: "bank_name")
  String? get bankName;
  @override
  @JsonKey(name: "transaction_type")
  String? get transactionType;
  @override
  String? get model;
  @override
  @JsonKey(name: "transaction_id")
  String? get transactionId;
  @override
  @JsonKey(name: "bank_account_number")
  String? get bankAccountNumber;
  @override
  @JsonKey(ignore: true)
  _$$_WalletTransactionDetailCopyWith<_$_WalletTransactionDetail>
      get copyWith => throw _privateConstructorUsedError;
}
