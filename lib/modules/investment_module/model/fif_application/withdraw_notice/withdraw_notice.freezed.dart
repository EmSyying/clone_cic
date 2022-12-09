// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_notice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WithdrawNotice _$WithdrawNoticeFromJson(Map<String, dynamic> json) {
  return _WithdrawNotice.fromJson(json);
}

/// @nodoc
mixin _$WithdrawNotice {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<OptionNotice>? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithdrawNoticeCopyWith<WithdrawNotice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawNoticeCopyWith<$Res> {
  factory $WithdrawNoticeCopyWith(
          WithdrawNotice value, $Res Function(WithdrawNotice) then) =
      _$WithdrawNoticeCopyWithImpl<$Res, WithdrawNotice>;
  @useResult
  $Res call({String? title, String? description, List<OptionNotice>? options});
}

/// @nodoc
class _$WithdrawNoticeCopyWithImpl<$Res, $Val extends WithdrawNotice>
    implements $WithdrawNoticeCopyWith<$Res> {
  _$WithdrawNoticeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionNotice>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WithdrawNoticeCopyWith<$Res>
    implements $WithdrawNoticeCopyWith<$Res> {
  factory _$$_WithdrawNoticeCopyWith(
          _$_WithdrawNotice value, $Res Function(_$_WithdrawNotice) then) =
      __$$_WithdrawNoticeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? description, List<OptionNotice>? options});
}

/// @nodoc
class __$$_WithdrawNoticeCopyWithImpl<$Res>
    extends _$WithdrawNoticeCopyWithImpl<$Res, _$_WithdrawNotice>
    implements _$$_WithdrawNoticeCopyWith<$Res> {
  __$$_WithdrawNoticeCopyWithImpl(
      _$_WithdrawNotice _value, $Res Function(_$_WithdrawNotice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? options = freezed,
  }) {
    return _then(_$_WithdrawNotice(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionNotice>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WithdrawNotice implements _WithdrawNotice {
  _$_WithdrawNotice(
      {this.title, this.description, final List<OptionNotice>? options})
      : _options = options;

  factory _$_WithdrawNotice.fromJson(Map<String, dynamic> json) =>
      _$$_WithdrawNoticeFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  final List<OptionNotice>? _options;
  @override
  List<OptionNotice>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WithdrawNotice(title: $title, description: $description, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WithdrawNotice &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WithdrawNoticeCopyWith<_$_WithdrawNotice> get copyWith =>
      __$$_WithdrawNoticeCopyWithImpl<_$_WithdrawNotice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WithdrawNoticeToJson(
      this,
    );
  }
}

abstract class _WithdrawNotice implements WithdrawNotice {
  factory _WithdrawNotice(
      {final String? title,
      final String? description,
      final List<OptionNotice>? options}) = _$_WithdrawNotice;

  factory _WithdrawNotice.fromJson(Map<String, dynamic> json) =
      _$_WithdrawNotice.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  List<OptionNotice>? get options;
  @override
  @JsonKey(ignore: true)
  _$$_WithdrawNoticeCopyWith<_$_WithdrawNotice> get copyWith =>
      throw _privateConstructorUsedError;
}
