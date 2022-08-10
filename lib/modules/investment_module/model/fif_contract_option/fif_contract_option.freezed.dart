// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fif_contract_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FIFoptionModel _$FIFoptionModelFromJson(Map<String, dynamic> json) {
  return _FIFoptionModel.fromJson(json);
}

/// @nodoc
mixin _$FIFoptionModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "product_name")
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: "product_code")
  String? get productCode => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_product_id")
  int? get subid => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_product_name")
  String? get subproductName => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_product_code")
  String? get subproductCode => throw _privateConstructorUsedError;
  @JsonKey(name: "annually_interest_rate")
  String? get annuallyInterestRate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "url_webview")
  String? get urlWebview => throw _privateConstructorUsedError;
  @JsonKey(name: "investment_minimum")
  num? get investmentMinimum => throw _privateConstructorUsedError;
  @JsonKey(name: "investment_default")
  num? get investmentDefault => throw _privateConstructorUsedError;
  @JsonKey(name: "investment_maximum")
  num? get investmentMaximum => throw _privateConstructorUsedError;
  @JsonKey(name: "investment_message")
  String? get investmentMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "duration_minimum")
  num? get durationMinimum => throw _privateConstructorUsedError;
  @JsonKey(name: "duration_default")
  num? get durationDefault => throw _privateConstructorUsedError;
  @JsonKey(name: "duration_maximum")
  num? get durationMaximum => throw _privateConstructorUsedError;
  @JsonKey(name: "duration_message")
  String? get durationMessage => throw _privateConstructorUsedError;
  List<FIFoptionModel>? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FIFoptionModelCopyWith<FIFoptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FIFoptionModelCopyWith<$Res> {
  factory $FIFoptionModelCopyWith(
          FIFoptionModel value, $Res Function(FIFoptionModel) then) =
      _$FIFoptionModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: "product_name") String? productName,
      @JsonKey(name: "product_code") String? productCode,
      @JsonKey(name: "sub_product_id") int? subid,
      @JsonKey(name: "sub_product_name") String? subproductName,
      @JsonKey(name: "sub_product_code") String? subproductCode,
      @JsonKey(name: "annually_interest_rate") String? annuallyInterestRate,
      String? description,
      @JsonKey(name: "url_webview") String? urlWebview,
      @JsonKey(name: "investment_minimum") num? investmentMinimum,
      @JsonKey(name: "investment_default") num? investmentDefault,
      @JsonKey(name: "investment_maximum") num? investmentMaximum,
      @JsonKey(name: "investment_message") String? investmentMessage,
      @JsonKey(name: "duration_minimum") num? durationMinimum,
      @JsonKey(name: "duration_default") num? durationDefault,
      @JsonKey(name: "duration_maximum") num? durationMaximum,
      @JsonKey(name: "duration_message") String? durationMessage,
      List<FIFoptionModel>? options});
}

