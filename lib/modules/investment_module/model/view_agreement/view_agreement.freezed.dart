// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'view_agreement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewAgreement _$ViewAgreementFromJson(Map<String, dynamic> json) {
  return _ViewAgreement.fromJson(json);
}

/// @nodoc
mixin _$ViewAgreement {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_code')
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewAgreementCopyWith<ViewAgreement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewAgreementCopyWith<$Res> {
  factory $ViewAgreementCopyWith(
          ViewAgreement value, $Res Function(ViewAgreement) then) =
      _$ViewAgreementCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'color_code') String? color,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class _$ViewAgreementCopyWithImpl<$Res>
    implements $ViewAgreementCopyWith<$Res> {
  _$ViewAgreementCopyWithImpl(this._value, this._then);

  final ViewAgreement _value;
  // ignore: unused_field
  final $Res Function(ViewAgreement) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? color = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ViewAgreementCopyWith<$Res>
    implements $ViewAgreementCopyWith<$Res> {
  factory _$$_ViewAgreementCopyWith(
          _$_ViewAgreement value, $Res Function(_$_ViewAgreement) then) =
      __$$_ViewAgreementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'color_code') String? color,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class __$$_ViewAgreementCopyWithImpl<$Res>
    extends _$ViewAgreementCopyWithImpl<$Res>
    implements _$$_ViewAgreementCopyWith<$Res> {
  __$$_ViewAgreementCopyWithImpl(
      _$_ViewAgreement _value, $Res Function(_$_ViewAgreement) _then)
      : super(_value, (v) => _then(v as _$_ViewAgreement));

  @override
  _$_ViewAgreement get _value => super._value as _$_ViewAgreement;

  @override
  $Res call({
    Object? url = freezed,
    Object? color = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_ViewAgreement(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViewAgreement implements _ViewAgreement {
  _$_ViewAgreement(
      {@JsonKey(name: 'url') this.url,
      @JsonKey(name: 'color_code') this.color,
      @JsonKey(name: 'title') this.title});

  factory _$_ViewAgreement.fromJson(Map<String, dynamic> json) =>
      _$$_ViewAgreementFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'color_code')
  final String? color;
  @override
  @JsonKey(name: 'title')
  final String? title;

  @override
  String toString() {
    return 'ViewAgreement(url: $url, color: $color, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewAgreement &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_ViewAgreementCopyWith<_$_ViewAgreement> get copyWith =>
      __$$_ViewAgreementCopyWithImpl<_$_ViewAgreement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewAgreementToJson(this);
  }
}

abstract class _ViewAgreement implements ViewAgreement {
  factory _ViewAgreement(
      {@JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'color_code') final String? color,
      @JsonKey(name: 'title') final String? title}) = _$_ViewAgreement;

  factory _ViewAgreement.fromJson(Map<String, dynamic> json) =
      _$_ViewAgreement.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'color_code')
  String? get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ViewAgreementCopyWith<_$_ViewAgreement> get copyWith =>
      throw _privateConstructorUsedError;
}
