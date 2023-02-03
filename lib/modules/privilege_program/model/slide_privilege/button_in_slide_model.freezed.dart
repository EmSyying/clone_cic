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

buttonListModel _$buttonListModelFromJson(Map<String, dynamic> json) {
  return _buttonListModel.fromJson(json);
}

/// @nodoc
mixin _$buttonListModel {
  String? get label => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $buttonListModelCopyWith<buttonListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $buttonListModelCopyWith<$Res> {
  factory $buttonListModelCopyWith(
          buttonListModel value, $Res Function(buttonListModel) then) =
      _$buttonListModelCopyWithImpl<$Res, buttonListModel>;
  @useResult
  $Res call({String? label, String? icon, String? target});
}

/// @nodoc
class _$buttonListModelCopyWithImpl<$Res, $Val extends buttonListModel>
    implements $buttonListModelCopyWith<$Res> {
  _$buttonListModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_buttonListModelCopyWith<$Res>
    implements $buttonListModelCopyWith<$Res> {
  factory _$$_buttonListModelCopyWith(
          _$_buttonListModel value, $Res Function(_$_buttonListModel) then) =
      __$$_buttonListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, String? icon, String? target});
}

/// @nodoc
class __$$_buttonListModelCopyWithImpl<$Res>
    extends _$buttonListModelCopyWithImpl<$Res, _$_buttonListModel>
    implements _$$_buttonListModelCopyWith<$Res> {
  __$$_buttonListModelCopyWithImpl(
      _$_buttonListModel _value, $Res Function(_$_buttonListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? icon = freezed,
    Object? target = freezed,
  }) {
    return _then(_$_buttonListModel(
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
class _$_buttonListModel implements _buttonListModel {
  _$_buttonListModel({this.label, this.icon, this.target});

  factory _$_buttonListModel.fromJson(Map<String, dynamic> json) =>
      _$$_buttonListModelFromJson(json);

  @override
  final String? label;
  @override
  final String? icon;
  @override
  final String? target;

  @override
  String toString() {
    return 'buttonListModel(label: $label, icon: $icon, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_buttonListModel &&
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
  _$$_buttonListModelCopyWith<_$_buttonListModel> get copyWith =>
      __$$_buttonListModelCopyWithImpl<_$_buttonListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_buttonListModelToJson(
      this,
    );
  }
}

abstract class _buttonListModel implements buttonListModel {
  factory _buttonListModel(
      {final String? label,
      final String? icon,
      final String? target}) = _$_buttonListModel;

  factory _buttonListModel.fromJson(Map<String, dynamic> json) =
      _$_buttonListModel.fromJson;

  @override
  String? get label;
  @override
  String? get icon;
  @override
  String? get target;
  @override
  @JsonKey(ignore: true)
  _$$_buttonListModelCopyWith<_$_buttonListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
