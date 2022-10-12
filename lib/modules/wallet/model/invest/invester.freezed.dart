// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invester.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvesterModel _$InvesterModelFromJson(Map<String, dynamic> json) {
  return _InvesterModel.fromJson(json);
}

/// @nodoc
mixin _$InvesterModel {
  @JsonKey(name: 'invester_id')
  String? get investerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invester_name')
  String? get investerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvesterModelCopyWith<InvesterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvesterModelCopyWith<$Res> {
  factory $InvesterModelCopyWith(
          InvesterModel value, $Res Function(InvesterModel) then) =
      _$InvesterModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'invester_id') String? investerId,
      @JsonKey(name: 'invester_name') String? investerName});
}

/// @nodoc
class _$InvesterModelCopyWithImpl<$Res>
    implements $InvesterModelCopyWith<$Res> {
  _$InvesterModelCopyWithImpl(this._value, this._then);

  final InvesterModel _value;
  // ignore: unused_field
  final $Res Function(InvesterModel) _then;

  @override
  $Res call({
    Object? investerId = freezed,
    Object? investerName = freezed,
  }) {
    return _then(_value.copyWith(
      investerId: investerId == freezed
          ? _value.investerId
          : investerId // ignore: cast_nullable_to_non_nullable
              as String?,
      investerName: investerName == freezed
          ? _value.investerName
          : investerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_InvesterModelCopyWith<$Res>
    implements $InvesterModelCopyWith<$Res> {
  factory _$$_InvesterModelCopyWith(
          _$_InvesterModel value, $Res Function(_$_InvesterModel) then) =
      __$$_InvesterModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'invester_id') String? investerId,
      @JsonKey(name: 'invester_name') String? investerName});
}

/// @nodoc
class __$$_InvesterModelCopyWithImpl<$Res>
    extends _$InvesterModelCopyWithImpl<$Res>
    implements _$$_InvesterModelCopyWith<$Res> {
  __$$_InvesterModelCopyWithImpl(
      _$_InvesterModel _value, $Res Function(_$_InvesterModel) _then)
      : super(_value, (v) => _then(v as _$_InvesterModel));

  @override
  _$_InvesterModel get _value => super._value as _$_InvesterModel;

  @override
  $Res call({
    Object? investerId = freezed,
    Object? investerName = freezed,
  }) {
    return _then(_$_InvesterModel(
      investerId: investerId == freezed
          ? _value.investerId
          : investerId // ignore: cast_nullable_to_non_nullable
              as String?,
      investerName: investerName == freezed
          ? _value.investerName
          : investerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvesterModel implements _InvesterModel {
  _$_InvesterModel(
      {@JsonKey(name: 'invester_id') this.investerId,
      @JsonKey(name: 'invester_name') this.investerName});

  factory _$_InvesterModel.fromJson(Map<String, dynamic> json) =>
      _$$_InvesterModelFromJson(json);

  @override
  @JsonKey(name: 'invester_id')
  final String? investerId;
  @override
  @JsonKey(name: 'invester_name')
  final String? investerName;

  @override
  String toString() {
    return 'InvesterModel(investerId: $investerId, investerName: $investerName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvesterModel &&
            const DeepCollectionEquality()
                .equals(other.investerId, investerId) &&
            const DeepCollectionEquality()
                .equals(other.investerName, investerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(investerId),
      const DeepCollectionEquality().hash(investerName));

  @JsonKey(ignore: true)
  @override
  _$$_InvesterModelCopyWith<_$_InvesterModel> get copyWith =>
      __$$_InvesterModelCopyWithImpl<_$_InvesterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvesterModelToJson(this);
  }
}

abstract class _InvesterModel implements InvesterModel {
  factory _InvesterModel(
          {@JsonKey(name: 'invester_id') final String? investerId,
          @JsonKey(name: 'invester_name') final String? investerName}) =
      _$_InvesterModel;

  factory _InvesterModel.fromJson(Map<String, dynamic> json) =
      _$_InvesterModel.fromJson;

  @override
  @JsonKey(name: 'invester_id')
  String? get investerId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'invester_name')
  String? get investerName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InvesterModelCopyWith<_$_InvesterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
