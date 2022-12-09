// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContractHistory _$ContractHistoryFromJson(Map<String, dynamic> json) {
  return _ContractHistory.fromJson(json);
}

/// @nodoc
mixin _$ContractHistory {
  num? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name')
  String? get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'investment_amount')
  String? get investmentAmount => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  bool? get hide => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get firstPaymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_amount')
  num? get originalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_payment_method')
  String? get returnPaymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'mma_account_id')
  num? get mmaAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_id')
  num? get bankId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractHistoryCopyWith<ContractHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractHistoryCopyWith<$Res> {
  factory $ContractHistoryCopyWith(
          ContractHistory value, $Res Function(ContractHistory) then) =
      _$ContractHistoryCopyWithImpl<$Res, ContractHistory>;
  @useResult
  $Res call(
      {num? id,
      @JsonKey(name: 'account_name') String? accountName,
      @JsonKey(name: 'investment_amount') String? investmentAmount,
      String? code,
      bool? hide,
      String? color,
      String? status,
      @JsonKey(name: 'date') String? firstPaymentDate,
      @JsonKey(name: 'original_amount') num? originalAmount,
      @JsonKey(name: 'return_payment_method') String? returnPaymentMethod,
      @JsonKey(name: 'mma_account_id') num? mmaAccountId,
      @JsonKey(name: 'bank_id') num? bankId});
}

/// @nodoc
class _$ContractHistoryCopyWithImpl<$Res, $Val extends ContractHistory>
    implements $ContractHistoryCopyWith<$Res> {
  _$ContractHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accountName = freezed,
    Object? investmentAmount = freezed,
    Object? code = freezed,
    Object? hide = freezed,
    Object? color = freezed,
    Object? status = freezed,
    Object? firstPaymentDate = freezed,
    Object? originalAmount = freezed,
    Object? returnPaymentMethod = freezed,
    Object? mmaAccountId = freezed,
    Object? bankId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentAmount: freezed == investmentAmount
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      hide: freezed == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      firstPaymentDate: freezed == firstPaymentDate
          ? _value.firstPaymentDate
          : firstPaymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      originalAmount: freezed == originalAmount
          ? _value.originalAmount
          : originalAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      returnPaymentMethod: freezed == returnPaymentMethod
          ? _value.returnPaymentMethod
          : returnPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      mmaAccountId: freezed == mmaAccountId
          ? _value.mmaAccountId
          : mmaAccountId // ignore: cast_nullable_to_non_nullable
              as num?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContractHistoryCopyWith<$Res>
    implements $ContractHistoryCopyWith<$Res> {
  factory _$$_ContractHistoryCopyWith(
          _$_ContractHistory value, $Res Function(_$_ContractHistory) then) =
      __$$_ContractHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? id,
      @JsonKey(name: 'account_name') String? accountName,
      @JsonKey(name: 'investment_amount') String? investmentAmount,
      String? code,
      bool? hide,
      String? color,
      String? status,
      @JsonKey(name: 'date') String? firstPaymentDate,
      @JsonKey(name: 'original_amount') num? originalAmount,
      @JsonKey(name: 'return_payment_method') String? returnPaymentMethod,
      @JsonKey(name: 'mma_account_id') num? mmaAccountId,
      @JsonKey(name: 'bank_id') num? bankId});
}

