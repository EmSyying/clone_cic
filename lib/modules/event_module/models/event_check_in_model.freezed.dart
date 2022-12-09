// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_check_in_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckInModel _$CheckInModelFromJson(Map<String, dynamic> json) {
  return _CheckInModel.fromJson(json);
}

/// @nodoc
mixin _$CheckInModel {
  int? get id => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get display => throw _privateConstructorUsedError;
  String? get event =>
      throw _privateConstructorUsedError; // final Location? location,
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_cic_member')
  bool? get isCicMember => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_name')
  String? get participantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_member')
  String? get referralMember => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  bool? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in_date')
  String? get checkInDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckInModelCopyWith<CheckInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInModelCopyWith<$Res> {
  factory $CheckInModelCopyWith(
          CheckInModel value, $Res Function(CheckInModel) then) =
      _$CheckInModelCopyWithImpl<$Res, CheckInModel>;
  @useResult
  $Res call(
      {int? id,
      String? value,
      String? display,
      String? event,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'is_cic_member') bool? isCicMember,
      @JsonKey(name: 'participant_name') String? participantName,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'referral_member') String? referralMember,
      @JsonKey(name: 'check_in') bool? checkIn,
      @JsonKey(name: 'check_in_date') String? checkInDate});
}

/// @nodoc
class _$CheckInModelCopyWithImpl<$Res, $Val extends CheckInModel>
    implements $CheckInModelCopyWith<$Res> {
  _$CheckInModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? display = freezed,
    Object? event = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isCicMember = freezed,
    Object? participantName = freezed,
    Object? phoneNumber = freezed,
    Object? referralMember = freezed,
    Object? checkIn = freezed,
    Object? checkInDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isCicMember: freezed == isCicMember
          ? _value.isCicMember
          : isCicMember // ignore: cast_nullable_to_non_nullable
              as bool?,
      participantName: freezed == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      referralMember: freezed == referralMember
          ? _value.referralMember
          : referralMember // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckInModelCopyWith<$Res>
    implements $CheckInModelCopyWith<$Res> {
  factory _$$_CheckInModelCopyWith(
          _$_CheckInModel value, $Res Function(_$_CheckInModel) then) =
      __$$_CheckInModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? value,
      String? display,
      String? event,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'is_cic_member') bool? isCicMember,
      @JsonKey(name: 'participant_name') String? participantName,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'referral_member') String? referralMember,
      @JsonKey(name: 'check_in') bool? checkIn,
      @JsonKey(name: 'check_in_date') String? checkInDate});
}

/// @nodoc
class __$$_CheckInModelCopyWithImpl<$Res>
    extends _$CheckInModelCopyWithImpl<$Res, _$_CheckInModel>
    implements _$$_CheckInModelCopyWith<$Res> {
  __$$_CheckInModelCopyWithImpl(
      _$_CheckInModel _value, $Res Function(_$_CheckInModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? display = freezed,
    Object? event = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isCicMember = freezed,
    Object? participantName = freezed,
    Object? phoneNumber = freezed,
    Object? referralMember = freezed,
    Object? checkIn = freezed,
    Object? checkInDate = freezed,
  }) {
    return _then(_$_CheckInModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isCicMember: freezed == isCicMember
          ? _value.isCicMember
          : isCicMember // ignore: cast_nullable_to_non_nullable
              as bool?,
      participantName: freezed == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      referralMember: freezed == referralMember
          ? _value.referralMember
          : referralMember // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckInModel implements _CheckInModel {
  _$_CheckInModel(
      {this.id,
      this.value,
      this.display,
      this.event,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'is_cic_member') this.isCicMember,
      @JsonKey(name: 'participant_name') this.participantName,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'referral_member') this.referralMember,
      @JsonKey(name: 'check_in') this.checkIn,
      @JsonKey(name: 'check_in_date') this.checkInDate});

  factory _$_CheckInModel.fromJson(Map<String, dynamic> json) =>
      _$$_CheckInModelFromJson(json);

  @override
  final int? id;
  @override
  final String? value;
  @override
  final String? display;
  @override
  final String? event;
// final Location? location,
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  @JsonKey(name: 'is_cic_member')
  final bool? isCicMember;
  @override
  @JsonKey(name: 'participant_name')
  final String? participantName;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'referral_member')
  final String? referralMember;
  @override
  @JsonKey(name: 'check_in')
  final bool? checkIn;
  @override
  @JsonKey(name: 'check_in_date')
  final String? checkInDate;

  @override
  String toString() {
    return 'CheckInModel(id: $id, value: $value, display: $display, event: $event, startDate: $startDate, endDate: $endDate, isCicMember: $isCicMember, participantName: $participantName, phoneNumber: $phoneNumber, referralMember: $referralMember, checkIn: $checkIn, checkInDate: $checkInDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckInModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.display, display) || other.display == display) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isCicMember, isCicMember) ||
                other.isCicMember == isCicMember) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.referralMember, referralMember) ||
                other.referralMember == referralMember) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      value,
      display,
      event,
      startDate,
      endDate,
      isCicMember,
      participantName,
      phoneNumber,
      referralMember,
      checkIn,
      checkInDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckInModelCopyWith<_$_CheckInModel> get copyWith =>
      __$$_CheckInModelCopyWithImpl<_$_CheckInModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckInModelToJson(
      this,
    );
  }
}

abstract class _CheckInModel implements CheckInModel {
  factory _CheckInModel(
          {final int? id,
          final String? value,
          final String? display,
          final String? event,
          @JsonKey(name: 'start_date') final String? startDate,
          @JsonKey(name: 'end_date') final String? endDate,
          @JsonKey(name: 'is_cic_member') final bool? isCicMember,
          @JsonKey(name: 'participant_name') final String? participantName,
          @JsonKey(name: 'phone_number') final String? phoneNumber,
          @JsonKey(name: 'referral_member') final String? referralMember,
          @JsonKey(name: 'check_in') final bool? checkIn,
          @JsonKey(name: 'check_in_date') final String? checkInDate}) =
      _$_CheckInModel;

  factory _CheckInModel.fromJson(Map<String, dynamic> json) =
      _$_CheckInModel.fromJson;

  @override
  int? get id;
  @override
  String? get value;
  @override
  String? get display;
  @override
  String? get event;
  @override // final Location? location,
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  @JsonKey(name: 'is_cic_member')
  bool? get isCicMember;
  @override
  @JsonKey(name: 'participant_name')
  String? get participantName;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'referral_member')
  String? get referralMember;
  @override
  @JsonKey(name: 'check_in')
  bool? get checkIn;
  @override
  @JsonKey(name: 'check_in_date')
  String? get checkInDate;
  @override
  @JsonKey(ignore: true)
  _$$_CheckInModelCopyWith<_$_CheckInModel> get copyWith =>
      throw _privateConstructorUsedError;
}
