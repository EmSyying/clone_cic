// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guide_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuideModel _$GuideModelFromJson(Map<String, dynamic> json) {
  return _GuideModel.fromJson(json);
}

/// @nodoc
mixin _$GuideModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title_en")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "title_kh")
  String? get titleKh => throw _privateConstructorUsedError;
  @JsonKey(name: "content_en")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "content_kh")
  String? get contentKh => throw _privateConstructorUsedError;
  dynamic get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuideModelCopyWith<GuideModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuideModelCopyWith<$Res> {
  factory $GuideModelCopyWith(
          GuideModel value, $Res Function(GuideModel) then) =
      _$GuideModelCopyWithImpl<$Res, GuideModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title_en") String? title,
      @JsonKey(name: "title_kh") String? titleKh,
      @JsonKey(name: "content_en") String? description,
      @JsonKey(name: "content_kh") String? contentKh,
      dynamic key});
}

/// @nodoc
class _$GuideModelCopyWithImpl<$Res, $Val extends GuideModel>
    implements $GuideModelCopyWith<$Res> {
  _$GuideModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? titleKh = freezed,
    Object? description = freezed,
    Object? contentKh = freezed,
    Object? key = freezed,
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
      titleKh: freezed == titleKh
          ? _value.titleKh
          : titleKh // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      contentKh: freezed == contentKh
          ? _value.contentKh
          : contentKh // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GuideModelCopyWith<$Res>
    implements $GuideModelCopyWith<$Res> {
  factory _$$_GuideModelCopyWith(
          _$_GuideModel value, $Res Function(_$_GuideModel) then) =
      __$$_GuideModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title_en") String? title,
      @JsonKey(name: "title_kh") String? titleKh,
      @JsonKey(name: "content_en") String? description,
      @JsonKey(name: "content_kh") String? contentKh,
      dynamic key});
}

/// @nodoc
class __$$_GuideModelCopyWithImpl<$Res>
    extends _$GuideModelCopyWithImpl<$Res, _$_GuideModel>
    implements _$$_GuideModelCopyWith<$Res> {
  __$$_GuideModelCopyWithImpl(
      _$_GuideModel _value, $Res Function(_$_GuideModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? titleKh = freezed,
    Object? description = freezed,
    Object? contentKh = freezed,
    Object? key = freezed,
  }) {
    return _then(_$_GuideModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      titleKh: freezed == titleKh
          ? _value.titleKh
          : titleKh // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      contentKh: freezed == contentKh
          ? _value.contentKh
          : contentKh // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuideModel implements _GuideModel {
  _$_GuideModel(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title_en") this.title,
      @JsonKey(name: "title_kh") this.titleKh,
      @JsonKey(name: "content_en") this.description,
      @JsonKey(name: "content_kh") this.contentKh,
      this.key});

  factory _$_GuideModel.fromJson(Map<String, dynamic> json) =>
      _$$_GuideModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "title_en")
  final String? title;
  @override
  @JsonKey(name: "title_kh")
  final String? titleKh;
  @override
  @JsonKey(name: "content_en")
  final String? description;
  @override
  @JsonKey(name: "content_kh")
  final String? contentKh;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'GuideModel(id: $id, title: $title, titleKh: $titleKh, description: $description, contentKh: $contentKh, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuideModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleKh, titleKh) || other.titleKh == titleKh) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.contentKh, contentKh) ||
                other.contentKh == contentKh) &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, titleKh, description,
      contentKh, const DeepCollectionEquality().hash(key));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GuideModelCopyWith<_$_GuideModel> get copyWith =>
      __$$_GuideModelCopyWithImpl<_$_GuideModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuideModelToJson(
      this,
    );
  }
}

abstract class _GuideModel implements GuideModel {
  factory _GuideModel(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "title_en") final String? title,
      @JsonKey(name: "title_kh") final String? titleKh,
      @JsonKey(name: "content_en") final String? description,
      @JsonKey(name: "content_kh") final String? contentKh,
      final dynamic key}) = _$_GuideModel;

  factory _GuideModel.fromJson(Map<String, dynamic> json) =
      _$_GuideModel.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "title_en")
  String? get title;
  @override
  @JsonKey(name: "title_kh")
  String? get titleKh;
  @override
  @JsonKey(name: "content_en")
  String? get description;
  @override
  @JsonKey(name: "content_kh")
  String? get contentKh;
  @override
  dynamic get key;
  @override
  @JsonKey(ignore: true)
  _$$_GuideModelCopyWith<_$_GuideModel> get copyWith =>
      throw _privateConstructorUsedError;
}