/// @nodoc
class _$FIFoptionModelCopyWithImpl<$Res>
    implements $FIFoptionModelCopyWith<$Res> {
  _$FIFoptionModelCopyWithImpl(this._value, this._then);

  final FIFoptionModel _value;
  // ignore: unused_field
  final $Res Function(FIFoptionModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? productCode = freezed,
    Object? subid = freezed,
    Object? subproductName = freezed,
    Object? subproductCode = freezed,
    Object? annuallyInterestRate = freezed,
    Object? description = freezed,
    Object? urlWebview = freezed,
    Object? investmentMinimum = freezed,
    Object? investmentDefault = freezed,
    Object? investmentMaximum = freezed,
    Object? investmentMessage = freezed,
    Object? durationMinimum = freezed,
    Object? durationDefault = freezed,
    Object? durationMaximum = freezed,
    Object? durationMessage = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productCode: productCode == freezed
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      subid: subid == freezed
          ? _value.subid
          : subid // ignore: cast_nullable_to_non_nullable
              as int?,
      subproductName: subproductName == freezed
          ? _value.subproductName
          : subproductName // ignore: cast_nullable_to_non_nullable
              as String?,
      subproductCode: subproductCode == freezed
          ? _value.subproductCode
          : subproductCode // ignore: cast_nullable_to_non_nullable
              as String?,
      annuallyInterestRate: annuallyInterestRate == freezed
          ? _value.annuallyInterestRate
          : annuallyInterestRate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      urlWebview: urlWebview == freezed
          ? _value.urlWebview
          : urlWebview // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentMinimum: investmentMinimum == freezed
          ? _value.investmentMinimum
          : investmentMinimum // ignore: cast_nullable_to_non_nullable
              as num?,
      investmentDefault: investmentDefault == freezed
          ? _value.investmentDefault
          : investmentDefault // ignore: cast_nullable_to_non_nullable
              as num?,
      investmentMaximum: investmentMaximum == freezed
          ? _value.investmentMaximum
          : investmentMaximum // ignore: cast_nullable_to_non_nullable
              as num?,
      investmentMessage: investmentMessage == freezed
          ? _value.investmentMessage
          : investmentMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMinimum: durationMinimum == freezed
          ? _value.durationMinimum
          : durationMinimum // ignore: cast_nullable_to_non_nullable
              as num?,
      durationDefault: durationDefault == freezed
          ? _value.durationDefault
          : durationDefault // ignore: cast_nullable_to_non_nullable
              as num?,
      durationMaximum: durationMaximum == freezed
          ? _value.durationMaximum
          : durationMaximum // ignore: cast_nullable_to_non_nullable
              as num?,
      durationMessage: durationMessage == freezed
          ? _value.durationMessage
          : durationMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<FIFoptionModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_FIFoptionModelCopyWith<$Res>
    implements $FIFoptionModelCopyWith<$Res> {
  factory _$$_FIFoptionModelCopyWith(
          _$_FIFoptionModel value, $Res Function(_$_FIFoptionModel) then) =
      __$$_FIFoptionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: "product_name") String? productName,
      @JsonKey(name: "product_code") String? productCode,
      @JsonKey(name: "sub_product_id") int? subid,
      @JsonKey(name: "sub_product_name") String? subproductName,
      @JsonKey(name: "sub_product_code") String? subproductCode,
      @JsonKey(name: "annually_interest_rate") String? annuallyInterestRate,
      String? description,
      @JsonKey(name: "url_webview") String? urlWebview,
      @JsonKey(name: "investment_minimum") num? investmentMinimum,
      @JsonKey(name: "investment_default") num? investmentDefault,
      @JsonKey(name: "investment_maximum") num? investmentMaximum,
      @JsonKey(name: "investment_message") String? investmentMessage,
      @JsonKey(name: "duration_minimum") num? durationMinimum,
      @JsonKey(name: "duration_default") num? durationDefault,
      @JsonKey(name: "duration_maximum") num? durationMaximum,
      @JsonKey(name: "duration_message") String? durationMessage,
      List<FIFoptionModel>? options});
}

