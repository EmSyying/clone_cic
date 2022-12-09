// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_center.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CallCenterModel _$CallCenterModelFromJson(Map<String, dynamic> json) {
  return _CallCenterModel.fromJson(json);
}

/// @nodoc
mixin _$CallCenterModel {
  String? get link => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallCenterModelCopyWith<CallCenterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallCenterModelCopyWith<$Res> {
  factory $CallCenterModelCopyWith(
          CallCenterModel value, $Res Function(CallCenterModel) then) =
      _$CallCenterModelCopyWithImpl<$Res, CallCenterModel>;
  @useResult
  $Res call({String? link, String? phone});
}

/// @nodoc
class _$CallCenterModelCopyWithImpl<$Res, $Val extends CallCenterModel>
    implements $CallCenterModelCopyWith<$Res> {
  _$CallCenterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CallCenterModelCopyWith<$Res>
    implements $CallCenterModelCopyWith<$Res> {
  factory _$$_CallCenterModelCopyWith(
          _$_CallCenterModel value, $Res Function(_$_CallCenterModel) then) =
      __$$_CallCenterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? link, String? phone});
}

/// @nodoc
class __$$_CallCenterModelCopyWithImpl<$Res>
    extends _$CallCenterModelCopyWithImpl<$Res, _$_CallCenterModel>
    implements _$$_CallCenterModelCopyWith<$Res> {
  __$$_CallCenterModelCopyWithImpl(
      _$_CallCenterModel _value, $Res Function(_$_CallCenterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$_CallCenterModel(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CallCenterModel implements _CallCenterModel {
  _$_CallCenterModel({this.link, this.phone});

  factory _$_CallCenterModel.fromJson(Map<String, dynamic> json) =>
      _$$_CallCenterModelFromJson(json);

  @override
  final String? link;
  @override
  final String? phone;

  @override
  String toString() {
    return 'CallCenterModel(link: $link, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallCenterModel &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, link, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallCenterModelCopyWith<_$_CallCenterModel> get copyWith =>
      __$$_CallCenterModelCopyWithImpl<_$_CallCenterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CallCenterModelToJson(
      this,
    );
  }
}

abstract class _CallCenterModel implements CallCenterModel {
  factory _CallCenterModel({final String? link, final String? phone}) =
      _$_CallCenterModel;

  factory _CallCenterModel.fromJson(Map<String, dynamic> json) =
      _$_CallCenterModel.fromJson;

  @override
  String? get link;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$_CallCenterModelCopyWith<_$_CallCenterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
