// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'renew_period_month.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RenewPeroidMonth _$RenewPeroidMonthFromJson(Map<String, dynamic> json) {
  return _RenewPeroidMonth.fromJson(json);
}

/// @nodoc
mixin _$RenewPeroidMonth {
  List<String>? get renewPeriodList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RenewPeroidMonthCopyWith<RenewPeroidMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RenewPeroidMonthCopyWith<$Res> {
  factory $RenewPeroidMonthCopyWith(
          RenewPeroidMonth value, $Res Function(RenewPeroidMonth) then) =
      _$RenewPeroidMonthCopyWithImpl<$Res, RenewPeroidMonth>;
  @useResult
  $Res call({List<String>? renewPeriodList});
}

/// @nodoc
class _$RenewPeroidMonthCopyWithImpl<$Res, $Val extends RenewPeroidMonth>
    implements $RenewPeroidMonthCopyWith<$Res> {
  _$RenewPeroidMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? renewPeriodList = freezed,
  }) {
    return _then(_value.copyWith(
      renewPeriodList: freezed == renewPeriodList
          ? _value.renewPeriodList
          : renewPeriodList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RenewPeroidMonthCopyWith<$Res>
    implements $RenewPeroidMonthCopyWith<$Res> {
  factory _$$_RenewPeroidMonthCopyWith(
          _$_RenewPeroidMonth value, $Res Function(_$_RenewPeroidMonth) then) =
      __$$_RenewPeroidMonthCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? renewPeriodList});
}

/// @nodoc
class __$$_RenewPeroidMonthCopyWithImpl<$Res>
    extends _$RenewPeroidMonthCopyWithImpl<$Res, _$_RenewPeroidMonth>
    implements _$$_RenewPeroidMonthCopyWith<$Res> {
  __$$_RenewPeroidMonthCopyWithImpl(
      _$_RenewPeroidMonth _value, $Res Function(_$_RenewPeroidMonth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? renewPeriodList = freezed,
  }) {
    return _then(_$_RenewPeroidMonth(
      renewPeriodList: freezed == renewPeriodList
          ? _value._renewPeriodList
          : renewPeriodList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RenewPeroidMonth implements _RenewPeroidMonth {
  _$_RenewPeroidMonth({final List<String>? renewPeriodList})
      : _renewPeriodList = renewPeriodList;

  factory _$_RenewPeroidMonth.fromJson(Map<String, dynamic> json) =>
      _$$_RenewPeroidMonthFromJson(json);

  final List<String>? _renewPeriodList;
  @override
  List<String>? get renewPeriodList {
    final value = _renewPeriodList;
    if (value == null) return null;
    if (_renewPeriodList is EqualUnmodifiableListView) return _renewPeriodList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RenewPeroidMonth(renewPeriodList: $renewPeriodList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RenewPeroidMonth &&
            const DeepCollectionEquality()
                .equals(other._renewPeriodList, _renewPeriodList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_renewPeriodList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RenewPeroidMonthCopyWith<_$_RenewPeroidMonth> get copyWith =>
      __$$_RenewPeroidMonthCopyWithImpl<_$_RenewPeroidMonth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RenewPeroidMonthToJson(
      this,
    );
  }
}

abstract class _RenewPeroidMonth implements RenewPeroidMonth {
  factory _RenewPeroidMonth({final List<String>? renewPeriodList}) =
      _$_RenewPeroidMonth;

  factory _RenewPeroidMonth.fromJson(Map<String, dynamic> json) =
      _$_RenewPeroidMonth.fromJson;

  @override
  List<String>? get renewPeriodList;
  @override
  @JsonKey(ignore: true)
  _$$_RenewPeroidMonthCopyWith<_$_RenewPeroidMonth> get copyWith =>
      throw _privateConstructorUsedError;
}
