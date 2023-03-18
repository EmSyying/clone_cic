// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcation_history_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionHisotryTemplateModel _$TransactionHisotryTemplateModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionHisotryTemplateModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionHisotryTemplateModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_name")
  String? get walletName => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_date")
  String? get paymentDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHisotryTemplateModelCopyWith<TransactionHisotryTemplateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHisotryTemplateModelCopyWith<$Res> {
  factory $TransactionHisotryTemplateModelCopyWith(
          TransactionHisotryTemplateModel value,
          $Res Function(TransactionHisotryTemplateModel) then) =
      _$TransactionHisotryTemplateModelCopyWithImpl<$Res,
          TransactionHisotryTemplateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "wallet_name") String? walletName,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "payment_date") String? paymentDate});
}

/// @nodoc
class _$TransactionHisotryTemplateModelCopyWithImpl<$Res,
        $Val extends TransactionHisotryTemplateModel>
    implements $TransactionHisotryTemplateModelCopyWith<$Res> {
  _$TransactionHisotryTemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? walletName = freezed,
    Object? amount = freezed,
    Object? paymentDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      walletName: freezed == walletName
          ? _value.walletName
          : walletName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TransactionHisotryTemplateModelCopyWith<$Res>
    implements $TransactionHisotryTemplateModelCopyWith<$Res> {
  factory _$$_TransactionHisotryTemplateModelCopyWith(
          _$_TransactionHisotryTemplateModel value,
          $Res Function(_$_TransactionHisotryTemplateModel) then) =
      __$$_TransactionHisotryTemplateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "wallet_name") String? walletName,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "payment_date") String? paymentDate});
}

/// @nodoc
class __$$_TransactionHisotryTemplateModelCopyWithImpl<$Res>
    extends _$TransactionHisotryTemplateModelCopyWithImpl<$Res,
        _$_TransactionHisotryTemplateModel>
    implements _$$_TransactionHisotryTemplateModelCopyWith<$Res> {
  __$$_TransactionHisotryTemplateModelCopyWithImpl(
      _$_TransactionHisotryTemplateModel _value,
      $Res Function(_$_TransactionHisotryTemplateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? walletName = freezed,
    Object? amount = freezed,
    Object? paymentDate = freezed,
  }) {
    return _then(_$_TransactionHisotryTemplateModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      walletName: freezed == walletName
          ? _value.walletName
          : walletName // ignore: cast_nullable_to_non_nullable
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
class _$_TransactionHisotryTemplateModel
    implements _TransactionHisotryTemplateModel {
  _$_TransactionHisotryTemplateModel(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "wallet_name") this.walletName,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "payment_date") this.paymentDate});

  factory _$_TransactionHisotryTemplateModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_TransactionHisotryTemplateModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "wallet_name")
  final String? walletName;
  @override
  @JsonKey(name: "amount")
  final String? amount;
  @override
  @JsonKey(name: "payment_date")
  final String? paymentDate;

  @override
  String toString() {
    return 'TransactionHisotryTemplateModel(id: $id, walletName: $walletName, amount: $amount, paymentDate: $paymentDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionHisotryTemplateModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletName, walletName) ||
                other.walletName == walletName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, walletName, amount, paymentDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionHisotryTemplateModelCopyWith<
          _$_TransactionHisotryTemplateModel>
      get copyWith => __$$_TransactionHisotryTemplateModelCopyWithImpl<
          _$_TransactionHisotryTemplateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionHisotryTemplateModelToJson(
      this,
    );
  }
}

abstract class _TransactionHisotryTemplateModel
    implements TransactionHisotryTemplateModel {
  factory _TransactionHisotryTemplateModel(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "wallet_name") final String? walletName,
          @JsonKey(name: "amount") final String? amount,
          @JsonKey(name: "payment_date") final String? paymentDate}) =
      _$_TransactionHisotryTemplateModel;

  factory _TransactionHisotryTemplateModel.fromJson(Map<String, dynamic> json) =
      _$_TransactionHisotryTemplateModel.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "wallet_name")
  String? get walletName;
  @override
  @JsonKey(name: "amount")
  String? get amount;
  @override
  @JsonKey(name: "payment_date")
  String? get paymentDate;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionHisotryTemplateModelCopyWith<
          _$_TransactionHisotryTemplateModel>
      get copyWith => throw _privateConstructorUsedError;
}
