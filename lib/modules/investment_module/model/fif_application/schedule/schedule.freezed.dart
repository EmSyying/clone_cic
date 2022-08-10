// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleModelList _$ScheduleModelListFromJson(Map<String, dynamic> json) {
  return _ScheduleModelList.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModelList {
  String? get titel => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_date')
  String? get paymentDate => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get interest => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleModelListCopyWith<ScheduleModelList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelListCopyWith<$Res> {
  factory $ScheduleModelListCopyWith(
          ScheduleModelList value, $Res Function(ScheduleModelList) then) =
      _$ScheduleModelListCopyWithImpl<$Res>;
  $Res call(
      {String? titel,
      @JsonKey(name: 'payment_date') String? paymentDate,
      String? time,
      String? interest,
      String? status});
}

/// @nodoc
class _$ScheduleModelListCopyWithImpl<$Res>
    implements $ScheduleModelListCopyWith<$Res> {
  _$ScheduleModelListCopyWithImpl(this._value, this._then);

  final ScheduleModelList _value;
  // ignore: unused_field
  final $Res Function(ScheduleModelList) _then;

  @override
  $Res call({
    Object? titel = freezed,
    Object? paymentDate = freezed,
    Object? time = freezed,
    Object? interest = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      titel: titel == freezed
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: paymentDate == freezed
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      interest: interest == freezed
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ScheduleModelListCopyWith<$Res>
    implements $ScheduleModelListCopyWith<$Res> {
  factory _$$_ScheduleModelListCopyWith(_$_ScheduleModelList value,
          $Res Function(_$_ScheduleModelList) then) =
      __$$_ScheduleModelListCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? titel,
      @JsonKey(name: 'payment_date') String? paymentDate,
      String? time,
      String? interest,
      String? status});
}

/// @nodoc
class __$$_ScheduleModelListCopyWithImpl<$Res>
    extends _$ScheduleModelListCopyWithImpl<$Res>
    implements _$$_ScheduleModelListCopyWith<$Res> {
  __$$_ScheduleModelListCopyWithImpl(
      _$_ScheduleModelList _value, $Res Function(_$_ScheduleModelList) _then)
      : super(_value, (v) => _then(v as _$_ScheduleModelList));

  @override
  _$_ScheduleModelList get _value => super._value as _$_ScheduleModelList;

  @override
  $Res call({
    Object? titel = freezed,
    Object? paymentDate = freezed,
    Object? time = freezed,
    Object? interest = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ScheduleModelList(
      titel: titel == freezed
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: paymentDate == freezed
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      interest: interest == freezed
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleModelList implements _ScheduleModelList {
  _$_ScheduleModelList(
      {this.titel,
      @JsonKey(name: 'payment_date') this.paymentDate,
      this.time,
      this.interest,
      this.status});

  factory _$_ScheduleModelList.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleModelListFromJson(json);

  @override
  final String? titel;
  @override
  @JsonKey(name: 'payment_date')
  final String? paymentDate;
  @override
  final String? time;
  @override
  final String? interest;
  @override
  final String? status;

  @override
  String toString() {
    return 'ScheduleModelList(titel: $titel, paymentDate: $paymentDate, time: $time, interest: $interest, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleModelList &&
            const DeepCollectionEquality().equals(other.titel, titel) &&
            const DeepCollectionEquality()
                .equals(other.paymentDate, paymentDate) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.interest, interest) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(titel),
      const DeepCollectionEquality().hash(paymentDate),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(interest),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ScheduleModelListCopyWith<_$_ScheduleModelList> get copyWith =>
      __$$_ScheduleModelListCopyWithImpl<_$_ScheduleModelList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleModelListToJson(this);
  }
}

abstract class _ScheduleModelList implements ScheduleModelList {
  factory _ScheduleModelList(
      {final String? titel,
      @JsonKey(name: 'payment_date') final String? paymentDate,
      final String? time,
      final String? interest,
      final String? status}) = _$_ScheduleModelList;

  factory _ScheduleModelList.fromJson(Map<String, dynamic> json) =
      _$_ScheduleModelList.fromJson;

  @override
  String? get titel => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'payment_date')
  String? get paymentDate => throw _privateConstructorUsedError;
  @override
  String? get time => throw _privateConstructorUsedError;
  @override
  String? get interest => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleModelListCopyWith<_$_ScheduleModelList> get copyWith =>
      throw _privateConstructorUsedError;
}
