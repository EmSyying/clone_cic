// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model_stores.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModelsStores _$ModelsStoresFromJson(Map<String, dynamic> json) {
  return _ModelsStores.fromJson(json);
}

/// @nodoc
mixin _$ModelsStores {
  String? get steusTitle => throw _privateConstructorUsedError;
  String? get titleStores => throw _privateConstructorUsedError;
  String? get paragraph => throw _privateConstructorUsedError;
  String? get titleLocation => throw _privateConstructorUsedError;
  String? get imageStores => throw _privateConstructorUsedError;
  int? get numberPercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelsStoresCopyWith<ModelsStores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelsStoresCopyWith<$Res> {
  factory $ModelsStoresCopyWith(
          ModelsStores value, $Res Function(ModelsStores) then) =
      _$ModelsStoresCopyWithImpl<$Res>;
  $Res call(
      {String? steusTitle,
      String? titleStores,
      String? paragraph,
      String? titleLocation,
      String? imageStores,
      int? numberPercentage});
}

/// @nodoc
class _$ModelsStoresCopyWithImpl<$Res> implements $ModelsStoresCopyWith<$Res> {
  _$ModelsStoresCopyWithImpl(this._value, this._then);

  final ModelsStores _value;
  // ignore: unused_field
  final $Res Function(ModelsStores) _then;

  @override
  $Res call({
    Object? steusTitle = freezed,
    Object? titleStores = freezed,
    Object? paragraph = freezed,
    Object? titleLocation = freezed,
    Object? imageStores = freezed,
    Object? numberPercentage = freezed,
  }) {
    return _then(_value.copyWith(
      steusTitle: steusTitle == freezed
          ? _value.steusTitle
          : steusTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      titleStores: titleStores == freezed
          ? _value.titleStores
          : titleStores // ignore: cast_nullable_to_non_nullable
              as String?,
      paragraph: paragraph == freezed
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as String?,
      titleLocation: titleLocation == freezed
          ? _value.titleLocation
          : titleLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      imageStores: imageStores == freezed
          ? _value.imageStores
          : imageStores // ignore: cast_nullable_to_non_nullable
              as String?,
      numberPercentage: numberPercentage == freezed
          ? _value.numberPercentage
          : numberPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ModelsStoresCopyWith<$Res>
    implements $ModelsStoresCopyWith<$Res> {
  factory _$$_ModelsStoresCopyWith(
          _$_ModelsStores value, $Res Function(_$_ModelsStores) then) =
      __$$_ModelsStoresCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? steusTitle,
      String? titleStores,
      String? paragraph,
      String? titleLocation,
      String? imageStores,
      int? numberPercentage});
}

/// @nodoc
class __$$_ModelsStoresCopyWithImpl<$Res>
    extends _$ModelsStoresCopyWithImpl<$Res>
    implements _$$_ModelsStoresCopyWith<$Res> {
  __$$_ModelsStoresCopyWithImpl(
      _$_ModelsStores _value, $Res Function(_$_ModelsStores) _then)
      : super(_value, (v) => _then(v as _$_ModelsStores));

  @override
  _$_ModelsStores get _value => super._value as _$_ModelsStores;

  @override
  $Res call({
    Object? steusTitle = freezed,
    Object? titleStores = freezed,
    Object? paragraph = freezed,
    Object? titleLocation = freezed,
    Object? imageStores = freezed,
    Object? numberPercentage = freezed,
  }) {
    return _then(_$_ModelsStores(
      steusTitle: steusTitle == freezed
          ? _value.steusTitle
          : steusTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      titleStores: titleStores == freezed
          ? _value.titleStores
          : titleStores // ignore: cast_nullable_to_non_nullable
              as String?,
      paragraph: paragraph == freezed
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as String?,
      titleLocation: titleLocation == freezed
          ? _value.titleLocation
          : titleLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      imageStores: imageStores == freezed
          ? _value.imageStores
          : imageStores // ignore: cast_nullable_to_non_nullable
              as String?,
      numberPercentage: numberPercentage == freezed
          ? _value.numberPercentage
          : numberPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelsStores implements _ModelsStores {
  _$_ModelsStores(
      {this.steusTitle,
      this.titleStores,
      this.paragraph,
      this.titleLocation,
      this.imageStores,
      this.numberPercentage});

  factory _$_ModelsStores.fromJson(Map<String, dynamic> json) =>
      _$$_ModelsStoresFromJson(json);

  @override
  final String? steusTitle;
  @override
  final String? titleStores;
  @override
  final String? paragraph;
  @override
  final String? titleLocation;
  @override
  final String? imageStores;
  @override
  final int? numberPercentage;

  @override
  String toString() {
    return 'ModelsStores(steusTitle: $steusTitle, titleStores: $titleStores, paragraph: $paragraph, titleLocation: $titleLocation, imageStores: $imageStores, numberPercentage: $numberPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelsStores &&
            const DeepCollectionEquality()
                .equals(other.steusTitle, steusTitle) &&
            const DeepCollectionEquality()
                .equals(other.titleStores, titleStores) &&
            const DeepCollectionEquality().equals(other.paragraph, paragraph) &&
            const DeepCollectionEquality()
                .equals(other.titleLocation, titleLocation) &&
            const DeepCollectionEquality()
                .equals(other.imageStores, imageStores) &&
            const DeepCollectionEquality()
                .equals(other.numberPercentage, numberPercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(steusTitle),
      const DeepCollectionEquality().hash(titleStores),
      const DeepCollectionEquality().hash(paragraph),
      const DeepCollectionEquality().hash(titleLocation),
      const DeepCollectionEquality().hash(imageStores),
      const DeepCollectionEquality().hash(numberPercentage));

  @JsonKey(ignore: true)
  @override
  _$$_ModelsStoresCopyWith<_$_ModelsStores> get copyWith =>
      __$$_ModelsStoresCopyWithImpl<_$_ModelsStores>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelsStoresToJson(this);
  }
}

abstract class _ModelsStores implements ModelsStores {
  factory _ModelsStores(
      {final String? steusTitle,
      final String? titleStores,
      final String? paragraph,
      final String? titleLocation,
      final String? imageStores,
      final int? numberPercentage}) = _$_ModelsStores;

  factory _ModelsStores.fromJson(Map<String, dynamic> json) =
      _$_ModelsStores.fromJson;

  @override
  String? get steusTitle => throw _privateConstructorUsedError;
  @override
  String? get titleStores => throw _privateConstructorUsedError;
  @override
  String? get paragraph => throw _privateConstructorUsedError;
  @override
  String? get titleLocation => throw _privateConstructorUsedError;
  @override
  String? get imageStores => throw _privateConstructorUsedError;
  @override
  int? get numberPercentage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ModelsStoresCopyWith<_$_ModelsStores> get copyWith =>
      throw _privateConstructorUsedError;
}