/// @nodoc
class __$$_FIFoptionModelCopyWithImpl<$Res>
    extends _$FIFoptionModelCopyWithImpl<$Res>
    implements _$$_FIFoptionModelCopyWith<$Res> {
  __$$_FIFoptionModelCopyWithImpl(
      _$_FIFoptionModel _value, $Res Function(_$_FIFoptionModel) _then)
      : super(_value, (v) => _then(v as _$_FIFoptionModel));

  @override
  _$_FIFoptionModel get _value => super._value as _$_FIFoptionModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? productCode = freezed,
    Object? subid = freezed,
    Object? subproductName = freezed,
    Object? subproductCode = freezed,
    Object? annuallyInterestRate = freezed,
    Object? description = freezed,
    Object? urlWebview = freezed,
    Object? investmentMinimum = freezed,
    Object? investmentDefault = freezed,
    Object? investmentMaximum = freezed,
    Object? investmentMessage = freezed,
    Object? durationMinimum = freezed,
    Object? durationDefault = freezed,
    Object? durationMaximum = freezed,
    Object? durationMessage = freezed,
    Object? options = freezed,
  }) {
    return _then(_$_FIFoptionModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productCode: productCode == freezed
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      subid: subid == freezed
          ? _value.subid
          : subid // ignore: cast_nullable_to_non_nullable
              as int?,
      subproductName: subproductName == freezed
          ? _value.subproductName
          : subproductName // ignore: cast_nullable_to_non_nullable
              as String?,
      subproductCode: subproductCode == freezed
          ? _value.subproductCode
          : subproductCode // ignore: cast_nullable_to_non_nullable
              as String?,
      annuallyInterestRate: annuallyInterestRate == freezed
          ? _value.annuallyInterestRate
          : annuallyInterestRate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      urlWebview: urlWebview == freezed
          ? _value.urlWebview
          : urlWebview // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentMinimum: investmentMinimum == freezed
          ? _value.investmentMinimum
          : investmentMinimum // ignore: cast_nullable_to_non_nullable
              as num?,
      investmentDefault: investmentDefault == freezed
          ? _value.investmentDefault
          : investmentDefault // ignore: cast_nullable_to_non_nullable
              as num?,
      investmentMaximum: investmentMaximum == freezed
          ? _value.investmentMaximum
          : investmentMaximum // ignore: cast_nullable_to_non_nullable
              as num?,
      investmentMessage: investmentMessage == freezed
          ? _value.investmentMessage
          : investmentMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMinimum: durationMinimum == freezed
          ? _value.durationMinimum
          : durationMinimum // ignore: cast_nullable_to_non_nullable
              as num?,
      durationDefault: durationDefault == freezed
          ? _value.durationDefault
          : durationDefault // ignore: cast_nullable_to_non_nullable
              as num?,
      durationMaximum: durationMaximum == freezed
          ? _value.durationMaximum
          : durationMaximum // ignore: cast_nullable_to_non_nullable
              as num?,
      durationMessage: durationMessage == freezed
          ? _value.durationMessage
          : durationMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      options: options == freezed
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<FIFoptionModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FIFoptionModel implements _FIFoptionModel {
  _$_FIFoptionModel(
      {this.id,
      @JsonKey(name: "product_name") this.productName,
      @JsonKey(name: "product_code") this.productCode,
      @JsonKey(name: "sub_product_id") this.subid,
      @JsonKey(name: "sub_product_name") this.subproductName,
      @JsonKey(name: "sub_product_code") this.subproductCode,
      @JsonKey(name: "annually_interest_rate") this.annuallyInterestRate,
      this.description,
      @JsonKey(name: "url_webview") this.urlWebview,
      @JsonKey(name: "investment_minimum") this.investmentMinimum,
      @JsonKey(name: "investment_default") this.investmentDefault,
      @JsonKey(name: "investment_maximum") this.investmentMaximum,
      @JsonKey(name: "investment_message") this.investmentMessage,
      @JsonKey(name: "duration_minimum") this.durationMinimum,
      @JsonKey(name: "duration_default") this.durationDefault,
      @JsonKey(name: "duration_maximum") this.durationMaximum,
      @JsonKey(name: "duration_message") this.durationMessage,
      final List<FIFoptionModel>? options})
      : _options = options;

  factory _$_FIFoptionModel.fromJson(Map<String, dynamic> json) =>
      _$$_FIFoptionModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "product_name")
  final String? productName;
  @override
  @JsonKey(name: "product_code")
  final String? productCode;
  @override
  @JsonKey(name: "sub_product_id")
  final int? subid;
  @override
  @JsonKey(name: "sub_product_name")
  final String? subproductName;
  @override
  @JsonKey(name: "sub_product_code")
  final String? subproductCode;
  @override
  @JsonKey(name: "annually_interest_rate")
  final String? annuallyInterestRate;
  @override
  final String? description;
  @override
  @JsonKey(name: "url_webview")
  final String? urlWebview;
  @override
  @JsonKey(name: "investment_minimum")
  final num? investmentMinimum;
  @override
  @JsonKey(name: "investment_default")
  final num? investmentDefault;
  @override
  @JsonKey(name: "investment_maximum")
  final num? investmentMaximum;
  @override
  @JsonKey(name: "investment_message")
  final String? investmentMessage;
  @override
  @JsonKey(name: "duration_minimum")
  final num? durationMinimum;
  @override
  @JsonKey(name: "duration_default")
  final num? durationDefault;
  @override
  @JsonKey(name: "duration_maximum")
  final num? durationMaximum;
  @override
  @JsonKey(name: "duration_message")
  final String? durationMessage;
  final List<FIFoptionModel>? _options;
  @override
  List<FIFoptionModel>? get options {
    final value = _options;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FIFoptionModel(id: $id, productName: $productName, productCode: $productCode, subid: $subid, subproductName: $subproductName, subproductCode: $subproductCode, annuallyInterestRate: $annuallyInterestRate, description: $description, urlWebview: $urlWebview, investmentMinimum: $investmentMinimum, investmentDefault: $investmentDefault, investmentMaximum: $investmentMaximum, investmentMessage: $investmentMessage, durationMinimum: $durationMinimum, durationDefault: $durationDefault, durationMaximum: $durationMaximum, durationMessage: $durationMessage, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FIFoptionModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality()
                .equals(other.productCode, productCode) &&
            const DeepCollectionEquality().equals(other.subid, subid) &&
            const DeepCollectionEquality()
                .equals(other.subproductName, subproductName) &&
            const DeepCollectionEquality()
                .equals(other.subproductCode, subproductCode) &&
            const DeepCollectionEquality()
                .equals(other.annuallyInterestRate, annuallyInterestRate) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.urlWebview, urlWebview) &&
            const DeepCollectionEquality()
                .equals(other.investmentMinimum, investmentMinimum) &&
            const DeepCollectionEquality()
                .equals(other.investmentDefault, investmentDefault) &&
            const DeepCollectionEquality()
                .equals(other.investmentMaximum, investmentMaximum) &&
            const DeepCollectionEquality()
                .equals(other.investmentMessage, investmentMessage) &&
            const DeepCollectionEquality()
                .equals(other.durationMinimum, durationMinimum) &&
            const DeepCollectionEquality()
                .equals(other.durationDefault, durationDefault) &&
            const DeepCollectionEquality()
                .equals(other.durationMaximum, durationMaximum) &&
            const DeepCollectionEquality()
                .equals(other.durationMessage, durationMessage) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(productCode),
      const DeepCollectionEquality().hash(subid),
      const DeepCollectionEquality().hash(subproductName),
      const DeepCollectionEquality().hash(subproductCode),
      const DeepCollectionEquality().hash(annuallyInterestRate),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(urlWebview),
      const DeepCollectionEquality().hash(investmentMinimum),
      const DeepCollectionEquality().hash(investmentDefault),
      const DeepCollectionEquality().hash(investmentMaximum),
      const DeepCollectionEquality().hash(investmentMessage),
      const DeepCollectionEquality().hash(durationMinimum),
      const DeepCollectionEquality().hash(durationDefault),
      const DeepCollectionEquality().hash(durationMaximum),
      const DeepCollectionEquality().hash(durationMessage),
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  _$$_FIFoptionModelCopyWith<_$_FIFoptionModel> get copyWith =>
      __$$_FIFoptionModelCopyWithImpl<_$_FIFoptionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FIFoptionModelToJson(this);
  }
}

abstract class _FIFoptionModel implements FIFoptionModel {
  factory _FIFoptionModel(
      {final int? id,
      @JsonKey(name: "product_name")
          final String? productName,
      @JsonKey(name: "product_code")
          final String? productCode,
      @JsonKey(name: "sub_product_id")
          final int? subid,
      @JsonKey(name: "sub_product_name")
          final String? subproductName,
      @JsonKey(name: "sub_product_code")
          final String? subproductCode,
      @JsonKey(name: "annually_interest_rate")
          final String? annuallyInterestRate,
      final String? description,
      @JsonKey(name: "url_webview")
          final String? urlWebview,
      @JsonKey(name: "investment_minimum")
          final num? investmentMinimum,
      @JsonKey(name: "investment_default")
          final num? investmentDefault,
      @JsonKey(name: "investment_maximum")
          final num? investmentMaximum,
      @JsonKey(name: "investment_message")
          final String? investmentMessage,
      @JsonKey(name: "duration_minimum")
          final num? durationMinimum,
      @JsonKey(name: "duration_default")
          final num? durationDefault,
      @JsonKey(name: "duration_maximum")
          final num? durationMaximum,
      @JsonKey(name: "duration_message")
          final String? durationMessage,
      final List<FIFoptionModel>? options}) = _$_FIFoptionModel;

  factory _FIFoptionModel.fromJson(Map<String, dynamic> json) =
      _$_FIFoptionModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "product_name")
  String? get productName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "product_code")
  String? get productCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "sub_product_id")
  int? get subid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "sub_product_name")
  String? get subproductName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "sub_product_code")
  String? get subproductCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "annually_interest_rate")
  String? get annuallyInterestRate => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "url_webview")
  String? get urlWebview => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "investment_minimum")
  num? get investmentMinimum => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "investment_default")
  num? get investmentDefault => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "investment_maximum")
  num? get investmentMaximum => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "investment_message")
  String? get investmentMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "duration_minimum")
  num? get durationMinimum => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "duration_default")
  num? get durationDefault => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "duration_maximum")
  num? get durationMaximum => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "duration_message")
  String? get durationMessage => throw _privateConstructorUsedError;
  @override
  List<FIFoptionModel>? get options => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FIFoptionModelCopyWith<_$_FIFoptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
