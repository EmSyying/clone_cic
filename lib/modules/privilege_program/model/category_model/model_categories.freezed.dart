// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model_categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModelsCategories _$ModelsCategoriesFromJson(Map<String, dynamic> json) {
  return _ModelsCategories.fromJson(json);
}

/// @nodoc
mixin _$ModelsCategories {
  String? get title => throw _privateConstructorUsedError;
  String? get svgPicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelsCategoriesCopyWith<ModelsCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelsCategoriesCopyWith<$Res> {
  factory $ModelsCategoriesCopyWith(
          ModelsCategories value, $Res Function(ModelsCategories) then) =
      _$ModelsCategoriesCopyWithImpl<$Res>;
  $Res call({String? title, String? svgPicture});
}

/// @nodoc
class _$ModelsCategoriesCopyWithImpl<$Res>
    implements $ModelsCategoriesCopyWith<$Res> {
  _$ModelsCategoriesCopyWithImpl(this._value, this._then);

  final ModelsCategories _value;
  // ignore: unused_field
  final $Res Function(ModelsCategories) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? svgPicture = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      svgPicture: svgPicture == freezed
          ? _value.svgPicture
          : svgPicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ModelsCategoriesCopyWith<$Res>
    implements $ModelsCategoriesCopyWith<$Res> {
  factory _$$_ModelsCategoriesCopyWith(
          _$_ModelsCategories value, $Res Function(_$_ModelsCategories) then) =
      __$$_ModelsCategoriesCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? svgPicture});
}

/// @nodoc
class __$$_ModelsCategoriesCopyWithImpl<$Res>
    extends _$ModelsCategoriesCopyWithImpl<$Res>
    implements _$$_ModelsCategoriesCopyWith<$Res> {
  __$$_ModelsCategoriesCopyWithImpl(
      _$_ModelsCategories _value, $Res Function(_$_ModelsCategories) _then)
      : super(_value, (v) => _then(v as _$_ModelsCategories));

  @override
  _$_ModelsCategories get _value => super._value as _$_ModelsCategories;

  @override
  $Res call({
    Object? title = freezed,
    Object? svgPicture = freezed,
  }) {
    return _then(_$_ModelsCategories(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      svgPicture: svgPicture == freezed
          ? _value.svgPicture
          : svgPicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelsCategories implements _ModelsCategories {
  _$_ModelsCategories({this.title, this.svgPicture});

  factory _$_ModelsCategories.fromJson(Map<String, dynamic> json) =>
      _$$_ModelsCategoriesFromJson(json);

  @override
  final String? title;
  @override
  final String? svgPicture;

  @override
  String toString() {
    return 'ModelsCategories(title: $title, svgPicture: $svgPicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelsCategories &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.svgPicture, svgPicture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(svgPicture));

  @JsonKey(ignore: true)
  @override
  _$$_ModelsCategoriesCopyWith<_$_ModelsCategories> get copyWith =>
      __$$_ModelsCategoriesCopyWithImpl<_$_ModelsCategories>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelsCategoriesToJson(this);
  }
}

abstract class _ModelsCategories implements ModelsCategories {
  factory _ModelsCategories({final String? title, final String? svgPicture}) =
      _$_ModelsCategories;

  factory _ModelsCategories.fromJson(Map<String, dynamic> json) =
      _$_ModelsCategories.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get svgPicture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ModelsCategoriesCopyWith<_$_ModelsCategories> get copyWith =>
      throw _privateConstructorUsedError;
}
