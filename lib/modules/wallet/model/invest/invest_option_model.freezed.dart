// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invest_option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvestOptionModel _$InvestOptionModelFromJson(Map<String, dynamic> json) {
  return _InvestOptionModel.fromJson(json);
}

/// @nodoc
mixin _$InvestOptionModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get background => throw _privateConstructorUsedError;
  @JsonKey(name: 'explore_more')
  String? get exploreMore => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  @JsonKey(name: 'detail')
  List<FiFDetailModel>? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestOptionModelCopyWith<InvestOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestOptionModelCopyWith<$Res> {
  factory $InvestOptionModelCopyWith(
          InvestOptionModel value, $Res Function(InvestOptionModel) then) =
      _$InvestOptionModelCopyWithImpl<$Res, InvestOptionModel>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? background,
      @JsonKey(name: 'explore_more') String? exploreMore,
      String? route,
      @JsonKey(name: 'detail') List<FiFDetailModel>? details});
}

/// @nodoc
class _$InvestOptionModelCopyWithImpl<$Res, $Val extends InvestOptionModel>
    implements $InvestOptionModelCopyWith<$Res> {
  _$InvestOptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? background = freezed,
    Object? exploreMore = freezed,
    Object? route = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      exploreMore: freezed == exploreMore
          ? _value.exploreMore
          : exploreMore // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<FiFDetailModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvestOptionModelCopyWith<$Res>
    implements $InvestOptionModelCopyWith<$Res> {
  factory _$$_InvestOptionModelCopyWith(_$_InvestOptionModel value,
          $Res Function(_$_InvestOptionModel) then) =
      __$$_InvestOptionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? background,
      @JsonKey(name: 'explore_more') String? exploreMore,
      String? route,
      @JsonKey(name: 'detail') List<FiFDetailModel>? details});
}

/// @nodoc
class __$$_InvestOptionModelCopyWithImpl<$Res>
    extends _$InvestOptionModelCopyWithImpl<$Res, _$_InvestOptionModel>
    implements _$$_InvestOptionModelCopyWith<$Res> {
  __$$_InvestOptionModelCopyWithImpl(
      _$_InvestOptionModel _value, $Res Function(_$_InvestOptionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? background = freezed,
    Object? exploreMore = freezed,
    Object? route = freezed,
    Object? details = freezed,
  }) {
    return _then(_$_InvestOptionModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      exploreMore: freezed == exploreMore
          ? _value.exploreMore
          : exploreMore // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<FiFDetailModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvestOptionModel implements _InvestOptionModel {
  _$_InvestOptionModel(
      {this.id,
      this.title,
      this.background,
      @JsonKey(name: 'explore_more') this.exploreMore,
      this.route,
      @JsonKey(name: 'detail') final List<FiFDetailModel>? details})
      : _details = details;

  factory _$_InvestOptionModel.fromJson(Map<String, dynamic> json) =>
      _$$_InvestOptionModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? background;
  @override
  @JsonKey(name: 'explore_more')
  final String? exploreMore;
  @override
  final String? route;
  final List<FiFDetailModel>? _details;
  @override
  @JsonKey(name: 'detail')
  List<FiFDetailModel>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InvestOptionModel(id: $id, title: $title, background: $background, exploreMore: $exploreMore, route: $route, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvestOptionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.exploreMore, exploreMore) ||
                other.exploreMore == exploreMore) &&
            (identical(other.route, route) || other.route == route) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, background,
      exploreMore, route, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvestOptionModelCopyWith<_$_InvestOptionModel> get copyWith =>
      __$$_InvestOptionModelCopyWithImpl<_$_InvestOptionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvestOptionModelToJson(
      this,
    );
  }
}

abstract class _InvestOptionModel implements InvestOptionModel {
  factory _InvestOptionModel(
          {final int? id,
          final String? title,
          final String? background,
          @JsonKey(name: 'explore_more') final String? exploreMore,
          final String? route,
          @JsonKey(name: 'detail') final List<FiFDetailModel>? details}) =
      _$_InvestOptionModel;

  factory _InvestOptionModel.fromJson(Map<String, dynamic> json) =
      _$_InvestOptionModel.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get background;
  @override
  @JsonKey(name: 'explore_more')
  String? get exploreMore;
  @override
  String? get route;
  @override
  @JsonKey(name: 'detail')
  List<FiFDetailModel>? get details;
  @override
  @JsonKey(ignore: true)
  _$$_InvestOptionModelCopyWith<_$_InvestOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
