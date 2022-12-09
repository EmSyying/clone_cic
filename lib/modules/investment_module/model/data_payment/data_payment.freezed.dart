// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) {
  return _PaymentData.fromJson(json);
}

/// @nodoc
mixin _$PaymentData {
  num? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name')
  String? get accounName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number')
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDataCopyWith<PaymentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDataCopyWith<$Res> {
  factory $PaymentDataCopyWith(
          PaymentData value, $Res Function(PaymentData) then) =
      _$PaymentDataCopyWithImpl<$Res, PaymentData>;
  @useResult
  $Res call(
      {num? id,
      String? type,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'account_name') String? accounName,
      @JsonKey(name: 'account_number') String? accountNumber,
      String? image});
}

/// @nodoc
class _$PaymentDataCopyWithImpl<$Res, $Val extends PaymentData>
    implements $PaymentDataCopyWith<$Res> {
  _$PaymentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? bankName = freezed,
    Object? accounName = freezed,
    Object? accountNumber = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      accounName: freezed == accounName
          ? _value.accounName
          : accounName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentDataCopyWith<$Res>
    implements $PaymentDataCopyWith<$Res> {
  factory _$$_PaymentDataCopyWith(
          _$_PaymentData value, $Res Function(_$_PaymentData) then) =
      __$$_PaymentDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? id,
      String? type,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'account_name') String? accounName,
      @JsonKey(name: 'account_number') String? accountNumber,
      String? image});
}

/// @nodoc
class __$$_PaymentDataCopyWithImpl<$Res>
    extends _$PaymentDataCopyWithImpl<$Res, _$_PaymentData>
    implements _$$_PaymentDataCopyWith<$Res> {
  __$$_PaymentDataCopyWithImpl(
      _$_PaymentData _value, $Res Function(_$_PaymentData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? bankName = freezed,
    Object? accounName = freezed,
    Object? accountNumber = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_PaymentData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      accounName: freezed == accounName
          ? _value.accounName
          : accounName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentData implements _PaymentData {
  _$_PaymentData(
      {this.id,
      this.type,
      @JsonKey(name: 'bank_name') this.bankName,
      @JsonKey(name: 'account_name') this.accounName,
      @JsonKey(name: 'account_number') this.accountNumber,
      this.image});

  factory _$_PaymentData.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentDataFromJson(json);

  @override
  final num? id;
  @override
  final String? type;
  @override
  @JsonKey(name: 'bank_name')
  final String? bankName;
  @override
  @JsonKey(name: 'account_name')
  final String? accounName;
  @override
  @JsonKey(name: 'account_number')
  final String? accountNumber;
  @override
  final String? image;

  @override
  String toString() {
    return 'PaymentData(id: $id, type: $type, bankName: $bankName, accounName: $accounName, accountNumber: $accountNumber, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accounName, accounName) ||
                other.accounName == accounName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, bankName, accounName, accountNumber, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentDataCopyWith<_$_PaymentData> get copyWith =>
      __$$_PaymentDataCopyWithImpl<_$_PaymentData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentDataToJson(
      this,
    );
  }
}

abstract class _PaymentData implements PaymentData {
  factory _PaymentData(
      {final num? id,
      final String? type,
      @JsonKey(name: 'bank_name') final String? bankName,
      @JsonKey(name: 'account_name') final String? accounName,
      @JsonKey(name: 'account_number') final String? accountNumber,
      final String? image}) = _$_PaymentData;

  factory _PaymentData.fromJson(Map<String, dynamic> json) =
      _$_PaymentData.fromJson;

  @override
  num? get id;
  @override
  String? get type;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName;
  @override
  @JsonKey(name: 'account_name')
  String? get accounName;
  @override
  @JsonKey(name: 'account_number')
  String? get accountNumber;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDataCopyWith<_$_PaymentData> get copyWith =>
      throw _privateConstructorUsedError;
}
