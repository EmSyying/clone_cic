// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mpv_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MVPHistoryModel _$MVPHistoryModelFromJson(Map<String, dynamic> json) {
  return _MVPHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$MVPHistoryModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "ref_id")
  String? get refId => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "transaction_type")
  String? get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_date")
  String? get paymentDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MVPHistoryModelCopyWith<MVPHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MVPHistoryModelCopyWith<$Res> {
  factory $MVPHistoryModelCopyWith(
          MVPHistoryModel value, $Res Function(MVPHistoryModel) then) =
      _$MVPHistoryModelCopyWithImpl<$Res, MVPHistoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "ref_id") String? refId,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "transaction_type") String? transactionType,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "payment_date") String? paymentDate});
}

/// @nodoc
class _$MVPHistoryModelCopyWithImpl<$Res, $Val extends MVPHistoryModel>
    implements $MVPHistoryModelCopyWith<$Res> {
  _$MVPHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? refId = freezed,
    Object? description = freezed,
    Object? transactionType = freezed,
    Object? amount = freezed,
    Object? paymentDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      refId: freezed == refId
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_MVPHistoryModelCopyWith<$Res>
    implements $MVPHistoryModelCopyWith<$Res> {
  factory _$$_MVPHistoryModelCopyWith(
          _$_MVPHistoryModel value, $Res Function(_$_MVPHistoryModel) then) =
      __$$_MVPHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "ref_id") String? refId,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "transaction_type") String? transactionType,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "payment_date") String? paymentDate});
}

/// @nodoc
class __$$_MVPHistoryModelCopyWithImpl<$Res>
    extends _$MVPHistoryModelCopyWithImpl<$Res, _$_MVPHistoryModel>
    implements _$$_MVPHistoryModelCopyWith<$Res> {
  __$$_MVPHistoryModelCopyWithImpl(
      _$_MVPHistoryModel _value, $Res Function(_$_MVPHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? refId = freezed,
    Object? description = freezed,
    Object? transactionType = freezed,
    Object? amount = freezed,
    Object? paymentDate = freezed,
  }) {
    return _then(_$_MVPHistoryModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      refId: freezed == refId
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
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
class _$_MVPHistoryModel implements _MVPHistoryModel {
  _$_MVPHistoryModel(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "ref_id") this.refId,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "transaction_type") this.transactionType,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "payment_date") this.paymentDate});

  factory _$_MVPHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_MVPHistoryModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "ref_id")
  final String? refId;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "transaction_type")
  final String? transactionType;
  @override
  @JsonKey(name: "amount")
  final String? amount;
  @override
  @JsonKey(name: "payment_date")
  final String? paymentDate;

  @override
  String toString() {
    return 'MVPHistoryModel(id: $id, refId: $refId, description: $description, transactionType: $transactionType, amount: $amount, paymentDate: $paymentDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MVPHistoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.refId, refId) || other.refId == refId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, refId, description,
      transactionType, amount, paymentDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MVPHistoryModelCopyWith<_$_MVPHistoryModel> get copyWith =>
      __$$_MVPHistoryModelCopyWithImpl<_$_MVPHistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MVPHistoryModelToJson(
      this,
    );
  }
}

abstract class _MVPHistoryModel implements MVPHistoryModel {
  factory _MVPHistoryModel(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "ref_id") final String? refId,
          @JsonKey(name: "description") final String? description,
          @JsonKey(name: "transaction_type") final String? transactionType,
          @JsonKey(name: "amount") final String? amount,
          @JsonKey(name: "payment_date") final String? paymentDate}) =
      _$_MVPHistoryModel;

  factory _MVPHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_MVPHistoryModel.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "ref_id")
  String? get refId;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "transaction_type")
  String? get transactionType;
  @override
  @JsonKey(name: "amount")
  String? get amount;
  @override
  @JsonKey(name: "payment_date")
  String? get paymentDate;
  @override
  @JsonKey(ignore: true)
  _$$_MVPHistoryModelCopyWith<_$_MVPHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
