// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_checkin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectCheckInModel _$SelectCheckInModelFromJson(Map<String, dynamic> json) {
  return _SelectCheckInModel.fromJson(json);
}

/// @nodoc
mixin _$SelectCheckInModel {
  @JsonKey(name: "guest_id")
  int? get guestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectCheckInModelCopyWith<SelectCheckInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectCheckInModelCopyWith<$Res> {
  factory $SelectCheckInModelCopyWith(
          SelectCheckInModel value, $Res Function(SelectCheckInModel) then) =
      _$SelectCheckInModelCopyWithImpl<$Res, SelectCheckInModel>;
  @useResult
  $Res call({@JsonKey(name: "guest_id") int? guestId});
}

/// @nodoc
class _$SelectCheckInModelCopyWithImpl<$Res, $Val extends SelectCheckInModel>
    implements $SelectCheckInModelCopyWith<$Res> {
  _$SelectCheckInModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestId = freezed,
  }) {
    return _then(_value.copyWith(
      guestId: freezed == guestId
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectCheckInModelCopyWith<$Res>
    implements $SelectCheckInModelCopyWith<$Res> {
  factory _$$_SelectCheckInModelCopyWith(_$_SelectCheckInModel value,
          $Res Function(_$_SelectCheckInModel) then) =
      __$$_SelectCheckInModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "guest_id") int? guestId});
}

/// @nodoc
class __$$_SelectCheckInModelCopyWithImpl<$Res>
    extends _$SelectCheckInModelCopyWithImpl<$Res, _$_SelectCheckInModel>
    implements _$$_SelectCheckInModelCopyWith<$Res> {
  __$$_SelectCheckInModelCopyWithImpl(
      _$_SelectCheckInModel _value, $Res Function(_$_SelectCheckInModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestId = freezed,
  }) {
    return _then(_$_SelectCheckInModel(
      guestId: freezed == guestId
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelectCheckInModel implements _SelectCheckInModel {
  _$_SelectCheckInModel({@JsonKey(name: "guest_id") this.guestId});

  factory _$_SelectCheckInModel.fromJson(Map<String, dynamic> json) =>
      _$$_SelectCheckInModelFromJson(json);

  @override
  @JsonKey(name: "guest_id")
  final int? guestId;

  @override
  String toString() {
    return 'SelectCheckInModel(guestId: $guestId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectCheckInModel &&
            (identical(other.guestId, guestId) || other.guestId == guestId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, guestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectCheckInModelCopyWith<_$_SelectCheckInModel> get copyWith =>
      __$$_SelectCheckInModelCopyWithImpl<_$_SelectCheckInModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectCheckInModelToJson(
      this,
    );
  }
}

abstract class _SelectCheckInModel implements SelectCheckInModel {
  factory _SelectCheckInModel({@JsonKey(name: "guest_id") final int? guestId}) =
      _$_SelectCheckInModel;

  factory _SelectCheckInModel.fromJson(Map<String, dynamic> json) =
      _$_SelectCheckInModel.fromJson;

  @override
  @JsonKey(name: "guest_id")
  int? get guestId;
  @override
  @JsonKey(ignore: true)
  _$$_SelectCheckInModelCopyWith<_$_SelectCheckInModel> get copyWith =>
      throw _privateConstructorUsedError;
}
