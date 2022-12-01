// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'guest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestListModel _$GuestListModelFromJson(Map<String, dynamic> json) {
  return _GuestListModel.fromJson(json);
}

/// @nodoc
mixin _$GuestListModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_name')
  String? get participantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get relationship => throw _privateConstructorUsedError;
  bool? get isCheckBox => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestListModelCopyWith<GuestListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestListModelCopyWith<$Res> {
  factory $GuestListModelCopyWith(
          GuestListModel value, $Res Function(GuestListModel) then) =
      _$GuestListModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'participant_name') String? participantName,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? relationship,
      bool? isCheckBox});
}

/// @nodoc
class _$GuestListModelCopyWithImpl<$Res>
    implements $GuestListModelCopyWith<$Res> {
  _$GuestListModelCopyWithImpl(this._value, this._then);

  final GuestListModel _value;
  // ignore: unused_field
  final $Res Function(GuestListModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? participantName = freezed,
    Object? phoneNumber = freezed,
    Object? relationship = freezed,
    Object? isCheckBox = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      participantName: participantName == freezed
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheckBox: isCheckBox == freezed
          ? _value.isCheckBox
          : isCheckBox // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_GuestListModelCopyWith<$Res>
    implements $GuestListModelCopyWith<$Res> {
  factory _$$_GuestListModelCopyWith(
          _$_GuestListModel value, $Res Function(_$_GuestListModel) then) =
      __$$_GuestListModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'participant_name') String? participantName,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? relationship,
      bool? isCheckBox});
}

/// @nodoc
class __$$_GuestListModelCopyWithImpl<$Res>
    extends _$GuestListModelCopyWithImpl<$Res>
    implements _$$_GuestListModelCopyWith<$Res> {
  __$$_GuestListModelCopyWithImpl(
      _$_GuestListModel _value, $Res Function(_$_GuestListModel) _then)
      : super(_value, (v) => _then(v as _$_GuestListModel));

  @override
  _$_GuestListModel get _value => super._value as _$_GuestListModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? participantName = freezed,
    Object? phoneNumber = freezed,
    Object? relationship = freezed,
    Object? isCheckBox = freezed,
  }) {
    return _then(_$_GuestListModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      participantName: participantName == freezed
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheckBox: isCheckBox == freezed
          ? _value.isCheckBox
          : isCheckBox // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuestListModel implements _GuestListModel {
  _$_GuestListModel(
      {this.id,
      @JsonKey(name: 'participant_name') this.participantName,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      this.relationship,
      this.isCheckBox = false});

  factory _$_GuestListModel.fromJson(Map<String, dynamic> json) =>
      _$$_GuestListModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'participant_name')
  final String? participantName;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  final String? relationship;
  @override
  @JsonKey()
  final bool? isCheckBox;

  @override
  String toString() {
    return 'GuestListModel(id: $id, participantName: $participantName, phoneNumber: $phoneNumber, relationship: $relationship, isCheckBox: $isCheckBox)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuestListModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.participantName, participantName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.relationship, relationship) &&
            const DeepCollectionEquality()
                .equals(other.isCheckBox, isCheckBox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(participantName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(relationship),
      const DeepCollectionEquality().hash(isCheckBox));

  @JsonKey(ignore: true)
  @override
  _$$_GuestListModelCopyWith<_$_GuestListModel> get copyWith =>
      __$$_GuestListModelCopyWithImpl<_$_GuestListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestListModelToJson(this);
  }
}

abstract class _GuestListModel implements GuestListModel {
  factory _GuestListModel(
      {final int? id,
      @JsonKey(name: 'participant_name') final String? participantName,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      final String? relationship,
      final bool? isCheckBox}) = _$_GuestListModel;

  factory _GuestListModel.fromJson(Map<String, dynamic> json) =
      _$_GuestListModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'participant_name')
  String? get participantName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get relationship => throw _privateConstructorUsedError;
  @override
  bool? get isCheckBox => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GuestListModelCopyWith<_$_GuestListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
