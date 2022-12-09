// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$CardDetailModelCopyWithImpl<$Res, CardDetailModel>;
  @useResult
  $Res call(
      {String? stausTitle,
      String? title,
      String? paragraph,
      int? number,
      String? imageCard});
}

/// @nodoc
class _$CardDetailModelCopyWithImpl<$Res, $Val extends CardDetailModel>
    implements $CardDetailModelCopyWith<$Res> {
  _$CardDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stausTitle = freezed,
    Object? title = freezed,
    Object? paragraph = freezed,
    Object? number = freezed,
    Object? imageCard = freezed,
  }) {
    return _then(_value.copyWith(
      stausTitle: freezed == stausTitle
          ? _value.stausTitle
          : stausTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      paragraph: freezed == paragraph
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      imageCard: freezed == imageCard
          ? _value.imageCard
          : imageCard // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardDetailModelCopyWith<$Res>
    implements $CardDetailModelCopyWith<$Res> {
  factory _$$_CardDetailModelCopyWith(
          _$_CardDetailModel value, $Res Function(_$_CardDetailModel) then) =
      __$$_CardDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? stausTitle,
      String? title,
      String? paragraph,
      int? number,
      String? imageCard});
}

/// @nodoc
class __$$_CardDetailModelCopyWithImpl<$Res>
    extends _$CardDetailModelCopyWithImpl<$Res, _$_CardDetailModel>
    implements _$$_CardDetailModelCopyWith<$Res> {
  __$$_CardDetailModelCopyWithImpl(
      _$_CardDetailModel _value, $Res Function(_$_CardDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stausTitle = freezed,
    Object? title = freezed,
    Object? paragraph = freezed,
    Object? number = freezed,
    Object? imageCard = freezed,
  }) {
    return _then(_$_CardDetailModel(
      stausTitle: freezed == stausTitle
          ? _value.stausTitle
          : stausTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      paragraph: freezed == paragraph
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      imageCard: freezed == imageCard
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
            (identical(other.stausTitle, stausTitle) ||
                other.stausTitle == stausTitle) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.paragraph, paragraph) ||
                other.paragraph == paragraph) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.imageCard, imageCard) ||
                other.imageCard == imageCard));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stausTitle, title, paragraph, number, imageCard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardDetailModelCopyWith<_$_CardDetailModel> get copyWith =>
      __$$_CardDetailModelCopyWithImpl<_$_CardDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardDetailModelToJson(
      this,
    );
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
  String? get stausTitle;
  @override
  String? get title;
  @override
  String? get paragraph;
  @override
  int? get number;
  @override
  String? get imageCard;
  @override
  @JsonKey(ignore: true)
  _$$_CardDetailModelCopyWith<_$_CardDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
