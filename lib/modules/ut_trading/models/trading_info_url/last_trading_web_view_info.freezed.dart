// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'last_trading_web_view_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewLastTradingInfoUrl _$ViewLastTradingInfoUrlFromJson(
    Map<String, dynamic> json) {
  return _ViewLastTradingInfoUrl.fromJson(json);
}

/// @nodoc
mixin _$ViewLastTradingInfoUrl {
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'link_trading_info')
  String? get linkTradingInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewLastTradingInfoUrlCopyWith<ViewLastTradingInfoUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewLastTradingInfoUrlCopyWith<$Res> {
  factory $ViewLastTradingInfoUrlCopyWith(ViewLastTradingInfoUrl value,
          $Res Function(ViewLastTradingInfoUrl) then) =
      _$ViewLastTradingInfoUrlCopyWithImpl<$Res>;
  $Res call(
      {bool? success,
      @JsonKey(name: 'link_trading_info') String? linkTradingInfo});
}

/// @nodoc
class _$ViewLastTradingInfoUrlCopyWithImpl<$Res>
    implements $ViewLastTradingInfoUrlCopyWith<$Res> {
  _$ViewLastTradingInfoUrlCopyWithImpl(this._value, this._then);

  final ViewLastTradingInfoUrl _value;
  // ignore: unused_field
  final $Res Function(ViewLastTradingInfoUrl) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? linkTradingInfo = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      linkTradingInfo: linkTradingInfo == freezed
          ? _value.linkTradingInfo
          : linkTradingInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ViewLastTradingInfoUrlCopyWith<$Res>
    implements $ViewLastTradingInfoUrlCopyWith<$Res> {
  factory _$$_ViewLastTradingInfoUrlCopyWith(_$_ViewLastTradingInfoUrl value,
          $Res Function(_$_ViewLastTradingInfoUrl) then) =
      __$$_ViewLastTradingInfoUrlCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? success,
      @JsonKey(name: 'link_trading_info') String? linkTradingInfo});
}

/// @nodoc
class __$$_ViewLastTradingInfoUrlCopyWithImpl<$Res>
    extends _$ViewLastTradingInfoUrlCopyWithImpl<$Res>
    implements _$$_ViewLastTradingInfoUrlCopyWith<$Res> {
  __$$_ViewLastTradingInfoUrlCopyWithImpl(_$_ViewLastTradingInfoUrl _value,
      $Res Function(_$_ViewLastTradingInfoUrl) _then)
      : super(_value, (v) => _then(v as _$_ViewLastTradingInfoUrl));

  @override
  _$_ViewLastTradingInfoUrl get _value =>
      super._value as _$_ViewLastTradingInfoUrl;

  @override
  $Res call({
    Object? success = freezed,
    Object? linkTradingInfo = freezed,
  }) {
    return _then(_$_ViewLastTradingInfoUrl(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      linkTradingInfo: linkTradingInfo == freezed
          ? _value.linkTradingInfo
          : linkTradingInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViewLastTradingInfoUrl implements _ViewLastTradingInfoUrl {
  _$_ViewLastTradingInfoUrl(
      {this.success, @JsonKey(name: 'link_trading_info') this.linkTradingInfo});

  factory _$_ViewLastTradingInfoUrl.fromJson(Map<String, dynamic> json) =>
      _$$_ViewLastTradingInfoUrlFromJson(json);

  @override
  final bool? success;
  @override
  @JsonKey(name: 'link_trading_info')
  final String? linkTradingInfo;

  @override
  String toString() {
    return 'ViewLastTradingInfoUrl(success: $success, linkTradingInfo: $linkTradingInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewLastTradingInfoUrl &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality()
                .equals(other.linkTradingInfo, linkTradingInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(linkTradingInfo));

  @JsonKey(ignore: true)
  @override
  _$$_ViewLastTradingInfoUrlCopyWith<_$_ViewLastTradingInfoUrl> get copyWith =>
      __$$_ViewLastTradingInfoUrlCopyWithImpl<_$_ViewLastTradingInfoUrl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewLastTradingInfoUrlToJson(this);
  }
}

abstract class _ViewLastTradingInfoUrl implements ViewLastTradingInfoUrl {
  factory _ViewLastTradingInfoUrl(
          {final bool? success,
          @JsonKey(name: 'link_trading_info') final String? linkTradingInfo}) =
      _$_ViewLastTradingInfoUrl;

  factory _ViewLastTradingInfoUrl.fromJson(Map<String, dynamic> json) =
      _$_ViewLastTradingInfoUrl.fromJson;

  @override
  bool? get success => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'link_trading_info')
  String? get linkTradingInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ViewLastTradingInfoUrlCopyWith<_$_ViewLastTradingInfoUrl> get copyWith =>
      throw _privateConstructorUsedError;
}
