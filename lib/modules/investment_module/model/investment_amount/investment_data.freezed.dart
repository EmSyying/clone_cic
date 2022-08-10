// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'investment_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvestmentDataModel _$InvestmentDataModelFromJson(Map<String, dynamic> json) {
  return _InvestmentDataModel.fromJson(json);
}

/// @nodoc
mixin _$InvestmentDataModel {
  @JsonKey(name: 'total_investment')
  String? get totalInvestment => throw _privateConstructorUsedError;
  @JsonKey(name: 'about_fif')
  String? get aboutFif => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  bool? get hide => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentDataModelCopyWith<InvestmentDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentDataModelCopyWith<$Res> {
  factory $InvestmentDataModelCopyWith(
          InvestmentDataModel value, $Res Function(InvestmentDataModel) then) =
      _$InvestmentDataModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'total_investment') String? totalInvestment,
      @JsonKey(name: 'about_fif') String? aboutFif,
      String? currency,
      bool? hide});
}

/// @nodoc
class _$InvestmentDataModelCopyWithImpl<$Res>
    implements $InvestmentDataModelCopyWith<$Res> {
  _$InvestmentDataModelCopyWithImpl(this._value, this._then);

  final InvestmentDataModel _value;
  // ignore: unused_field
  final $Res Function(InvestmentDataModel) _then;

  @override
  $Res call({
    Object? totalInvestment = freezed,
    Object? aboutFif = freezed,
    Object? currency = freezed,
    Object? hide = freezed,
  }) {
    return _then(_value.copyWith(
      totalInvestment: totalInvestment == freezed
          ? _value.totalInvestment
          : totalInvestment // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutFif: aboutFif == freezed
          ? _value.aboutFif
          : aboutFif // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_InvestmentDataModelCopyWith<$Res>
    implements $InvestmentDataModelCopyWith<$Res> {
  factory _$$_InvestmentDataModelCopyWith(_$_InvestmentDataModel value,
          $Res Function(_$_InvestmentDataModel) then) =
      __$$_InvestmentDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'total_investment') String? totalInvestment,
      @JsonKey(name: 'about_fif') String? aboutFif,
      String? currency,
      bool? hide});
}

/// @nodoc
class __$$_InvestmentDataModelCopyWithImpl<$Res>
    extends _$InvestmentDataModelCopyWithImpl<$Res>
    implements _$$_InvestmentDataModelCopyWith<$Res> {
  __$$_InvestmentDataModelCopyWithImpl(_$_InvestmentDataModel _value,
      $Res Function(_$_InvestmentDataModel) _then)
      : super(_value, (v) => _then(v as _$_InvestmentDataModel));

  @override
  _$_InvestmentDataModel get _value => super._value as _$_InvestmentDataModel;

  @override
  $Res call({
    Object? totalInvestment = freezed,
    Object? aboutFif = freezed,
    Object? currency = freezed,
    Object? hide = freezed,
  }) {
    return _then(_$_InvestmentDataModel(
      totalInvestment: totalInvestment == freezed
          ? _value.totalInvestment
          : totalInvestment // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutFif: aboutFif == freezed
          ? _value.aboutFif
          : aboutFif // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvestmentDataModel implements _InvestmentDataModel {
  _$_InvestmentDataModel(
      {@JsonKey(name: 'total_investment') this.totalInvestment,
      @JsonKey(name: 'about_fif') this.aboutFif,
      this.currency,
      this.hide});

  factory _$_InvestmentDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_InvestmentDataModelFromJson(json);

  @override
  @JsonKey(name: 'total_investment')
  final String? totalInvestment;
  @override
  @JsonKey(name: 'about_fif')
  final String? aboutFif;
  @override
  final String? currency;
  @override
  final bool? hide;

  @override
  String toString() {
    return 'InvestmentDataModel(totalInvestment: $totalInvestment, aboutFif: $aboutFif, currency: $currency, hide: $hide)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvestmentDataModel &&
            const DeepCollectionEquality()
                .equals(other.totalInvestment, totalInvestment) &&
            const DeepCollectionEquality().equals(other.aboutFif, aboutFif) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality().equals(other.hide, hide));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalInvestment),
      const DeepCollectionEquality().hash(aboutFif),
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(hide));

  @JsonKey(ignore: true)
  @override
  _$$_InvestmentDataModelCopyWith<_$_InvestmentDataModel> get copyWith =>
      __$$_InvestmentDataModelCopyWithImpl<_$_InvestmentDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvestmentDataModelToJson(this);
  }
}

abstract class _InvestmentDataModel implements InvestmentDataModel {
  factory _InvestmentDataModel(
      {@JsonKey(name: 'total_investment') final String? totalInvestment,
      @JsonKey(name: 'about_fif') final String? aboutFif,
      final String? currency,
      final bool? hide}) = _$_InvestmentDataModel;

  factory _InvestmentDataModel.fromJson(Map<String, dynamic> json) =
      _$_InvestmentDataModel.fromJson;

  @override
  @JsonKey(name: 'total_investment')
  String? get totalInvestment => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'about_fif')
  String? get aboutFif => throw _privateConstructorUsedError;
  @override
  String? get currency => throw _privateConstructorUsedError;
  @override
  bool? get hide => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InvestmentDataModelCopyWith<_$_InvestmentDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
