// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_history_privilege.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrivilegeHistoryModel _$PrivilegeHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _PrivilegeHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$PrivilegeHistoryModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail")
  String? get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_name")
  String? get shopName => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_date")
  String? get paymentDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivilegeHistoryModelCopyWith<PrivilegeHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivilegeHistoryModelCopyWith<$Res> {
  factory $PrivilegeHistoryModelCopyWith(PrivilegeHistoryModel value,
          $Res Function(PrivilegeHistoryModel) then) =
      _$PrivilegeHistoryModelCopyWithImpl<$Res, PrivilegeHistoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "thumbnail") String? thumbnail,
      @JsonKey(name: "shop_name") String? shopName,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "payment_date") String? paymentDate});
}

/// @nodoc
class _$PrivilegeHistoryModelCopyWithImpl<$Res,
        $Val extends PrivilegeHistoryModel>
    implements $PrivilegeHistoryModelCopyWith<$Res> {
  _$PrivilegeHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? thumbnail = freezed,
    Object? shopName = freezed,
    Object? code = freezed,
    Object? amount = freezed,
    Object? paymentDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrivilegeHistoryModelCopyWith<$Res>
    implements $PrivilegeHistoryModelCopyWith<$Res> {
  factory _$$_PrivilegeHistoryModelCopyWith(_$_PrivilegeHistoryModel value,
          $Res Function(_$_PrivilegeHistoryModel) then) =
      __$$_PrivilegeHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "thumbnail") String? thumbnail,
      @JsonKey(name: "shop_name") String? shopName,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "payment_date") String? paymentDate});
}

/// @nodoc
class __$$_PrivilegeHistoryModelCopyWithImpl<$Res>
    extends _$PrivilegeHistoryModelCopyWithImpl<$Res, _$_PrivilegeHistoryModel>
    implements _$$_PrivilegeHistoryModelCopyWith<$Res> {
  __$$_PrivilegeHistoryModelCopyWithImpl(_$_PrivilegeHistoryModel _value,
      $Res Function(_$_PrivilegeHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? thumbnail = freezed,
    Object? shopName = freezed,
    Object? code = freezed,
    Object? amount = freezed,
    Object? paymentDate = freezed,
  }) {
    return _then(_$_PrivilegeHistoryModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrivilegeHistoryModel implements _PrivilegeHistoryModel {
  _$_PrivilegeHistoryModel(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "thumbnail") this.thumbnail,
      @JsonKey(name: "shop_name") this.shopName,
      @JsonKey(name: "code") this.code,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "payment_date") this.paymentDate});

  factory _$_PrivilegeHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_PrivilegeHistoryModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "thumbnail")
  final String? thumbnail;
  @override
  @JsonKey(name: "shop_name")
  final String? shopName;
  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "amount")
  final String? amount;
  @override
  @JsonKey(name: "payment_date")
  final String? paymentDate;

  @override
  String toString() {
    return 'PrivilegeHistoryModel(id: $id, thumbnail: $thumbnail, shopName: $shopName, code: $code, amount: $amount, paymentDate: $paymentDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrivilegeHistoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, thumbnail, shopName, code, amount, paymentDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrivilegeHistoryModelCopyWith<_$_PrivilegeHistoryModel> get copyWith =>
      __$$_PrivilegeHistoryModelCopyWithImpl<_$_PrivilegeHistoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrivilegeHistoryModelToJson(
      this,
    );
  }
}

abstract class _PrivilegeHistoryModel implements PrivilegeHistoryModel {
  factory _PrivilegeHistoryModel(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "thumbnail") final String? thumbnail,
          @JsonKey(name: "shop_name") final String? shopName,
          @JsonKey(name: "code") final String? code,
          @JsonKey(name: "amount") final String? amount,
          @JsonKey(name: "payment_date") final String? paymentDate}) =
      _$_PrivilegeHistoryModel;

  factory _PrivilegeHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_PrivilegeHistoryModel.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "thumbnail")
  String? get thumbnail;
  @override
  @JsonKey(name: "shop_name")
  String? get shopName;
  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "amount")
  String? get amount;
  @override
  @JsonKey(name: "payment_date")
  String? get paymentDate;
  @override
  @JsonKey(ignore: true)
  _$$_PrivilegeHistoryModelCopyWith<_$_PrivilegeHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
