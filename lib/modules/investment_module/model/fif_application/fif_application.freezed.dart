// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fif_application.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FiFApplicationDetailModel _$FiFApplicationDetailModelFromJson(
    Map<String, dynamic> json) {
  return _FiFApplicationDetailModel.fromJson(json);
}

/// @nodoc
mixin _$FiFApplicationDetailModel {
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_code')
  String? get productCode => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_product_id")
  int? get subid => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_product_name")
  String? get subproductName => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_product_code")
  String? get subproductCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name')
  String? get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'investment_amount')
  String? get investmentAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_amount')
  num? get originalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'deduction_amount')
  num? get deductionAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_interest_earned')
  String? get totalInterestEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_interest_earned')
  String? get monthlyInterestEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'annually_interest_rate')
  String? get annuallyInterestRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'investment_date')
  String? get investmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_payment_date')
  String? get firstPaymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'investment_amount_format')
  String? get investmentAmountFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'maturity_date')
  String? get maturityDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_duration')
  num? get originalDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_period')
  String? get durationPeriod => throw _privateConstructorUsedError;
  num? get paid => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_payment_method')
  String? get returnPaymenMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'mma_account_id')
  num? get mmaAccountid => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_id')
  num? get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: 'investor_name')
  String? get investorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_maturity')
  String? get endMaturity => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_principal')
  String? get currentPrincipal => throw _privateConstructorUsedError;
  @JsonKey(name: 'interest_type')
  String? get interestType => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_withdrawal')
  String? get allowWithdrawal => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum_withdrawal')
  num? get minimumWithdrawal => throw _privateConstructorUsedError;
  @JsonKey(name: 'withdrawal_message')
  String? get withdrawalMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_format')
  String? get paidFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_type')
  BankType? get bankType => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_progress_bar')
  num? get paymentProgressBar => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_code')
  String? get currencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_current_principal')
  String? get originalCurrentPrincipal => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto_renewal')
  String? get autoRenewal => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account')
  BankAccount? get bankAccount => throw _privateConstructorUsedError;
  List<ScheduleModelList>? get schedule => throw _privateConstructorUsedError;
  @JsonKey(name: 'withdrawal_notice')
  List<WithdrawNotice>? get withdrawalNotice =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FiFApplicationDetailModelCopyWith<FiFApplicationDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiFApplicationDetailModelCopyWith<$Res> {
  factory $FiFApplicationDetailModelCopyWith(FiFApplicationDetailModel value,
          $Res Function(FiFApplicationDetailModel) then) =
      _$FiFApplicationDetailModelCopyWithImpl<$Res, FiFApplicationDetailModel>;
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: 'product_id')
          int? productId,
      @JsonKey(name: 'product_code')
          String? productCode,
      @JsonKey(name: "sub_product_id")
          int? subid,
      @JsonKey(name: "sub_product_name")
          String? subproductName,
      @JsonKey(name: "sub_product_code")
          String? subproductCode,
      @JsonKey(name: 'account_name')
          String? accountName,
      @JsonKey(name: 'investment_amount')
          String? investmentAmount,
      @JsonKey(name: 'original_amount')
          num? originalAmount,
      @JsonKey(name: 'deduction_amount')
          num? deductionAmount,
      @JsonKey(name: 'total_interest_earned')
          String? totalInterestEarned,
      @JsonKey(name: 'monthly_interest_earned')
          String? monthlyInterestEarned,
      @JsonKey(name: 'product_name')
          String? productName,
      @JsonKey(name: 'annually_interest_rate')
          String? annuallyInterestRate,
      @JsonKey(name: 'investment_date')
          String? investmentDate,
      @JsonKey(name: 'first_payment_date')
          String? firstPaymentDate,
      @JsonKey(name: 'investment_amount_format')
          String? investmentAmountFormat,
      @JsonKey(name: 'maturity_date')
          String? maturityDate,
      String? description,
      String? duration,
      @JsonKey(name: 'original_duration')
          num? originalDuration,
      @JsonKey(name: 'duration_period')
          String? durationPeriod,
      num? paid,
      @JsonKey(name: 'return_payment_method')
          String? returnPaymenMethod,
      @JsonKey(name: 'mma_account_id')
          num? mmaAccountid,
      @JsonKey(name: 'bank_id')
          num? bankId,
      @JsonKey(name: 'investor_name')
          String? investorName,
      @JsonKey(name: 'end_maturity')
          String? endMaturity,
      @JsonKey(name: 'current_principal')
          String? currentPrincipal,
      @JsonKey(name: 'interest_type')
          String? interestType,
      @JsonKey(name: 'allow_withdrawal')
          String? allowWithdrawal,
      @JsonKey(name: 'minimum_withdrawal')
          num? minimumWithdrawal,
      @JsonKey(name: 'withdrawal_message')
          String? withdrawalMessage,
      @JsonKey(name: 'paid_format')
          String? paidFormat,
      @JsonKey(name: 'bank_type')
          BankType? bankType,
      @JsonKey(name: 'payment_progress_bar')
          num? paymentProgressBar,
      @JsonKey(name: 'currency_code')
          String? currencyCode,
      @JsonKey(name: 'original_current_principal')
          String? originalCurrentPrincipal,
      @JsonKey(name: 'auto_renewal')
          String? autoRenewal,
      @JsonKey(name: 'bank_account')
          BankAccount? bankAccount,
      List<ScheduleModelList>? schedule,
      @JsonKey(name: 'withdrawal_notice')
          List<WithdrawNotice>? withdrawalNotice});

  $BankTypeCopyWith<$Res>? get bankType;
  $BankAccountCopyWith<$Res>? get bankAccount;
}

