// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_point_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExchangePointTransaction _$ExchangePointTransactionFromJson(
    Map<String, dynamic> json) {
  return _ExchangePointTransaction.fromJson(json);
}

/// @nodoc
mixin _$ExchangePointTransaction {
  int? get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExchangePointTransactionCopyWith<ExchangePointTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangePointTransactionCopyWith<$Res> {
  factory $ExchangePointTransactionCopyWith(ExchangePointTransaction value,
          $Res Function(ExchangePointTransaction) then) =
      _$ExchangePointTransactionCopyWithImpl<$Res, ExchangePointTransaction>;
  @useResult
  $Res call({int? id, String? description, String? amount, String? date});
}

/// @nodoc
class _$ExchangePointTransactionCopyWithImpl<$Res,
        $Val extends ExchangePointTransaction>
    implements $ExchangePointTransactionCopyWith<$Res> {
  _$ExchangePointTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExchangePointTransactionCopyWith<$Res>
    implements $ExchangePointTransactionCopyWith<$Res> {
  factory _$$_ExchangePointTransactionCopyWith(
          _$_ExchangePointTransaction value,
          $Res Function(_$_ExchangePointTransaction) then) =
      __$$_ExchangePointTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? description, String? amount, String? date});
}

/// @nodoc
class __$$_ExchangePointTransactionCopyWithImpl<$Res>
    extends _$ExchangePointTransactionCopyWithImpl<$Res,
        _$_ExchangePointTransaction>
    implements _$$_ExchangePointTransactionCopyWith<$Res> {
  __$$_ExchangePointTransactionCopyWithImpl(_$_ExchangePointTransaction _value,
      $Res Function(_$_ExchangePointTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_ExchangePointTransaction(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExchangePointTransaction implements _ExchangePointTransaction {
  _$_ExchangePointTransaction(
      {this.id, this.description, this.amount, this.date});

  factory _$_ExchangePointTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_ExchangePointTransactionFromJson(json);

  @override
  final int? id;
  @override
  final String? description;
  @override
  final String? amount;
  @override
  final String? date;

  @override
  String toString() {
    return 'ExchangePointTransaction(id: $id, description: $description, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExchangePointTransaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, amount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExchangePointTransactionCopyWith<_$_ExchangePointTransaction>
      get copyWith => __$$_ExchangePointTransactionCopyWithImpl<
          _$_ExchangePointTransaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExchangePointTransactionToJson(
      this,
    );
  }
}

abstract class _ExchangePointTransaction implements ExchangePointTransaction {
  factory _ExchangePointTransaction(
      {final int? id,
      final String? description,
      final String? amount,
      final String? date}) = _$_ExchangePointTransaction;

  factory _ExchangePointTransaction.fromJson(Map<String, dynamic> json) =
      _$_ExchangePointTransaction.fromJson;

  @override
  int? get id;
  @override
  String? get description;
  @override
  String? get amount;
  @override
  String? get date;
  @override
  @JsonKey(ignore: true)
  _$$_ExchangePointTransactionCopyWith<_$_ExchangePointTransaction>
      get copyWith => throw _privateConstructorUsedError;
}
