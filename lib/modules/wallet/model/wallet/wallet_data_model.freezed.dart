// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletDataModel _$WalletDataModelFromJson(Map<String, dynamic> json) {
  return _WalletDataModel.fromJson(json);
}

/// @nodoc
mixin _$WalletDataModel {
  WalletAmountModel? get wallet => throw _privateConstructorUsedError;
  InvesterModel? get invester => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletDataModelCopyWith<WalletDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDataModelCopyWith<$Res> {
  factory $WalletDataModelCopyWith(
          WalletDataModel value, $Res Function(WalletDataModel) then) =
      _$WalletDataModelCopyWithImpl<$Res, WalletDataModel>;
  @useResult
  $Res call({WalletAmountModel? wallet, InvesterModel? invester});

  $WalletAmountModelCopyWith<$Res>? get wallet;
  $InvesterModelCopyWith<$Res>? get invester;
}

/// @nodoc
class _$WalletDataModelCopyWithImpl<$Res, $Val extends WalletDataModel>
    implements $WalletDataModelCopyWith<$Res> {
  _$WalletDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = freezed,
    Object? invester = freezed,
  }) {
    return _then(_value.copyWith(
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletAmountModel?,
      invester: freezed == invester
          ? _value.invester
          : invester // ignore: cast_nullable_to_non_nullable
              as InvesterModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletAmountModelCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletAmountModelCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InvesterModelCopyWith<$Res>? get invester {
    if (_value.invester == null) {
      return null;
    }

    return $InvesterModelCopyWith<$Res>(_value.invester!, (value) {
      return _then(_value.copyWith(invester: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WalletDataModelCopyWith<$Res>
    implements $WalletDataModelCopyWith<$Res> {
  factory _$$_WalletDataModelCopyWith(
          _$_WalletDataModel value, $Res Function(_$_WalletDataModel) then) =
      __$$_WalletDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WalletAmountModel? wallet, InvesterModel? invester});

  @override
  $WalletAmountModelCopyWith<$Res>? get wallet;
  @override
  $InvesterModelCopyWith<$Res>? get invester;
}

/// @nodoc
class __$$_WalletDataModelCopyWithImpl<$Res>
    extends _$WalletDataModelCopyWithImpl<$Res, _$_WalletDataModel>
    implements _$$_WalletDataModelCopyWith<$Res> {
  __$$_WalletDataModelCopyWithImpl(
      _$_WalletDataModel _value, $Res Function(_$_WalletDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = freezed,
    Object? invester = freezed,
  }) {
    return _then(_$_WalletDataModel(
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletAmountModel?,
      invester: freezed == invester
          ? _value.invester
          : invester // ignore: cast_nullable_to_non_nullable
              as InvesterModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletDataModel implements _WalletDataModel {
  _$_WalletDataModel({this.wallet, this.invester});

  factory _$_WalletDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletDataModelFromJson(json);

  @override
  final WalletAmountModel? wallet;
  @override
  final InvesterModel? invester;

  @override
  String toString() {
    return 'WalletDataModel(wallet: $wallet, invester: $invester)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletDataModel &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.invester, invester) ||
                other.invester == invester));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, wallet, invester);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletDataModelCopyWith<_$_WalletDataModel> get copyWith =>
      __$$_WalletDataModelCopyWithImpl<_$_WalletDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletDataModelToJson(
      this,
    );
  }
}

abstract class _WalletDataModel implements WalletDataModel {
  factory _WalletDataModel(
      {final WalletAmountModel? wallet,
      final InvesterModel? invester}) = _$_WalletDataModel;

  factory _WalletDataModel.fromJson(Map<String, dynamic> json) =
      _$_WalletDataModel.fromJson;

  @override
  WalletAmountModel? get wallet;
  @override
  InvesterModel? get invester;
  @override
  @JsonKey(ignore: true)
  _$$_WalletDataModelCopyWith<_$_WalletDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