/// @nodoc
class _$FiFApplicationDetailModelCopyWithImpl<$Res,
        $Val extends FiFApplicationDetailModel>
    implements $FiFApplicationDetailModelCopyWith<$Res> {
  _$FiFApplicationDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? productId = freezed,
    Object? productCode = freezed,
    Object? subid = freezed,
    Object? subproductName = freezed,
    Object? subproductCode = freezed,
    Object? accountName = freezed,
    Object? investmentAmount = freezed,
    Object? originalAmount = freezed,
    Object? deductionAmount = freezed,
    Object? totalInterestEarned = freezed,
    Object? monthlyInterestEarned = freezed,
    Object? productName = freezed,
    Object? annuallyInterestRate = freezed,
    Object? investmentDate = freezed,
    Object? firstPaymentDate = freezed,
    Object? investmentAmountFormat = freezed,
    Object? maturityDate = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? originalDuration = freezed,
    Object? durationPeriod = freezed,
    Object? paid = freezed,
    Object? returnPaymenMethod = freezed,
    Object? mmaAccountid = freezed,
    Object? bankId = freezed,
    Object? investorName = freezed,
    Object? endMaturity = freezed,
    Object? currentPrincipal = freezed,
    Object? interestType = freezed,
    Object? allowWithdrawal = freezed,
    Object? minimumWithdrawal = freezed,
    Object? withdrawalMessage = freezed,
    Object? paidFormat = freezed,
    Object? bankType = freezed,
    Object? paymentProgressBar = freezed,
    Object? currencyCode = freezed,
    Object? originalCurrentPrincipal = freezed,
    Object? autoRenewal = freezed,
    Object? bankAccount = freezed,
    Object? schedule = freezed,
    Object? withdrawalNotice = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      subid: freezed == subid
          ? _value.subid
          : subid // ignore: cast_nullable_to_non_nullable
              as int?,
      subproductName: freezed == subproductName
          ? _value.subproductName
          : subproductName // ignore: cast_nullable_to_non_nullable
              as String?,
      subproductCode: freezed == subproductCode
          ? _value.subproductCode
          : subproductCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentAmount: freezed == investmentAmount
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      originalAmount: freezed == originalAmount
          ? _value.originalAmount
          : originalAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      deductionAmount: freezed == deductionAmount
          ? _value.deductionAmount
          : deductionAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      totalInterestEarned: freezed == totalInterestEarned
          ? _value.totalInterestEarned
          : totalInterestEarned // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlyInterestEarned: freezed == monthlyInterestEarned
          ? _value.monthlyInterestEarned
          : monthlyInterestEarned // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      annuallyInterestRate: freezed == annuallyInterestRate
          ? _value.annuallyInterestRate
          : annuallyInterestRate // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentDate: freezed == investmentDate
          ? _value.investmentDate
          : investmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      firstPaymentDate: freezed == firstPaymentDate
          ? _value.firstPaymentDate
          : firstPaymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentAmountFormat: freezed == investmentAmountFormat
          ? _value.investmentAmountFormat
          : investmentAmountFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      maturityDate: freezed == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      originalDuration: freezed == originalDuration
          ? _value.originalDuration
          : originalDuration // ignore: cast_nullable_to_non_nullable
              as num?,
      durationPeriod: freezed == durationPeriod
          ? _value.durationPeriod
          : durationPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as num?,
      returnPaymenMethod: freezed == returnPaymenMethod
          ? _value.returnPaymenMethod
          : returnPaymenMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      mmaAccountid: freezed == mmaAccountid
          ? _value.mmaAccountid
          : mmaAccountid // ignore: cast_nullable_to_non_nullable
              as num?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as num?,
      investorName: freezed == investorName
          ? _value.investorName
          : investorName // ignore: cast_nullable_to_non_nullable
              as String?,
      endMaturity: freezed == endMaturity
          ? _value.endMaturity
          : endMaturity // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPrincipal: freezed == currentPrincipal
          ? _value.currentPrincipal
          : currentPrincipal // ignore: cast_nullable_to_non_nullable
              as String?,
      interestType: freezed == interestType
          ? _value.interestType
          : interestType // ignore: cast_nullable_to_non_nullable
              as String?,
      allowWithdrawal: freezed == allowWithdrawal
          ? _value.allowWithdrawal
          : allowWithdrawal // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumWithdrawal: freezed == minimumWithdrawal
          ? _value.minimumWithdrawal
          : minimumWithdrawal // ignore: cast_nullable_to_non_nullable
              as num?,
      withdrawalMessage: freezed == withdrawalMessage
          ? _value.withdrawalMessage
          : withdrawalMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paidFormat: freezed == paidFormat
          ? _value.paidFormat
          : paidFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      bankType: freezed == bankType
          ? _value.bankType
          : bankType // ignore: cast_nullable_to_non_nullable
              as BankType?,
      paymentProgressBar: freezed == paymentProgressBar
          ? _value.paymentProgressBar
          : paymentProgressBar // ignore: cast_nullable_to_non_nullable
              as num?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      originalCurrentPrincipal: freezed == originalCurrentPrincipal
          ? _value.originalCurrentPrincipal
          : originalCurrentPrincipal // ignore: cast_nullable_to_non_nullable
              as String?,
      autoRenewal: freezed == autoRenewal
          ? _value.autoRenewal
          : autoRenewal // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModelList>?,
      withdrawalNotice: freezed == withdrawalNotice
          ? _value.withdrawalNotice
          : withdrawalNotice // ignore: cast_nullable_to_non_nullable
              as List<WithdrawNotice>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankTypeCopyWith<$Res>? get bankType {
    if (_value.bankType == null) {
      return null;
    }

    return $BankTypeCopyWith<$Res>(_value.bankType!, (value) {
      return _then(_value.copyWith(bankType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BankAccountCopyWith<$Res>? get bankAccount {
    if (_value.bankAccount == null) {
      return null;
    }

    return $BankAccountCopyWith<$Res>(_value.bankAccount!, (value) {
      return _then(_value.copyWith(bankAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FiFApplicationDetailModelCopyWith<$Res>
    implements $FiFApplicationDetailModelCopyWith<$Res> {
  factory _$$_FiFApplicationDetailModelCopyWith(
          _$_FiFApplicationDetailModel value,
          $Res Function(_$_FiFApplicationDetailModel) then) =
      __$$_FiFApplicationDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: 'product_id')
          int? productId,
      @JsonKey(name: 'product_code')
          String? productCode,
      @JsonKey(name: "sub_product_id")
          int? subid,
      @JsonKey(name: "sub_product_name")
          String? subproductName,
      @JsonKey(name: "sub_product_code")
          String? subproductCode,
      @JsonKey(name: 'account_name')
          String? accountName,
      @JsonKey(name: 'investment_amount')
          String? investmentAmount,
      @JsonKey(name: 'original_amount')
          num? originalAmount,
      @JsonKey(name: 'deduction_amount')
          num? deductionAmount,
      @JsonKey(name: 'total_interest_earned')
          String? totalInterestEarned,
      @JsonKey(name: 'monthly_interest_earned')
          String? monthlyInterestEarned,
      @JsonKey(name: 'product_name')
          String? productName,
      @JsonKey(name: 'annually_interest_rate')
          String? annuallyInterestRate,
      @JsonKey(name: 'investment_date')
          String? investmentDate,
      @JsonKey(name: 'first_payment_date')
          String? firstPaymentDate,
      @JsonKey(name: 'investment_amount_format')
          String? investmentAmountFormat,
      @JsonKey(name: 'maturity_date')
          String? maturityDate,
      String? description,
      String? duration,
      @JsonKey(name: 'original_duration')
          num? originalDuration,
      @JsonKey(name: 'duration_period')
          String? durationPeriod,
      num? paid,
      @JsonKey(name: 'return_payment_method')
          String? returnPaymenMethod,
      @JsonKey(name: 'mma_account_id')
          num? mmaAccountid,
      @JsonKey(name: 'bank_id')
          num? bankId,
      @JsonKey(name: 'investor_name')
          String? investorName,
      @JsonKey(name: 'end_maturity')
          String? endMaturity,
      @JsonKey(name: 'current_principal')
          String? currentPrincipal,
      @JsonKey(name: 'interest_type')
          String? interestType,
      @JsonKey(name: 'allow_withdrawal')
          String? allowWithdrawal,
      @JsonKey(name: 'minimum_withdrawal')
          num? minimumWithdrawal,
      @JsonKey(name: 'withdrawal_message')
          String? withdrawalMessage,
      @JsonKey(name: 'paid_format')
          String? paidFormat,
      @JsonKey(name: 'bank_type')
          BankType? bankType,
      @JsonKey(name: 'payment_progress_bar')
          num? paymentProgressBar,
      @JsonKey(name: 'currency_code')
          String? currencyCode,
      @JsonKey(name: 'original_current_principal')
          String? originalCurrentPrincipal,
      @JsonKey(name: 'auto_renewal')
          String? autoRenewal,
      @JsonKey(name: 'bank_account')
          BankAccount? bankAccount,
      List<ScheduleModelList>? schedule,
      @JsonKey(name: 'withdrawal_notice')
          List<WithdrawNotice>? withdrawalNotice});

  @override
  $BankTypeCopyWith<$Res>? get bankType;
  @override
  $BankAccountCopyWith<$Res>? get bankAccount;
}

/// @nodoc
class __$$_FiFApplicationDetailModelCopyWithImpl<$Res>
    extends _$FiFApplicationDetailModelCopyWithImpl<$Res,
        _$_FiFApplicationDetailModel>
    implements _$$_FiFApplicationDetailModelCopyWith<$Res> {
  __$$_FiFApplicationDetailModelCopyWithImpl(
      _$_FiFApplicationDetailModel _value,
      $Res Function(_$_FiFApplicationDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? productId = freezed,
    Object? productCode = freezed,
    Object? subid = freezed,
    Object? subproductName = freezed,
    Object? subproductCode = freezed,
    Object? accountName = freezed,
    Object? investmentAmount = freezed,
    Object? originalAmount = freezed,
    Object? deductionAmount = freezed,
    Object? totalInterestEarned = freezed,
    Object? monthlyInterestEarned = freezed,
    Object? productName = freezed,
    Object? annuallyInterestRate = freezed,
    Object? investmentDate = freezed,
    Object? firstPaymentDate = freezed,
    Object? investmentAmountFormat = freezed,
    Object? maturityDate = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? originalDuration = freezed,
    Object? durationPeriod = freezed,
    Object? paid = freezed,
    Object? returnPaymenMethod = freezed,
    Object? mmaAccountid = freezed,
    Object? bankId = freezed,
    Object? investorName = freezed,
    Object? endMaturity = freezed,
    Object? currentPrincipal = freezed,
    Object? interestType = freezed,
    Object? allowWithdrawal = freezed,
    Object? minimumWithdrawal = freezed,
    Object? withdrawalMessage = freezed,
    Object? paidFormat = freezed,
    Object? bankType = freezed,
    Object? paymentProgressBar = freezed,
    Object? currencyCode = freezed,
    Object? originalCurrentPrincipal = freezed,
    Object? autoRenewal = freezed,
    Object? bankAccount = freezed,
    Object? schedule = freezed,
    Object? withdrawalNotice = freezed,
  }) {
    return _then(_$_FiFApplicationDetailModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      subid: freezed == subid
          ? _value.subid
          : subid // ignore: cast_nullable_to_non_nullable
              as int?,
      subproductName: freezed == subproductName
          ? _value.subproductName
          : subproductName // ignore: cast_nullable_to_non_nullable
              as String?,
      subproductCode: freezed == subproductCode
          ? _value.subproductCode
          : subproductCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentAmount: freezed == investmentAmount
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      originalAmount: freezed == originalAmount
          ? _value.originalAmount
          : originalAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      deductionAmount: freezed == deductionAmount
          ? _value.deductionAmount
          : deductionAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      totalInterestEarned: freezed == totalInterestEarned
          ? _value.totalInterestEarned
          : totalInterestEarned // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlyInterestEarned: freezed == monthlyInterestEarned
          ? _value.monthlyInterestEarned
          : monthlyInterestEarned // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      annuallyInterestRate: freezed == annuallyInterestRate
          ? _value.annuallyInterestRate
          : annuallyInterestRate // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentDate: freezed == investmentDate
          ? _value.investmentDate
          : investmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      firstPaymentDate: freezed == firstPaymentDate
          ? _value.firstPaymentDate
          : firstPaymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      investmentAmountFormat: freezed == investmentAmountFormat
          ? _value.investmentAmountFormat
          : investmentAmountFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      maturityDate: freezed == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      originalDuration: freezed == originalDuration
          ? _value.originalDuration
          : originalDuration // ignore: cast_nullable_to_non_nullable
              as num?,
      durationPeriod: freezed == durationPeriod
          ? _value.durationPeriod
          : durationPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as num?,
      returnPaymenMethod: freezed == returnPaymenMethod
          ? _value.returnPaymenMethod
          : returnPaymenMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      mmaAccountid: freezed == mmaAccountid
          ? _value.mmaAccountid
          : mmaAccountid // ignore: cast_nullable_to_non_nullable
              as num?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as num?,
      investorName: freezed == investorName
          ? _value.investorName
          : investorName // ignore: cast_nullable_to_non_nullable
              as String?,
      endMaturity: freezed == endMaturity
          ? _value.endMaturity
          : endMaturity // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPrincipal: freezed == currentPrincipal
          ? _value.currentPrincipal
          : currentPrincipal // ignore: cast_nullable_to_non_nullable
              as String?,
      interestType: freezed == interestType
          ? _value.interestType
          : interestType // ignore: cast_nullable_to_non_nullable
              as String?,
      allowWithdrawal: freezed == allowWithdrawal
          ? _value.allowWithdrawal
          : allowWithdrawal // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumWithdrawal: freezed == minimumWithdrawal
          ? _value.minimumWithdrawal
          : minimumWithdrawal // ignore: cast_nullable_to_non_nullable
              as num?,
      withdrawalMessage: freezed == withdrawalMessage
          ? _value.withdrawalMessage
          : withdrawalMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paidFormat: freezed == paidFormat
          ? _value.paidFormat
          : paidFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      bankType: freezed == bankType
          ? _value.bankType
          : bankType // ignore: cast_nullable_to_non_nullable
              as BankType?,
      paymentProgressBar: freezed == paymentProgressBar
          ? _value.paymentProgressBar
          : paymentProgressBar // ignore: cast_nullable_to_non_nullable
              as num?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      originalCurrentPrincipal: freezed == originalCurrentPrincipal
          ? _value.originalCurrentPrincipal
          : originalCurrentPrincipal // ignore: cast_nullable_to_non_nullable
              as String?,
      autoRenewal: freezed == autoRenewal
          ? _value.autoRenewal
          : autoRenewal // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount?,
      schedule: freezed == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModelList>?,
      withdrawalNotice: freezed == withdrawalNotice
          ? _value._withdrawalNotice
          : withdrawalNotice // ignore: cast_nullable_to_non_nullable
              as List<WithdrawNotice>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FiFApplicationDetailModel implements _FiFApplicationDetailModel {
  _$_FiFApplicationDetailModel(
      {this.code,
      @JsonKey(name: 'product_id')
          this.productId,
      @JsonKey(name: 'product_code')
          this.productCode,
      @JsonKey(name: "sub_product_id")
          this.subid,
      @JsonKey(name: "sub_product_name")
          this.subproductName,
      @JsonKey(name: "sub_product_code")
          this.subproductCode,
      @JsonKey(name: 'account_name')
          this.accountName,
      @JsonKey(name: 'investment_amount')
          this.investmentAmount,
      @JsonKey(name: 'original_amount')
          this.originalAmount,
      @JsonKey(name: 'deduction_amount')
          this.deductionAmount,
      @JsonKey(name: 'total_interest_earned')
          this.totalInterestEarned,
      @JsonKey(name: 'monthly_interest_earned')
          this.monthlyInterestEarned,
      @JsonKey(name: 'product_name')
          this.productName,
      @JsonKey(name: 'annually_interest_rate')
          this.annuallyInterestRate,
      @JsonKey(name: 'investment_date')
          this.investmentDate,
      @JsonKey(name: 'first_payment_date')
          this.firstPaymentDate,
      @JsonKey(name: 'investment_amount_format')
          this.investmentAmountFormat,
      @JsonKey(name: 'maturity_date')
          this.maturityDate,
      this.description,
      this.duration,
      @JsonKey(name: 'original_duration')
          this.originalDuration,
      @JsonKey(name: 'duration_period')
          this.durationPeriod,
      this.paid,
      @JsonKey(name: 'return_payment_method')
          this.returnPaymenMethod,
      @JsonKey(name: 'mma_account_id')
          this.mmaAccountid,
      @JsonKey(name: 'bank_id')
          this.bankId,
      @JsonKey(name: 'investor_name')
          this.investorName,
      @JsonKey(name: 'end_maturity')
          this.endMaturity,
      @JsonKey(name: 'current_principal')
          this.currentPrincipal,
      @JsonKey(name: 'interest_type')
          this.interestType,
      @JsonKey(name: 'allow_withdrawal')
          this.allowWithdrawal,
      @JsonKey(name: 'minimum_withdrawal')
          this.minimumWithdrawal,
      @JsonKey(name: 'withdrawal_message')
          this.withdrawalMessage,
      @JsonKey(name: 'paid_format')
          this.paidFormat,
      @JsonKey(name: 'bank_type')
          this.bankType,
      @JsonKey(name: 'payment_progress_bar')
          this.paymentProgressBar,
      @JsonKey(name: 'currency_code')
          this.currencyCode,
      @JsonKey(name: 'original_current_principal')
          this.originalCurrentPrincipal,
      @JsonKey(name: 'auto_renewal')
          this.autoRenewal,
      @JsonKey(name: 'bank_account')
          this.bankAccount,
      final List<ScheduleModelList>? schedule,
      @JsonKey(name: 'withdrawal_notice')
          final List<WithdrawNotice>? withdrawalNotice})
      : _schedule = schedule,
        _withdrawalNotice = withdrawalNotice;

  factory _$_FiFApplicationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_FiFApplicationDetailModelFromJson(json);

  @override
  final String? code;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'product_code')
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
  @JsonKey(name: 'account_name')
  final String? accountName;
  @override
  @JsonKey(name: 'investment_amount')
  final String? investmentAmount;
  @override
  @JsonKey(name: 'original_amount')
  final num? originalAmount;
  @override
  @JsonKey(name: 'deduction_amount')
  final num? deductionAmount;
  @override
  @JsonKey(name: 'total_interest_earned')
  final String? totalInterestEarned;
  @override
  @JsonKey(name: 'monthly_interest_earned')
  final String? monthlyInterestEarned;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  @JsonKey(name: 'annually_interest_rate')
  final String? annuallyInterestRate;
  @override
  @JsonKey(name: 'investment_date')
  final String? investmentDate;
  @override
  @JsonKey(name: 'first_payment_date')
  final String? firstPaymentDate;
  @override
  @JsonKey(name: 'investment_amount_format')
  final String? investmentAmountFormat;
  @override
  @JsonKey(name: 'maturity_date')
  final String? maturityDate;
  @override
  final String? description;
  @override
  final String? duration;
  @override
  @JsonKey(name: 'original_duration')
  final num? originalDuration;
  @override
  @JsonKey(name: 'duration_period')
  final String? durationPeriod;
  @override
  final num? paid;
  @override
  @JsonKey(name: 'return_payment_method')
  final String? returnPaymenMethod;
  @override
  @JsonKey(name: 'mma_account_id')
  final num? mmaAccountid;
  @override
  @JsonKey(name: 'bank_id')
  final num? bankId;
  @override
  @JsonKey(name: 'investor_name')
  final String? investorName;
  @override
  @JsonKey(name: 'end_maturity')
  final String? endMaturity;
  @override
  @JsonKey(name: 'current_principal')
  final String? currentPrincipal;
  @override
  @JsonKey(name: 'interest_type')
  final String? interestType;
  @override
  @JsonKey(name: 'allow_withdrawal')
  final String? allowWithdrawal;
  @override
  @JsonKey(name: 'minimum_withdrawal')
  final num? minimumWithdrawal;
  @override
  @JsonKey(name: 'withdrawal_message')
  final String? withdrawalMessage;
  @override
  @JsonKey(name: 'paid_format')
  final String? paidFormat;
  @override
  @JsonKey(name: 'bank_type')
  final BankType? bankType;
  @override
  @JsonKey(name: 'payment_progress_bar')
  final num? paymentProgressBar;
  @override
  @JsonKey(name: 'currency_code')
  final String? currencyCode;
  @override
  @JsonKey(name: 'original_current_principal')
  final String? originalCurrentPrincipal;
  @override
  @JsonKey(name: 'auto_renewal')
  final String? autoRenewal;
  @override
  @JsonKey(name: 'bank_account')
  final BankAccount? bankAccount;
  final List<ScheduleModelList>? _schedule;
  @override
  List<ScheduleModelList>? get schedule {
    final value = _schedule;
    if (value == null) return null;
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WithdrawNotice>? _withdrawalNotice;
  @override
  @JsonKey(name: 'withdrawal_notice')
  List<WithdrawNotice>? get withdrawalNotice {
    final value = _withdrawalNotice;
    if (value == null) return null;
    if (_withdrawalNotice is EqualUnmodifiableListView)
      return _withdrawalNotice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FiFApplicationDetailModel(code: $code, productId: $productId, productCode: $productCode, subid: $subid, subproductName: $subproductName, subproductCode: $subproductCode, accountName: $accountName, investmentAmount: $investmentAmount, originalAmount: $originalAmount, deductionAmount: $deductionAmount, totalInterestEarned: $totalInterestEarned, monthlyInterestEarned: $monthlyInterestEarned, productName: $productName, annuallyInterestRate: $annuallyInterestRate, investmentDate: $investmentDate, firstPaymentDate: $firstPaymentDate, investmentAmountFormat: $investmentAmountFormat, maturityDate: $maturityDate, description: $description, duration: $duration, originalDuration: $originalDuration, durationPeriod: $durationPeriod, paid: $paid, returnPaymenMethod: $returnPaymenMethod, mmaAccountid: $mmaAccountid, bankId: $bankId, investorName: $investorName, endMaturity: $endMaturity, currentPrincipal: $currentPrincipal, interestType: $interestType, allowWithdrawal: $allowWithdrawal, minimumWithdrawal: $minimumWithdrawal, withdrawalMessage: $withdrawalMessage, paidFormat: $paidFormat, bankType: $bankType, paymentProgressBar: $paymentProgressBar, currencyCode: $currencyCode, originalCurrentPrincipal: $originalCurrentPrincipal, autoRenewal: $autoRenewal, bankAccount: $bankAccount, schedule: $schedule, withdrawalNotice: $withdrawalNotice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FiFApplicationDetailModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.subid, subid) || other.subid == subid) &&
            (identical(other.subproductName, subproductName) ||
                other.subproductName == subproductName) &&
            (identical(other.subproductCode, subproductCode) ||
                other.subproductCode == subproductCode) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.investmentAmount, investmentAmount) ||
                other.investmentAmount == investmentAmount) &&
            (identical(other.originalAmount, originalAmount) ||
                other.originalAmount == originalAmount) &&
            (identical(other.deductionAmount, deductionAmount) ||
                other.deductionAmount == deductionAmount) &&
            (identical(other.totalInterestEarned, totalInterestEarned) ||
                other.totalInterestEarned == totalInterestEarned) &&
            (identical(other.monthlyInterestEarned, monthlyInterestEarned) ||
                other.monthlyInterestEarned == monthlyInterestEarned) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.annuallyInterestRate, annuallyInterestRate) ||
                other.annuallyInterestRate == annuallyInterestRate) &&
            (identical(other.investmentDate, investmentDate) ||
                other.investmentDate == investmentDate) &&
            (identical(other.firstPaymentDate, firstPaymentDate) ||
                other.firstPaymentDate == firstPaymentDate) &&
            (identical(other.investmentAmountFormat, investmentAmountFormat) ||
                other.investmentAmountFormat == investmentAmountFormat) &&
            (identical(other.maturityDate, maturityDate) ||
                other.maturityDate == maturityDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.originalDuration, originalDuration) ||
                other.originalDuration == originalDuration) &&
            (identical(other.durationPeriod, durationPeriod) ||
                other.durationPeriod == durationPeriod) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.returnPaymenMethod, returnPaymenMethod) ||
                other.returnPaymenMethod == returnPaymenMethod) &&
            (identical(other.mmaAccountid, mmaAccountid) ||
                other.mmaAccountid == mmaAccountid) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.investorName, investorName) ||
                other.investorName == investorName) &&
            (identical(other.endMaturity, endMaturity) ||
                other.endMaturity == endMaturity) &&
            (identical(other.currentPrincipal, currentPrincipal) ||
                other.currentPrincipal == currentPrincipal) &&
            (identical(other.interestType, interestType) ||
                other.interestType == interestType) &&
            (identical(other.allowWithdrawal, allowWithdrawal) ||
                other.allowWithdrawal == allowWithdrawal) &&
            (identical(other.minimumWithdrawal, minimumWithdrawal) ||
                other.minimumWithdrawal == minimumWithdrawal) &&
            (identical(other.withdrawalMessage, withdrawalMessage) ||
                other.withdrawalMessage == withdrawalMessage) &&
            (identical(other.paidFormat, paidFormat) ||
                other.paidFormat == paidFormat) &&
            (identical(other.bankType, bankType) ||
                other.bankType == bankType) &&
            (identical(other.paymentProgressBar, paymentProgressBar) ||
                other.paymentProgressBar == paymentProgressBar) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(
                    other.originalCurrentPrincipal, originalCurrentPrincipal) ||
                other.originalCurrentPrincipal == originalCurrentPrincipal) &&
            (identical(other.autoRenewal, autoRenewal) ||
                other.autoRenewal == autoRenewal) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            const DeepCollectionEquality()
                .equals(other._withdrawalNotice, _withdrawalNotice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        code,
        productId,
        productCode,
        subid,
        subproductName,
        subproductCode,
        accountName,
        investmentAmount,
        originalAmount,
        deductionAmount,
        totalInterestEarned,
        monthlyInterestEarned,
        productName,
        annuallyInterestRate,
        investmentDate,
        firstPaymentDate,
        investmentAmountFormat,
        maturityDate,
        description,
        duration,
        originalDuration,
        durationPeriod,
        paid,
        returnPaymenMethod,
        mmaAccountid,
        bankId,
        investorName,
        endMaturity,
        currentPrincipal,
        interestType,
        allowWithdrawal,
        minimumWithdrawal,
        withdrawalMessage,
        paidFormat,
        bankType,
        paymentProgressBar,
        currencyCode,
        originalCurrentPrincipal,
        autoRenewal,
        bankAccount,
        const DeepCollectionEquality().hash(_schedule),
        const DeepCollectionEquality().hash(_withdrawalNotice)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FiFApplicationDetailModelCopyWith<_$_FiFApplicationDetailModel>
      get copyWith => __$$_FiFApplicationDetailModelCopyWithImpl<
          _$_FiFApplicationDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FiFApplicationDetailModelToJson(
      this,
    );
  }
}

abstract class _FiFApplicationDetailModel implements FiFApplicationDetailModel {
  factory _FiFApplicationDetailModel(
          {final String? code,
          @JsonKey(name: 'product_id')
              final int? productId,
          @JsonKey(name: 'product_code')
              final String? productCode,
          @JsonKey(name: "sub_product_id")
              final int? subid,
          @JsonKey(name: "sub_product_name")
              final String? subproductName,
          @JsonKey(name: "sub_product_code")
              final String? subproductCode,
          @JsonKey(name: 'account_name')
              final String? accountName,
          @JsonKey(name: 'investment_amount')
              final String? investmentAmount,
          @JsonKey(name: 'original_amount')
              final num? originalAmount,
          @JsonKey(name: 'deduction_amount')
              final num? deductionAmount,
          @JsonKey(name: 'total_interest_earned')
              final String? totalInterestEarned,
          @JsonKey(name: 'monthly_interest_earned')
              final String? monthlyInterestEarned,
          @JsonKey(name: 'product_name')
              final String? productName,
          @JsonKey(name: 'annually_interest_rate')
              final String? annuallyInterestRate,
          @JsonKey(name: 'investment_date')
              final String? investmentDate,
          @JsonKey(name: 'first_payment_date')
              final String? firstPaymentDate,
          @JsonKey(name: 'investment_amount_format')
              final String? investmentAmountFormat,
          @JsonKey(name: 'maturity_date')
              final String? maturityDate,
          final String? description,
          final String? duration,
          @JsonKey(name: 'original_duration')
              final num? originalDuration,
          @JsonKey(name: 'duration_period')
              final String? durationPeriod,
          final num? paid,
          @JsonKey(name: 'return_payment_method')
              final String? returnPaymenMethod,
          @JsonKey(name: 'mma_account_id')
              final num? mmaAccountid,
          @JsonKey(name: 'bank_id')
              final num? bankId,
          @JsonKey(name: 'investor_name')
              final String? investorName,
          @JsonKey(name: 'end_maturity')
              final String? endMaturity,
          @JsonKey(name: 'current_principal')
              final String? currentPrincipal,
          @JsonKey(name: 'interest_type')
              final String? interestType,
          @JsonKey(name: 'allow_withdrawal')
              final String? allowWithdrawal,
          @JsonKey(name: 'minimum_withdrawal')
              final num? minimumWithdrawal,
          @JsonKey(name: 'withdrawal_message')
              final String? withdrawalMessage,
          @JsonKey(name: 'paid_format')
              final String? paidFormat,
          @JsonKey(name: 'bank_type')
              final BankType? bankType,
          @JsonKey(name: 'payment_progress_bar')
              final num? paymentProgressBar,
          @JsonKey(name: 'currency_code')
              final String? currencyCode,
          @JsonKey(name: 'original_current_principal')
              final String? originalCurrentPrincipal,
          @JsonKey(name: 'auto_renewal')
              final String? autoRenewal,
          @JsonKey(name: 'bank_account')
              final BankAccount? bankAccount,
          final List<ScheduleModelList>? schedule,
          @JsonKey(name: 'withdrawal_notice')
              final List<WithdrawNotice>? withdrawalNotice}) =
      _$_FiFApplicationDetailModel;

  factory _FiFApplicationDetailModel.fromJson(Map<String, dynamic> json) =
      _$_FiFApplicationDetailModel.fromJson;

  @override
  String? get code;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'product_code')
  String? get productCode;
  @override
  @JsonKey(name: "sub_product_id")
  int? get subid;
  @override
  @JsonKey(name: "sub_product_name")
  String? get subproductName;
  @override
  @JsonKey(name: "sub_product_code")
  String? get subproductCode;
  @override
  @JsonKey(name: 'account_name')
  String? get accountName;
  @override
  @JsonKey(name: 'investment_amount')
  String? get investmentAmount;
  @override
  @JsonKey(name: 'original_amount')
  num? get originalAmount;
  @override
  @JsonKey(name: 'deduction_amount')
  num? get deductionAmount;
  @override
  @JsonKey(name: 'total_interest_earned')
  String? get totalInterestEarned;
  @override
  @JsonKey(name: 'monthly_interest_earned')
  String? get monthlyInterestEarned;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  @JsonKey(name: 'annually_interest_rate')
  String? get annuallyInterestRate;
  @override
  @JsonKey(name: 'investment_date')
  String? get investmentDate;
  @override
  @JsonKey(name: 'first_payment_date')
  String? get firstPaymentDate;
  @override
  @JsonKey(name: 'investment_amount_format')
  String? get investmentAmountFormat;
  @override
  @JsonKey(name: 'maturity_date')
  String? get maturityDate;
  @override
  String? get description;
  @override
  String? get duration;
  @override
  @JsonKey(name: 'original_duration')
  num? get originalDuration;
  @override
  @JsonKey(name: 'duration_period')
  String? get durationPeriod;
  @override
  num? get paid;
  @override
  @JsonKey(name: 'return_payment_method')
  String? get returnPaymenMethod;
  @override
  @JsonKey(name: 'mma_account_id')
  num? get mmaAccountid;
  @override
  @JsonKey(name: 'bank_id')
  num? get bankId;
  @override
  @JsonKey(name: 'investor_name')
  String? get investorName;
  @override
  @JsonKey(name: 'end_maturity')
  String? get endMaturity;
  @override
  @JsonKey(name: 'current_principal')
  String? get currentPrincipal;
  @override
  @JsonKey(name: 'interest_type')
  String? get interestType;
  @override
  @JsonKey(name: 'allow_withdrawal')
  String? get allowWithdrawal;
  @override
  @JsonKey(name: 'minimum_withdrawal')
  num? get minimumWithdrawal;
  @override
  @JsonKey(name: 'withdrawal_message')
  String? get withdrawalMessage;
  @override
  @JsonKey(name: 'paid_format')
  String? get paidFormat;
  @override
  @JsonKey(name: 'bank_type')
  BankType? get bankType;
  @override
  @JsonKey(name: 'payment_progress_bar')
  num? get paymentProgressBar;
  @override
  @JsonKey(name: 'currency_code')
  String? get currencyCode;
  @override
  @JsonKey(name: 'original_current_principal')
  String? get originalCurrentPrincipal;
  @override
  @JsonKey(name: 'auto_renewal')
  String? get autoRenewal;
  @override
  @JsonKey(name: 'bank_account')
  BankAccount? get bankAccount;
  @override
  List<ScheduleModelList>? get schedule;
  @override
  @JsonKey(name: 'withdrawal_notice')
  List<WithdrawNotice>? get withdrawalNotice;
  @override
  @JsonKey(ignore: true)
  _$$_FiFApplicationDetailModelCopyWith<_$_FiFApplicationDetailModel>
      get copyWith => throw _privateConstructorUsedError;
}
