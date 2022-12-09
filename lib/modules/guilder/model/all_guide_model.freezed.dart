// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_guide_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllGuideLine _$AllGuideLineFromJson(Map<String, dynamic> json) {
  return _AllGuideLine.fromJson(json);
}

/// @nodoc
mixin _$AllGuideLine {
  @JsonKey(name: "bonus")
  List<GuideModel>? get bonus => throw _privateConstructorUsedError;
  @JsonKey(name: "directory")
  List<GuideModel>? get directory => throw _privateConstructorUsedError;
  @JsonKey(name: "investment")
  List<GuideModel>? get investment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllGuideLineCopyWith<AllGuideLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllGuideLineCopyWith<$Res> {
  factory $AllGuideLineCopyWith(
          AllGuideLine value, $Res Function(AllGuideLine) then) =
      _$AllGuideLineCopyWithImpl<$Res, AllGuideLine>;
  @useResult
  $Res call(
      {@JsonKey(name: "bonus") List<GuideModel>? bonus,
      @JsonKey(name: "directory") List<GuideModel>? directory,
      @JsonKey(name: "investment") List<GuideModel>? investment});
}

/// @nodoc
class _$AllGuideLineCopyWithImpl<$Res, $Val extends AllGuideLine>
    implements $AllGuideLineCopyWith<$Res> {
  _$AllGuideLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonus = freezed,
    Object? directory = freezed,
    Object? investment = freezed,
  }) {
    return _then(_value.copyWith(
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as List<GuideModel>?,
      directory: freezed == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as List<GuideModel>?,
      investment: freezed == investment
          ? _value.investment
          : investment // ignore: cast_nullable_to_non_nullable
              as List<GuideModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllGuideLineCopyWith<$Res>
    implements $AllGuideLineCopyWith<$Res> {
  factory _$$_AllGuideLineCopyWith(
          _$_AllGuideLine value, $Res Function(_$_AllGuideLine) then) =
      __$$_AllGuideLineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "bonus") List<GuideModel>? bonus,
      @JsonKey(name: "directory") List<GuideModel>? directory,
      @JsonKey(name: "investment") List<GuideModel>? investment});
}

/// @nodoc
class __$$_AllGuideLineCopyWithImpl<$Res>
    extends _$AllGuideLineCopyWithImpl<$Res, _$_AllGuideLine>
    implements _$$_AllGuideLineCopyWith<$Res> {
  __$$_AllGuideLineCopyWithImpl(
      _$_AllGuideLine _value, $Res Function(_$_AllGuideLine) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonus = freezed,
    Object? directory = freezed,
    Object? investment = freezed,
  }) {
    return _then(_$_AllGuideLine(
      bonus: freezed == bonus
          ? _value._bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as List<GuideModel>?,
      directory: freezed == directory
          ? _value._directory
          : directory // ignore: cast_nullable_to_non_nullable
              as List<GuideModel>?,
      investment: freezed == investment
          ? _value._investment
          : investment // ignore: cast_nullable_to_non_nullable
              as List<GuideModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllGuideLine implements _AllGuideLine {
  _$_AllGuideLine(
      {@JsonKey(name: "bonus") final List<GuideModel>? bonus,
      @JsonKey(name: "directory") final List<GuideModel>? directory,
      @JsonKey(name: "investment") final List<GuideModel>? investment})
      : _bonus = bonus,
        _directory = directory,
        _investment = investment;

  factory _$_AllGuideLine.fromJson(Map<String, dynamic> json) =>
      _$$_AllGuideLineFromJson(json);

  final List<GuideModel>? _bonus;
  @override
  @JsonKey(name: "bonus")
  List<GuideModel>? get bonus {
    final value = _bonus;
    if (value == null) return null;
    if (_bonus is EqualUnmodifiableListView) return _bonus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GuideModel>? _directory;
  @override
  @JsonKey(name: "directory")
  List<GuideModel>? get directory {
    final value = _directory;
    if (value == null) return null;
    if (_directory is EqualUnmodifiableListView) return _directory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GuideModel>? _investment;
  @override
  @JsonKey(name: "investment")
  List<GuideModel>? get investment {
    final value = _investment;
    if (value == null) return null;
    if (_investment is EqualUnmodifiableListView) return _investment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AllGuideLine(bonus: $bonus, directory: $directory, investment: $investment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllGuideLine &&
            const DeepCollectionEquality().equals(other._bonus, _bonus) &&
            const DeepCollectionEquality()
                .equals(other._directory, _directory) &&
            const DeepCollectionEquality()
                .equals(other._investment, _investment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bonus),
      const DeepCollectionEquality().hash(_directory),
      const DeepCollectionEquality().hash(_investment));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllGuideLineCopyWith<_$_AllGuideLine> get copyWith =>
      __$$_AllGuideLineCopyWithImpl<_$_AllGuideLine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllGuideLineToJson(
      this,
    );
  }
}

abstract class _AllGuideLine implements AllGuideLine {
  factory _AllGuideLine(
          {@JsonKey(name: "bonus") final List<GuideModel>? bonus,
          @JsonKey(name: "directory") final List<GuideModel>? directory,
          @JsonKey(name: "investment") final List<GuideModel>? investment}) =
      _$_AllGuideLine;

  factory _AllGuideLine.fromJson(Map<String, dynamic> json) =
      _$_AllGuideLine.fromJson;

  @override
  @JsonKey(name: "bonus")
  List<GuideModel>? get bonus;
  @override
  @JsonKey(name: "directory")
  List<GuideModel>? get directory;
  @override
  @JsonKey(name: "investment")
  List<GuideModel>? get investment;
  @override
  @JsonKey(ignore: true)
  _$$_AllGuideLineCopyWith<_$_AllGuideLine> get copyWith =>
      throw _privateConstructorUsedError;
}
