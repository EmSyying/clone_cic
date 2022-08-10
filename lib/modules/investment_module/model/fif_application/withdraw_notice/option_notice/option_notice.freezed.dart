// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'option_notice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OptionNotice _$OptionNoticeFromJson(Map<String, dynamic> json) {
  return _OptionNotice.fromJson(json);
}

/// @nodoc
mixin _$OptionNotice {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionNoticeCopyWith<OptionNotice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionNoticeCopyWith<$Res> {
  factory $OptionNoticeCopyWith(
          OptionNotice value, $Res Function(OptionNotice) then) =
      _$OptionNoticeCopyWithImpl<$Res>;
  $Res call({String? title, String? description});
}

/// @nodoc
class _$OptionNoticeCopyWithImpl<$Res> implements $OptionNoticeCopyWith<$Res> {
  _$OptionNoticeCopyWithImpl(this._value, this._then);

  final OptionNotice _value;
  // ignore: unused_field
  final $Res Function(OptionNotice) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_OptionNoticeCopyWith<$Res>
    implements $OptionNoticeCopyWith<$Res> {
  factory _$$_OptionNoticeCopyWith(
          _$_OptionNotice value, $Res Function(_$_OptionNotice) then) =
      __$$_OptionNoticeCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? description});
}

/// @nodoc
class __$$_OptionNoticeCopyWithImpl<$Res>
    extends _$OptionNoticeCopyWithImpl<$Res>
    implements _$$_OptionNoticeCopyWith<$Res> {
  __$$_OptionNoticeCopyWithImpl(
      _$_OptionNotice _value, $Res Function(_$_OptionNotice) _then)
      : super(_value, (v) => _then(v as _$_OptionNotice));

  @override
  _$_OptionNotice get _value => super._value as _$_OptionNotice;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_OptionNotice(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OptionNotice implements _OptionNotice {
  _$_OptionNotice({this.title, this.description});

  factory _$_OptionNotice.fromJson(Map<String, dynamic> json) =>
      _$$_OptionNoticeFromJson(json);

  @override
  final String? title;
  @override
  final String? description;

  @override
  String toString() {
    return 'OptionNotice(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OptionNotice &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_OptionNoticeCopyWith<_$_OptionNotice> get copyWith =>
      __$$_OptionNoticeCopyWithImpl<_$_OptionNotice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OptionNoticeToJson(this);
  }
}

abstract class _OptionNotice implements OptionNotice {
  factory _OptionNotice({final String? title, final String? description}) =
      _$_OptionNotice;

  factory _OptionNotice.fromJson(Map<String, dynamic> json) =
      _$_OptionNotice.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OptionNoticeCopyWith<_$_OptionNotice> get copyWith =>
      throw _privateConstructorUsedError;
}
