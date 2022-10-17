// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fif_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FiFDetailModel _$FiFDetailModelFromJson(Map<String, dynamic> json) {
  return _FiFDetailModel.fromJson(json);
}

/// @nodoc
mixin _$FiFDetailModel {
  String? get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FiFDetailModelCopyWith<FiFDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiFDetailModelCopyWith<$Res> {
  factory $FiFDetailModelCopyWith(
          FiFDetailModel value, $Res Function(FiFDetailModel) then) =
      _$FiFDetailModelCopyWithImpl<$Res>;
  $Res call({String? list});
}

/// @nodoc
class _$FiFDetailModelCopyWithImpl<$Res>
    implements $FiFDetailModelCopyWith<$Res> {
  _$FiFDetailModelCopyWithImpl(this._value, this._then);

  final FiFDetailModel _value;
  // ignore: unused_field
  final $Res Function(FiFDetailModel) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FiFDetailModelCopyWith<$Res>
    implements $FiFDetailModelCopyWith<$Res> {
  factory _$$_FiFDetailModelCopyWith(
          _$_FiFDetailModel value, $Res Function(_$_FiFDetailModel) then) =
      __$$_FiFDetailModelCopyWithImpl<$Res>;
  @override
  $Res call({String? list});
}

/// @nodoc
class __$$_FiFDetailModelCopyWithImpl<$Res>
    extends _$FiFDetailModelCopyWithImpl<$Res>
    implements _$$_FiFDetailModelCopyWith<$Res> {
  __$$_FiFDetailModelCopyWithImpl(
      _$_FiFDetailModel _value, $Res Function(_$_FiFDetailModel) _then)
      : super(_value, (v) => _then(v as _$_FiFDetailModel));

  @override
  _$_FiFDetailModel get _value => super._value as _$_FiFDetailModel;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_$_FiFDetailModel(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FiFDetailModel implements _FiFDetailModel {
  _$_FiFDetailModel({this.list});

  factory _$_FiFDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_FiFDetailModelFromJson(json);

  @override
  final String? list;

  @override
  String toString() {
    return 'FiFDetailModel(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FiFDetailModel &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$$_FiFDetailModelCopyWith<_$_FiFDetailModel> get copyWith =>
      __$$_FiFDetailModelCopyWithImpl<_$_FiFDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FiFDetailModelToJson(this);
  }
}

abstract class _FiFDetailModel implements FiFDetailModel {
  factory _FiFDetailModel({final String? list}) = _$_FiFDetailModel;

  factory _FiFDetailModel.fromJson(Map<String, dynamic> json) =
      _$_FiFDetailModel.fromJson;

  @override
  String? get list => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FiFDetailModelCopyWith<_$_FiFDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
