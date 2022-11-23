// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categories_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategorieReportModel _$CategorieReportModelFromJson(Map<String, dynamic> json) {
  return _CategorieReportModel.fromJson(json);
}

/// @nodoc
mixin _$CategorieReportModel {
  int? get id => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'report_count')
  int? get reportCount => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorieReportModelCopyWith<CategorieReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorieReportModelCopyWith<$Res> {
  factory $CategorieReportModelCopyWith(CategorieReportModel value,
          $Res Function(CategorieReportModel) then) =
      _$CategorieReportModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? category,
      @JsonKey(name: 'report_count') int? reportCount,
      String? color,
      String? icon});
}

/// @nodoc
class _$CategorieReportModelCopyWithImpl<$Res>
    implements $CategorieReportModelCopyWith<$Res> {
  _$CategorieReportModelCopyWithImpl(this._value, this._then);

  final CategorieReportModel _value;
  // ignore: unused_field
  final $Res Function(CategorieReportModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? reportCount = freezed,
    Object? color = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      reportCount: reportCount == freezed
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CategorieReportModelCopyWith<$Res>
    implements $CategorieReportModelCopyWith<$Res> {
  factory _$$_CategorieReportModelCopyWith(_$_CategorieReportModel value,
          $Res Function(_$_CategorieReportModel) then) =
      __$$_CategorieReportModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? category,
      @JsonKey(name: 'report_count') int? reportCount,
      String? color,
      String? icon});
}

/// @nodoc
class __$$_CategorieReportModelCopyWithImpl<$Res>
    extends _$CategorieReportModelCopyWithImpl<$Res>
    implements _$$_CategorieReportModelCopyWith<$Res> {
  __$$_CategorieReportModelCopyWithImpl(_$_CategorieReportModel _value,
      $Res Function(_$_CategorieReportModel) _then)
      : super(_value, (v) => _then(v as _$_CategorieReportModel));

  @override
  _$_CategorieReportModel get _value => super._value as _$_CategorieReportModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? reportCount = freezed,
    Object? color = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$_CategorieReportModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      reportCount: reportCount == freezed
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategorieReportModel implements _CategorieReportModel {
  _$_CategorieReportModel(
      {this.id,
      this.category,
      @JsonKey(name: 'report_count') this.reportCount,
      this.color,
      this.icon});

  factory _$_CategorieReportModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategorieReportModelFromJson(json);

  @override
  final int? id;
  @override
  final String? category;
  @override
  @JsonKey(name: 'report_count')
  final int? reportCount;
  @override
  final String? color;
  @override
  final String? icon;

  @override
  String toString() {
    return 'CategorieReportModel(id: $id, category: $category, reportCount: $reportCount, color: $color, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategorieReportModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.reportCount, reportCount) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(reportCount),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  _$$_CategorieReportModelCopyWith<_$_CategorieReportModel> get copyWith =>
      __$$_CategorieReportModelCopyWithImpl<_$_CategorieReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategorieReportModelToJson(this);
  }
}

abstract class _CategorieReportModel implements CategorieReportModel {
  factory _CategorieReportModel(
      {final int? id,
      final String? category,
      @JsonKey(name: 'report_count') final int? reportCount,
      final String? color,
      final String? icon}) = _$_CategorieReportModel;

  factory _CategorieReportModel.fromJson(Map<String, dynamic> json) =
      _$_CategorieReportModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'report_count')
  int? get reportCount => throw _privateConstructorUsedError;
  @override
  String? get color => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategorieReportModelCopyWith<_$_CategorieReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}
