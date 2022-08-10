// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardDetailModel _$CardDetailModelFromJson(Map<String, dynamic> json) {
  return _CardDetailModel.fromJson(json);
}

/// @nodoc
mixin _$CardDetailModel {
  String? get stausTitle => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get paragraph => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  String? get imageCard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardDetailModelCopyWith<CardDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDetailModelCopyWith<$Res> {
  factory $CardDetailModelCopyWith(
          CardDetailModel value, $Res Function(CardDetailModel) then) =
      _$CardDetailModelCopyWithImpl<$Res>;
  $Res call(
      {String? stausTitle,
      String? title,
      String? paragraph,
      int? number,
      String? imageCard});
}

/// @nodoc
class _$CardDetailModelCopyWithImpl<$Res>
    implements $CardDetailModelCopyWith<$Res> {
  _$CardDetailModelCopyWithImpl(this._value, this._then);

  final CardDetailModel _value;
  // ignore: unused_field
  final $Res Function(CardDetailModel) _then;

  @override
  $Res call({
    Object? stausTitle = freezed,
    Object? title = freezed,
    Object? paragraph = freezed,
    Object? number = freezed,
    Object? imageCard = freezed,
  }) {
    return _then(_value.copyWith(
      stausTitle: stausTitle == freezed
          ? _value.stausTitle
          : stausTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      paragraph: paragraph == freezed
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      imageCard: imageCard == freezed
          ? _value.imageCard
          : imageCard // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CardDetailModelCopyWith<$Res>
    implements $CardDetailModelCopyWith<$Res> {
  factory _$$_CardDetailModelCopyWith(
          _$_CardDetailModel value, $Res Function(_$_CardDetailModel) then) =
      __$$_CardDetailModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? stausTitle,
      String? title,
      String? paragraph,
      int? number,
      String? imageCard});
}

/// @nodoc
class __$$_CardDetailModelCopyWithImpl<$Res>
    extends _$CardDetailModelCopyWithImpl<$Res>
    implements _$$_CardDetailModelCopyWith<$Res> {
  __$$_CardDetailModelCopyWithImpl(
      _$_CardDetailModel _value, $Res Function(_$_CardDetailModel) _then)
      : super(_value, (v) => _then(v as _$_CardDetailModel));

  @override
  _$_CardDetailModel get _value => super._value as _$_CardDetailModel;

  @override
  $Res call({
    Object? stausTitle = freezed,
    Object? title = freezed,
    Object? paragraph = freezed,
    Object? number = freezed,
    Object? imageCard = freezed,
  }) {
    return _then(_$_CardDetailModel(
      stausTitle: stausTitle == freezed
          ? _value.stausTitle
          : stausTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      paragraph: paragraph == freezed
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      imageCard: imageCard == freezed
          ? _value.imageCard
          : imageCard // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardDetailModel implements _CardDetailModel {
  _$_CardDetailModel(
      {this.stausTitle,
      this.title,
      this.paragraph,
      this.number,
      this.imageCard});

  factory _$_CardDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_CardDetailModelFromJson(json);

  @override
  final String? stausTitle;
  @override
  final String? title;
  @override
  final String? paragraph;
  @override
  final int? number;
  @override
  final String? imageCard;

  @override
  String toString() {
    return 'CardDetailModel(stausTitle: $stausTitle, title: $title, paragraph: $paragraph, number: $number, imageCard: $imageCard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardDetailModel &&
            const DeepCollectionEquality()
                .equals(other.stausTitle, stausTitle) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.paragraph, paragraph) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.imageCard, imageCard));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stausTitle),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(paragraph),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(imageCard));

  @JsonKey(ignore: true)
  @override
  _$$_CardDetailModelCopyWith<_$_CardDetailModel> get copyWith =>
      __$$_CardDetailModelCopyWithImpl<_$_CardDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardDetailModelToJson(this);
  }
}

abstract class _CardDetailModel implements CardDetailModel {
  factory _CardDetailModel(
      {final String? stausTitle,
      final String? title,
      final String? paragraph,
      final int? number,
      final String? imageCard}) = _$_CardDetailModel;

  factory _CardDetailModel.fromJson(Map<String, dynamic> json) =
      _$_CardDetailModel.fromJson;

  @override
  String? get stausTitle => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get paragraph => throw _privateConstructorUsedError;
  @override
  int? get number => throw _privateConstructorUsedError;
  @override
  String? get imageCard => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CardDetailModelCopyWith<_$_CardDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
