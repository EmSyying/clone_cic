// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contacts _$ContactsFromJson(Map<String, dynamic> json) {
  return _Contacts.fromJson(json);
}

/// @nodoc
mixin _$Contacts {
  String? get phone => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactsCopyWith<Contacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsCopyWith<$Res> {
  factory $ContactsCopyWith(Contacts value, $Res Function(Contacts) then) =
      _$ContactsCopyWithImpl<$Res>;
  $Res call({String? phone, String? mobile});
}

/// @nodoc
class _$ContactsCopyWithImpl<$Res> implements $ContactsCopyWith<$Res> {
  _$ContactsCopyWithImpl(this._value, this._then);

  final Contacts _value;
  // ignore: unused_field
  final $Res Function(Contacts) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? mobile = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ContactsCopyWith<$Res> implements $ContactsCopyWith<$Res> {
  factory _$$_ContactsCopyWith(
          _$_Contacts value, $Res Function(_$_Contacts) then) =
      __$$_ContactsCopyWithImpl<$Res>;
  @override
  $Res call({String? phone, String? mobile});
}

/// @nodoc
class __$$_ContactsCopyWithImpl<$Res> extends _$ContactsCopyWithImpl<$Res>
    implements _$$_ContactsCopyWith<$Res> {
  __$$_ContactsCopyWithImpl(
      _$_Contacts _value, $Res Function(_$_Contacts) _then)
      : super(_value, (v) => _then(v as _$_Contacts));

  @override
  _$_Contacts get _value => super._value as _$_Contacts;

  @override
  $Res call({
    Object? phone = freezed,
    Object? mobile = freezed,
  }) {
    return _then(_$_Contacts(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contacts implements _Contacts {
  _$_Contacts({this.phone, this.mobile});

  factory _$_Contacts.fromJson(Map<String, dynamic> json) =>
      _$$_ContactsFromJson(json);

  @override
  final String? phone;
  @override
  final String? mobile;

  @override
  String toString() {
    return 'Contacts(phone: $phone, mobile: $mobile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contacts &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.mobile, mobile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(mobile));

  @JsonKey(ignore: true)
  @override
  _$$_ContactsCopyWith<_$_Contacts> get copyWith =>
      __$$_ContactsCopyWithImpl<_$_Contacts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactsToJson(this);
  }
}

abstract class _Contacts implements Contacts {
  factory _Contacts({final String? phone, final String? mobile}) = _$_Contacts;

  factory _Contacts.fromJson(Map<String, dynamic> json) = _$_Contacts.fromJson;

  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get mobile => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ContactsCopyWith<_$_Contacts> get copyWith =>
      throw _privateConstructorUsedError;
}
