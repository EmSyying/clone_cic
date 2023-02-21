// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privilege_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrivilegeDataModel _$PrivilegeDataModelFromJson(Map<String, dynamic> json) {
  return _PrivilegeDataModel.fromJson(json);
}

/// @nodoc
mixin _$PrivilegeDataModel {
  List<PrivilegeShopModel>? get data => throw _privateConstructorUsedError;
  Links? get links => throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivilegeDataModelCopyWith<PrivilegeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivilegeDataModelCopyWith<$Res> {
  factory $PrivilegeDataModelCopyWith(
          PrivilegeDataModel value, $Res Function(PrivilegeDataModel) then) =
      _$PrivilegeDataModelCopyWithImpl<$Res, PrivilegeDataModel>;
  @useResult
  $Res call({List<PrivilegeShopModel>? data, Links? links, Meta? meta});
}

/// @nodoc
class _$PrivilegeDataModelCopyWithImpl<$Res, $Val extends PrivilegeDataModel>
    implements $PrivilegeDataModelCopyWith<$Res> {
  _$PrivilegeDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? links = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PrivilegeShopModel>?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrivilegeDataModelCopyWith<$Res>
    implements $PrivilegeDataModelCopyWith<$Res> {
  factory _$$_PrivilegeDataModelCopyWith(_$_PrivilegeDataModel value,
          $Res Function(_$_PrivilegeDataModel) then) =
      __$$_PrivilegeDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PrivilegeShopModel>? data, Links? links, Meta? meta});
}

/// @nodoc
class __$$_PrivilegeDataModelCopyWithImpl<$Res>
    extends _$PrivilegeDataModelCopyWithImpl<$Res, _$_PrivilegeDataModel>
    implements _$$_PrivilegeDataModelCopyWith<$Res> {
  __$$_PrivilegeDataModelCopyWithImpl(
      _$_PrivilegeDataModel _value, $Res Function(_$_PrivilegeDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? links = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$_PrivilegeDataModel(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PrivilegeShopModel>?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrivilegeDataModel implements _PrivilegeDataModel {
  _$_PrivilegeDataModel(
      {final List<PrivilegeShopModel>? data, this.links, this.meta})
      : _data = data;

  factory _$_PrivilegeDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_PrivilegeDataModelFromJson(json);

  final List<PrivilegeShopModel>? _data;
  @override
  List<PrivilegeShopModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Links? links;
  @override
  final Meta? meta;

  @override
  String toString() {
    return 'PrivilegeDataModel(data: $data, links: $links, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrivilegeDataModel &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrivilegeDataModelCopyWith<_$_PrivilegeDataModel> get copyWith =>
      __$$_PrivilegeDataModelCopyWithImpl<_$_PrivilegeDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrivilegeDataModelToJson(
      this,
    );
  }
}

abstract class _PrivilegeDataModel implements PrivilegeDataModel {
  factory _PrivilegeDataModel(
      {final List<PrivilegeShopModel>? data,
      final Links? links,
      final Meta? meta}) = _$_PrivilegeDataModel;

  factory _PrivilegeDataModel.fromJson(Map<String, dynamic> json) =
      _$_PrivilegeDataModel.fromJson;

  @override
  List<PrivilegeShopModel>? get data;
  @override
  Links? get links;
  @override
  Meta? get meta;
  @override
  @JsonKey(ignore: true)
  _$$_PrivilegeDataModelCopyWith<_$_PrivilegeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