/// @nodoc
class __$$_ContractHistoryCopyWithImpl<$Res>
    extends _$ContractHistoryCopyWithImpl<$Res, _$_ContractHistory>
    implements _$$_ContractHistoryCopyWith<$Res> {
  __$$_ContractHistoryCopyWithImpl(
      _$_ContractHistory _value, $Res Function(_$_ContractHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accountName = freezed,
    Object? investmentAmount = freezed,
    Object? code = freezed,
    Object? hide = freezed,
    Object? color = freezed,
    Object? status = freezed,
    Object? firstPaymentDate = freezed,
    Object? originalAmount = freezed,
    Object? returnPaymentMethod = freezed,
    Object? mmaAccountId = freezed,
    Object? bankId = freezed,
  }) {
    return _then(_$_ContractHistory(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentAmount: freezed == investmentAmount
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      hide: freezed == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      firstPaymentDate: freezed == firstPaymentDate
          ? _value.firstPaymentDate
          : firstPaymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      originalAmount: freezed == originalAmount
          ? _value.originalAmount
          : originalAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      returnPaymentMethod: freezed == returnPaymentMethod
          ? _value.returnPaymentMethod
          : returnPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      mmaAccountId: freezed == mmaAccountId
          ? _value.mmaAccountId
          : mmaAccountId // ignore: cast_nullable_to_non_nullable
              as num?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContractHistory implements _ContractHistory {
  _$_ContractHistory(
      {this.id,
      @JsonKey(name: 'account_name') this.accountName,
      @JsonKey(name: 'investment_amount') this.investmentAmount,
      this.code,
      this.hide,
      this.color,
      this.status,
      @JsonKey(name: 'date') this.firstPaymentDate,
      @JsonKey(name: 'original_amount') this.originalAmount,
      @JsonKey(name: 'return_payment_method') this.returnPaymentMethod,
      @JsonKey(name: 'mma_account_id') this.mmaAccountId,
      @JsonKey(name: 'bank_id') this.bankId});

  factory _$_ContractHistory.fromJson(Map<String, dynamic> json) =>
      _$$_ContractHistoryFromJson(json);

  @override
  final num? id;
  @override
  @JsonKey(name: 'account_name')
  final String? accountName;
  @override
  @JsonKey(name: 'investment_amount')
  final String? investmentAmount;
  @override
  final String? code;
  @override
  final bool? hide;
  @override
  final String? color;
  @override
  final String? status;
  @override
  @JsonKey(name: 'date')
  final String? firstPaymentDate;
  @override
  @JsonKey(name: 'original_amount')
  final num? originalAmount;
  @override
  @JsonKey(name: 'return_payment_method')
  final String? returnPaymentMethod;
  @override
  @JsonKey(name: 'mma_account_id')
  final num? mmaAccountId;
  @override
  @JsonKey(name: 'bank_id')
  final num? bankId;

  @override
  String toString() {
    return 'ContractHistory(id: $id, accountName: $accountName, investmentAmount: $investmentAmount, code: $code, hide: $hide, color: $color, status: $status, firstPaymentDate: $firstPaymentDate, originalAmount: $originalAmount, returnPaymentMethod: $returnPaymentMethod, mmaAccountId: $mmaAccountId, bankId: $bankId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContractHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.investmentAmount, investmentAmount) ||
                other.investmentAmount == investmentAmount) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.hide, hide) || other.hide == hide) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firstPaymentDate, firstPaymentDate) ||
                other.firstPaymentDate == firstPaymentDate) &&
            (identical(other.originalAmount, originalAmount) ||
                other.originalAmount == originalAmount) &&
            (identical(other.returnPaymentMethod, returnPaymentMethod) ||
                other.returnPaymentMethod == returnPaymentMethod) &&
            (identical(other.mmaAccountId, mmaAccountId) ||
                other.mmaAccountId == mmaAccountId) &&
            (identical(other.bankId, bankId) || other.bankId == bankId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accountName,
      investmentAmount,
      code,
      hide,
      color,
      status,
      firstPaymentDate,
      originalAmount,
      returnPaymentMethod,
      mmaAccountId,
      bankId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContractHistoryCopyWith<_$_ContractHistory> get copyWith =>
      __$$_ContractHistoryCopyWithImpl<_$_ContractHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContractHistoryToJson(
      this,
    );
  }
}

abstract class _ContractHistory implements ContractHistory {
  factory _ContractHistory(
      {final num? id,
      @JsonKey(name: 'account_name') final String? accountName,
      @JsonKey(name: 'investment_amount') final String? investmentAmount,
      final String? code,
      final bool? hide,
      final String? color,
      final String? status,
      @JsonKey(name: 'date') final String? firstPaymentDate,
      @JsonKey(name: 'original_amount') final num? originalAmount,
      @JsonKey(name: 'return_payment_method') final String? returnPaymentMethod,
      @JsonKey(name: 'mma_account_id') final num? mmaAccountId,
      @JsonKey(name: 'bank_id') final num? bankId}) = _$_ContractHistory;

  factory _ContractHistory.fromJson(Map<String, dynamic> json) =
      _$_ContractHistory.fromJson;

  @override
  num? get id;
  @override
  @JsonKey(name: 'account_name')
  String? get accountName;
  @override
  @JsonKey(name: 'investment_amount')
  String? get investmentAmount;
  @override
  String? get code;
  @override
  bool? get hide;
  @override
  String? get color;
  @override
  String? get status;
  @override
  @JsonKey(name: 'date')
  String? get firstPaymentDate;
  @override
  @JsonKey(name: 'original_amount')
  num? get originalAmount;
  @override
  @JsonKey(name: 'return_payment_method')
  String? get returnPaymentMethod;
  @override
  @JsonKey(name: 'mma_account_id')
  num? get mmaAccountId;
  @override
  @JsonKey(name: 'bank_id')
  num? get bankId;
  @override
  @JsonKey(ignore: true)
  _$$_ContractHistoryCopyWith<_$_ContractHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
