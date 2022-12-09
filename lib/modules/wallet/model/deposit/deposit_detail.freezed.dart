// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DepositDetail _$DepositDetailFromJson(Map<String, dynamic> json) {
  return _DepositDetail.fromJson(json);
}

/// @nodoc
mixin _$DepositDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deposit_method')
  String? get depositMethod => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepositDetailCopyWith<DepositDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositDetailCopyWith<$Res> {
  factory $DepositDetailCopyWith(
          DepositDetail value, $Res Function(DepositDetail) then) =
      _$DepositDetailCopyWithImpl<$Res, DepositDetail>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      @JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'deposit_method') String? depositMethod,
      String? date,
      String? time,
      String? amount});
}

/// @nodoc
class _$DepositDetailCopyWithImpl<$Res, $Val extends DepositDetail>
    implements $DepositDetailCopyWith<$Res> {
  _$DepositDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? transactionId = freezed,
    Object? depositMethod = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      depositMethod: freezed == depositMethod
          ? _value.depositMethod
          : depositMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DepositDetailCopyWith<$Res>
    implements $DepositDetailCopyWith<$Res> {
  factory _$$_DepositDetailCopyWith(
          _$_DepositDetail value, $Res Function(_$_DepositDetail) then) =
      __$$_DepositDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      @JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'deposit_method') String? depositMethod,
      String? date,
      String? time,
      String? amount});
}

/// @nodoc
class __$$_DepositDetailCopyWithImpl<$Res>
    extends _$DepositDetailCopyWithImpl<$Res, _$_DepositDetail>
    implements _$$_DepositDetailCopyWith<$Res> {
  __$$_DepositDetailCopyWithImpl(
      _$_DepositDetail _value, $Res Function(_$_DepositDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? transactionId = freezed,
    Object? depositMethod = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$_DepositDetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      depositMethod: freezed == depositMethod
          ? _value.depositMethod
          : depositMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DepositDetail implements _DepositDetail {
  _$_DepositDetail(
      {this.id,
      this.title,
      @JsonKey(name: 'transaction_id') this.transactionId,
      @JsonKey(name: 'deposit_method') this.depositMethod,
      this.date,
      this.time,
      this.amount});

  factory _$_DepositDetail.fromJson(Map<String, dynamic> json) =>
      _$$_DepositDetailFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @override
  @JsonKey(name: 'deposit_method')
  final String? depositMethod;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? amount;

  @override
  String toString() {
    return 'DepositDetail(id: $id, title: $title, transactionId: $transactionId, depositMethod: $depositMethod, date: $date, time: $time, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DepositDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.depositMethod, depositMethod) ||
                other.depositMethod == depositMethod) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, transactionId, depositMethod, date, time, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DepositDetailCopyWith<_$_DepositDetail> get copyWith =>
      __$$_DepositDetailCopyWithImpl<_$_DepositDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DepositDetailToJson(
      this,
    );
  }
}

abstract class _DepositDetail implements DepositDetail {
  factory _DepositDetail(
      {final int? id,
      final String? title,
      @JsonKey(name: 'transaction_id') final String? transactionId,
      @JsonKey(name: 'deposit_method') final String? depositMethod,
      final String? date,
      final String? time,
      final String? amount}) = _$_DepositDetail;

  factory _DepositDetail.fromJson(Map<String, dynamic> json) =
      _$_DepositDetail.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'transaction_id')
  String? get transactionId;
  @override
  @JsonKey(name: 'deposit_method')
  String? get depositMethod;
  @override
  String? get date;
  @override
  String? get time;
  @override
  String? get amount;
  @override
  @JsonKey(ignore: true)
  _$$_DepositDetailCopyWith<_$_DepositDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
