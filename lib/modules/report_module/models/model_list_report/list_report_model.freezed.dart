// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListReportModel _$ListReportModelFromJson(Map<String, dynamic> json) {
  return _ListReportModel.fromJson(json);
}

/// @nodoc
mixin _$ListReportModel {
  int? get date => throw _privateConstructorUsedError;
  List<ReportGroupByYearModel>? get reports =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListReportModelCopyWith<ListReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListReportModelCopyWith<$Res> {
  factory $ListReportModelCopyWith(
          ListReportModel value, $Res Function(ListReportModel) then) =
      _$ListReportModelCopyWithImpl<$Res>;
  $Res call({int? date, List<ReportGroupByYearModel>? reports});
}

/// @nodoc
class _$ListReportModelCopyWithImpl<$Res>
    implements $ListReportModelCopyWith<$Res> {
  _$ListReportModelCopyWithImpl(this._value, this._then);

  final ListReportModel _value;
  // ignore: unused_field
  final $Res Function(ListReportModel) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? reports = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int?,
      reports: reports == freezed
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportGroupByYearModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ListReportModelCopyWith<$Res>
    implements $ListReportModelCopyWith<$Res> {
  factory _$$_ListReportModelCopyWith(
          _$_ListReportModel value, $Res Function(_$_ListReportModel) then) =
      __$$_ListReportModelCopyWithImpl<$Res>;
  @override
  $Res call({int? date, List<ReportGroupByYearModel>? reports});
}

/// @nodoc
class __$$_ListReportModelCopyWithImpl<$Res>
    extends _$ListReportModelCopyWithImpl<$Res>
    implements _$$_ListReportModelCopyWith<$Res> {
  __$$_ListReportModelCopyWithImpl(
      _$_ListReportModel _value, $Res Function(_$_ListReportModel) _then)
      : super(_value, (v) => _then(v as _$_ListReportModel));

  @override
  _$_ListReportModel get _value => super._value as _$_ListReportModel;

  @override
  $Res call({
    Object? date = freezed,
    Object? reports = freezed,
  }) {
    return _then(_$_ListReportModel(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int?,
      reports: reports == freezed
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportGroupByYearModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListReportModel implements _ListReportModel {
  _$_ListReportModel({this.date, final List<ReportGroupByYearModel>? reports})
      : _reports = reports;

  factory _$_ListReportModel.fromJson(Map<String, dynamic> json) =>
      _$$_ListReportModelFromJson(json);

  @override
  final int? date;
  final List<ReportGroupByYearModel>? _reports;
  @override
  List<ReportGroupByYearModel>? get reports {
    final value = _reports;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListReportModel(date: $date, reports: $reports)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListReportModel &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other._reports, _reports));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(_reports));

  @JsonKey(ignore: true)
  @override
  _$$_ListReportModelCopyWith<_$_ListReportModel> get copyWith =>
      __$$_ListReportModelCopyWithImpl<_$_ListReportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListReportModelToJson(this);
  }
}

abstract class _ListReportModel implements ListReportModel {
  factory _ListReportModel(
      {final int? date,
      final List<ReportGroupByYearModel>? reports}) = _$_ListReportModel;

  factory _ListReportModel.fromJson(Map<String, dynamic> json) =
      _$_ListReportModel.fromJson;

  @override
  int? get date => throw _privateConstructorUsedError;
  @override
  List<ReportGroupByYearModel>? get reports =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ListReportModelCopyWith<_$_ListReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}
