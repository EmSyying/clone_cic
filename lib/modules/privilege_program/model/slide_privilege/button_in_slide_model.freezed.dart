// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button_in_slide_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ButtonListModel _$ButtonListModelFromJson(Map<String, dynamic> json) {
  return _ButtonListModel.fromJson(json);
}

/// @nodoc
mixin _$ButtonListModel {
  String? get label => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ButtonListModelCopyWith<ButtonListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonListModelCopyWith<$Res> {
  factory $ButtonListModelCopyWith(
          ButtonListModel value, $Res Function(ButtonListModel) then) =
      _$ButtonListModelCopyWithImpl<$Res, ButtonListModel>;
  @useResult
  $Res call({String? label, String? icon, String? target});
}

/// @nodoc
class _$ButtonListModelCopyWithImpl<$Res, $Val extends ButtonListModel>
    implements $ButtonListModelCopyWith<$Res> {
  _$ButtonListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? icon = freezed,
    Object? target = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ButtonListModelCopyWith<$Res>
    implements $ButtonListModelCopyWith<$Res> {
  factory _$$_ButtonListModelCopyWith(
          _$_ButtonListModel value, $Res Function(_$_ButtonListModel) then) =
      __$$_ButtonListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, String? icon, String? target});
}

/// @nodoc
class __$$_ButtonListModelCopyWithImpl<$Res>
    extends _$ButtonListModelCopyWithImpl<$Res, _$_ButtonListModel>
    implements _$$_ButtonListModelCopyWith<$Res> {
  __$$_ButtonListModelCopyWithImpl(
      _$_ButtonListModel _value, $Res Function(_$_ButtonListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? icon = freezed,
    Object? target = freezed,
  }) {
    return _then(_$_ButtonListModel(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ButtonListModel implements _ButtonListModel {
  _$_ButtonListModel({this.label, this.icon, this.target});

  factory _$_ButtonListModel.fromJson(Map<String, dynamic> json) =>
      _$$_ButtonListModelFromJson(json);

  @override
  final String? label;
  @override
  final String? icon;
  @override
  final String? target;

  @override
  String toString() {
    return 'ButtonListModel(label: $label, icon: $icon, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ButtonListModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, icon, target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ButtonListModelCopyWith<_$_ButtonListModel> get copyWith =>
      __$$_ButtonListModelCopyWithImpl<_$_ButtonListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ButtonListModelToJson(
      this,
    );
  }
}

abstract class _ButtonListModel implements ButtonListModel {
  factory _ButtonListModel(
      {final String? label,
      final String? icon,
      final String? target}) = _$_ButtonListModel;

  factory _ButtonListModel.fromJson(Map<String, dynamic> json) =
      _$_ButtonListModel.fromJson;

  @override
  String? get label;
  @override
  String? get icon;
  @override
  String? get target;
  @override
  @JsonKey(ignore: true)
  _$$_ButtonListModelCopyWith<_$_ButtonListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
