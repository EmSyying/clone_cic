// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bank_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankType _$BankTypeFromJson(Map<String, dynamic> json) {
  return _BankType.fromJson(json);
}

/// @nodoc
mixin _$BankType {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankTypeCopyWith<BankType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankTypeCopyWith<$Res> {
  factory $BankTypeCopyWith(BankType value, $Res Function(BankType) then) =
      _$BankTypeCopyWithImpl<$Res>;
  $Res call({int? id, @JsonKey(name: 'bank_name') String? bankName});
}

/// @nodoc
class _$BankTypeCopyWithImpl<$Res> implements $BankTypeCopyWith<$Res> {
  _$BankTypeCopyWithImpl(this._value, this._then);

  final BankType _value;
  // ignore: unused_field
  final $Res Function(BankType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? bankName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_BankTypeCopyWith<$Res> implements $BankTypeCopyWith<$Res> {
  factory _$$_BankTypeCopyWith(
          _$_BankType value, $Res Function(_$_BankType) then) =
      __$$_BankTypeCopyWithImpl<$Res>;
  @override
  $Res call({int? id, @JsonKey(name: 'bank_name') String? bankName});
}

/// @nodoc
class __$$_BankTypeCopyWithImpl<$Res> extends _$BankTypeCopyWithImpl<$Res>
    implements _$$_BankTypeCopyWith<$Res> {
  __$$_BankTypeCopyWithImpl(
      _$_BankType _value, $Res Function(_$_BankType) _then)
      : super(_value, (v) => _then(v as _$_BankType));

  @override
  _$_BankType get _value => super._value as _$_BankType;

  @override
  $Res call({
    Object? id = freezed,
    Object? bankName = freezed,
  }) {
    return _then(_$_BankType(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankType implements _BankType {
  _$_BankType({this.id, @JsonKey(name: 'bank_name') this.bankName});

  factory _$_BankType.fromJson(Map<String, dynamic> json) =>
      _$$_BankTypeFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'bank_name')
  final String? bankName;

  @override
  String toString() {
    return 'BankType(id: $id, bankName: $bankName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.bankName, bankName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(bankName));

  @JsonKey(ignore: true)
  @override
  _$$_BankTypeCopyWith<_$_BankType> get copyWith =>
      __$$_BankTypeCopyWithImpl<_$_BankType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankTypeToJson(this);
  }
}

abstract class _BankType implements BankType {
  factory _BankType(
      {final int? id,
      @JsonKey(name: 'bank_name') final String? bankName}) = _$_BankType;

  factory _BankType.fromJson(Map<String, dynamic> json) = _$_BankType.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BankTypeCopyWith<_$_BankType> get copyWith =>
      throw _privateConstructorUsedError;
}
