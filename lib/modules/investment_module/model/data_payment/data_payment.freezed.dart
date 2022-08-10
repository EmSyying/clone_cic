// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$PaymentDataCopyWithImpl<$Res>;
  $Res call(
      {num? id,
      String? type,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'account_name') String? accounName,
      @JsonKey(name: 'account_number') String? accountNumber,
      String? image});
}

/// @nodoc
class _$PaymentDataCopyWithImpl<$Res> implements $PaymentDataCopyWith<$Res> {
  _$PaymentDataCopyWithImpl(this._value, this._then);

  final PaymentData _value;
  // ignore: unused_field
  final $Res Function(PaymentData) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      accounName: accounName == freezed
          ? _value.accounName
          : accounName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentDataCopyWith<$Res>
    implements $PaymentDataCopyWith<$Res> {
  factory _$$_PaymentDataCopyWith(
          _$_PaymentData value, $Res Function(_$_PaymentData) then) =
      __$$_PaymentDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {num? id,
      String? type,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'account_name') String? accounName,
      @JsonKey(name: 'account_number') String? accountNumber,
      String? image});
}

/// @nodoc
class __$$_PaymentDataCopyWithImpl<$Res> extends _$PaymentDataCopyWithImpl<$Res>
    implements _$$_PaymentDataCopyWith<$Res> {
  __$$_PaymentDataCopyWithImpl(
      _$_PaymentData _value, $Res Function(_$_PaymentData) _then)
      : super(_value, (v) => _then(v as _$_PaymentData));

  @override
  _$_PaymentData get _value => super._value as _$_PaymentData;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      accounName: accounName == freezed
          ? _value.accounName
          : accounName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.bankName, bankName) &&
            const DeepCollectionEquality()
                .equals(other.accounName, accounName) &&
            const DeepCollectionEquality()
                .equals(other.accountNumber, accountNumber) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(bankName),
      const DeepCollectionEquality().hash(accounName),
      const DeepCollectionEquality().hash(accountNumber),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentDataCopyWith<_$_PaymentData> get copyWith =>
      __$$_PaymentDataCopyWithImpl<_$_PaymentData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentDataToJson(this);
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
  num? get id => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'account_name')
  String? get accounName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'account_number')
  String? get accountNumber => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDataCopyWith<_$_PaymentData> get copyWith =>
      throw _privateConstructorUsedError;
}
