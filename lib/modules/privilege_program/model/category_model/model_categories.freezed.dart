// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_shop')
  int? get countShop => throw _privateConstructorUsedError;
  @JsonKey(name: 'mime_type')
  String? get mimeTypeImag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelsCategoriesCopyWith<ModelsCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelsCategoriesCopyWith<$Res> {
  factory $ModelsCategoriesCopyWith(
          ModelsCategories value, $Res Function(ModelsCategories) then) =
      _$ModelsCategoriesCopyWithImpl<$Res, ModelsCategories>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? image,
      @JsonKey(name: 'count_shop') int? countShop,
      @JsonKey(name: 'mime_type') String? mimeTypeImag});
}

/// @nodoc
class _$ModelsCategoriesCopyWithImpl<$Res, $Val extends ModelsCategories>
    implements $ModelsCategoriesCopyWith<$Res> {
  _$ModelsCategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? countShop = freezed,
    Object? mimeTypeImag = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      countShop: freezed == countShop
          ? _value.countShop
          : countShop // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeTypeImag: freezed == mimeTypeImag
          ? _value.mimeTypeImag
          : mimeTypeImag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModelsCategoriesCopyWith<$Res>
    implements $ModelsCategoriesCopyWith<$Res> {
  factory _$$_ModelsCategoriesCopyWith(
          _$_ModelsCategories value, $Res Function(_$_ModelsCategories) then) =
      __$$_ModelsCategoriesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? image,
      @JsonKey(name: 'count_shop') int? countShop,
      @JsonKey(name: 'mime_type') String? mimeTypeImag});
}

/// @nodoc
class __$$_ModelsCategoriesCopyWithImpl<$Res>
    extends _$ModelsCategoriesCopyWithImpl<$Res, _$_ModelsCategories>
    implements _$$_ModelsCategoriesCopyWith<$Res> {
  __$$_ModelsCategoriesCopyWithImpl(
      _$_ModelsCategories _value, $Res Function(_$_ModelsCategories) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? countShop = freezed,
    Object? mimeTypeImag = freezed,
  }) {
    return _then(_$_ModelsCategories(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      countShop: freezed == countShop
          ? _value.countShop
          : countShop // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeTypeImag: freezed == mimeTypeImag
          ? _value.mimeTypeImag
          : mimeTypeImag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelsCategories implements _ModelsCategories {
  _$_ModelsCategories(
      {this.id,
      this.name,
      this.image,
      @JsonKey(name: 'count_shop') this.countShop,
      @JsonKey(name: 'mime_type') this.mimeTypeImag});

  factory _$_ModelsCategories.fromJson(Map<String, dynamic> json) =>
      _$$_ModelsCategoriesFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  @JsonKey(name: 'count_shop')
  final int? countShop;
  @override
  @JsonKey(name: 'mime_type')
  final String? mimeTypeImag;

  @override
  String toString() {
    return 'ModelsCategories(id: $id, name: $name, image: $image, countShop: $countShop, mimeTypeImag: $mimeTypeImag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelsCategories &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.countShop, countShop) ||
                other.countShop == countShop) &&
            (identical(other.mimeTypeImag, mimeTypeImag) ||
                other.mimeTypeImag == mimeTypeImag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, countShop, mimeTypeImag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModelsCategoriesCopyWith<_$_ModelsCategories> get copyWith =>
      __$$_ModelsCategoriesCopyWithImpl<_$_ModelsCategories>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelsCategoriesToJson(
      this,
    );
  }
}

abstract class _ModelsCategories implements ModelsCategories {
  factory _ModelsCategories(
          {final int? id,
          final String? name,
          final String? image,
          @JsonKey(name: 'count_shop') final int? countShop,
          @JsonKey(name: 'mime_type') final String? mimeTypeImag}) =
      _$_ModelsCategories;

  factory _ModelsCategories.fromJson(Map<String, dynamic> json) =
      _$_ModelsCategories.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  @JsonKey(name: 'count_shop')
  int? get countShop;
  @override
  @JsonKey(name: 'mime_type')
  String? get mimeTypeImag;
  @override
  @JsonKey(ignore: true)
  _$$_ModelsCategoriesCopyWith<_$_ModelsCategories> get copyWith =>
      throw _privateConstructorUsedError;
}
