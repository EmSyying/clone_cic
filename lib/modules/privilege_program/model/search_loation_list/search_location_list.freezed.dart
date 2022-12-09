// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_location_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchLocationListModel _$SearchLocationListModelFromJson(
    Map<String, dynamic> json) {
  return _SearchLocationListModel.fromJson(json);
}

/// @nodoc
mixin _$SearchLocationListModel {
  String? get code => throw _privateConstructorUsedError;
  String? get province => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_address')
  String? get fullAdress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchLocationListModelCopyWith<SearchLocationListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLocationListModelCopyWith<$Res> {
  factory $SearchLocationListModelCopyWith(SearchLocationListModel value,
          $Res Function(SearchLocationListModel) then) =
      _$SearchLocationListModelCopyWithImpl<$Res, SearchLocationListModel>;
  @useResult
  $Res call(
      {String? code,
      String? province,
      @JsonKey(name: 'full_address') String? fullAdress});
}

/// @nodoc
class _$SearchLocationListModelCopyWithImpl<$Res,
        $Val extends SearchLocationListModel>
    implements $SearchLocationListModelCopyWith<$Res> {
  _$SearchLocationListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? province = freezed,
    Object? fullAdress = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAdress: freezed == fullAdress
          ? _value.fullAdress
          : fullAdress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchLocationListModelCopyWith<$Res>
    implements $SearchLocationListModelCopyWith<$Res> {
  factory _$$_SearchLocationListModelCopyWith(_$_SearchLocationListModel value,
          $Res Function(_$_SearchLocationListModel) then) =
      __$$_SearchLocationListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? province,
      @JsonKey(name: 'full_address') String? fullAdress});
}

/// @nodoc
class __$$_SearchLocationListModelCopyWithImpl<$Res>
    extends _$SearchLocationListModelCopyWithImpl<$Res,
        _$_SearchLocationListModel>
    implements _$$_SearchLocationListModelCopyWith<$Res> {
  __$$_SearchLocationListModelCopyWithImpl(_$_SearchLocationListModel _value,
      $Res Function(_$_SearchLocationListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? province = freezed,
    Object? fullAdress = freezed,
  }) {
    return _then(_$_SearchLocationListModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAdress: freezed == fullAdress
          ? _value.fullAdress
          : fullAdress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchLocationListModel implements _SearchLocationListModel {
  _$_SearchLocationListModel(
      {this.code,
      this.province,
      @JsonKey(name: 'full_address') this.fullAdress});

  factory _$_SearchLocationListModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchLocationListModelFromJson(json);

  @override
  final String? code;
  @override
  final String? province;
  @override
  @JsonKey(name: 'full_address')
  final String? fullAdress;

  @override
  String toString() {
    return 'SearchLocationListModel(code: $code, province: $province, fullAdress: $fullAdress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchLocationListModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.fullAdress, fullAdress) ||
                other.fullAdress == fullAdress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, province, fullAdress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchLocationListModelCopyWith<_$_SearchLocationListModel>
      get copyWith =>
          __$$_SearchLocationListModelCopyWithImpl<_$_SearchLocationListModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchLocationListModelToJson(
      this,
    );
  }
}

abstract class _SearchLocationListModel implements SearchLocationListModel {
  factory _SearchLocationListModel(
          {final String? code,
          final String? province,
          @JsonKey(name: 'full_address') final String? fullAdress}) =
      _$_SearchLocationListModel;

  factory _SearchLocationListModel.fromJson(Map<String, dynamic> json) =
      _$_SearchLocationListModel.fromJson;

  @override
  String? get code;
  @override
  String? get province;
  @override
  @JsonKey(name: 'full_address')
  String? get fullAdress;
  @override
  @JsonKey(ignore: true)
  _$$_SearchLocationListModelCopyWith<_$_SearchLocationListModel>
      get copyWith => throw _privateConstructorUsedError;
}
