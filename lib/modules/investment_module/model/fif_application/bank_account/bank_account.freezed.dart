// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return _BankAccount.fromJson(json);
}

/// @nodoc
mixin _$BankAccount {
  int? get id => throw _privateConstructorUsedError;
  String? get account => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountCopyWith<BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
          BankAccount value, $Res Function(BankAccount) then) =
      _$BankAccountCopyWithImpl<$Res, BankAccount>;
  @useResult
  $Res call({int? id, String? account});
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res, $Val extends BankAccount>
    implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankAccountCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$$_BankAccountCopyWith(
          _$_BankAccount value, $Res Function(_$_BankAccount) then) =
      __$$_BankAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? account});
}

/// @nodoc
class __$$_BankAccountCopyWithImpl<$Res>
    extends _$BankAccountCopyWithImpl<$Res, _$_BankAccount>
    implements _$$_BankAccountCopyWith<$Res> {
  __$$_BankAccountCopyWithImpl(
      _$_BankAccount _value, $Res Function(_$_BankAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? account = freezed,
  }) {
    return _then(_$_BankAccount(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankAccount implements _BankAccount {
  _$_BankAccount({this.id, this.account});

  factory _$_BankAccount.fromJson(Map<String, dynamic> json) =>
      _$$_BankAccountFromJson(json);

  @override
  final int? id;
  @override
  final String? account;

  @override
  String toString() {
    return 'BankAccount(id: $id, account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.account, account) || other.account == account));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankAccountCopyWith<_$_BankAccount> get copyWith =>
      __$$_BankAccountCopyWithImpl<_$_BankAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankAccountToJson(
      this,
    );
  }
}

abstract class _BankAccount implements BankAccount {
  factory _BankAccount({final int? id, final String? account}) = _$_BankAccount;

  factory _BankAccount.fromJson(Map<String, dynamic> json) =
      _$_BankAccount.fromJson;

  @override
  int? get id;
  @override
  String? get account;
  @override
  @JsonKey(ignore: true)
  _$$_BankAccountCopyWith<_$_BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
