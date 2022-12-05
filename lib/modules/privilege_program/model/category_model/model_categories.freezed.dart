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
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_shop')
  int? get countShop => throw _privateConstructorUsedError;

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
  $Res call(
      {int? id,
      String? name,
      String? image,
      @JsonKey(name: 'count_shop') int? countShop});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? countShop = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      countShop: countShop == freezed
          ? _value.countShop
          : countShop // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call(
      {int? id,
      String? name,
      String? image,
      @JsonKey(name: 'count_shop') int? countShop});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? countShop = freezed,
  }) {
    return _then(_$_ModelsCategories(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      countShop: countShop == freezed
          ? _value.countShop
          : countShop // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: 'count_shop') this.countShop});

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
  String toString() {
    return 'ModelsCategories(id: $id, name: $name, image: $image, countShop: $countShop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelsCategories &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.countShop, countShop));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(countShop));

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
  factory _ModelsCategories(
      {final int? id,
      final String? name,
      final String? image,
      @JsonKey(name: 'count_shop') final int? countShop}) = _$_ModelsCategories;

  factory _ModelsCategories.fromJson(Map<String, dynamic> json) =
      _$_ModelsCategories.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'count_shop')
  int? get countShop => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ModelsCategoriesCopyWith<_$_ModelsCategories> get copyWith =>
      throw _privateConstructorUsedError;
}
