// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Edit`
  String get editButton {
    return Intl.message(
      'Edit',
      name: 'editButton',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Enter First Name`
  String get enterfirstName {
    return Intl.message(
      'Enter First Name',
      name: 'enterfirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Last Name`
  String get enterLastName {
    return Intl.message(
      'Enter Last Name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enterPhone {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message(
      'Security',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Set Password`
  String get setPassword {
    return Intl.message(
      'Set Password',
      name: 'setPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Term and Condition`
  String get termsCondition {
    return Intl.message(
      'Term and Condition',
      name: 'termsCondition',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Profile info saved successful`
  String get saveProfile {
    return Intl.message(
      'Profile info saved successful',
      name: 'saveProfile',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveButton {
    return Intl.message(
      'Save',
      name: 'saveButton',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutButton {
    return Intl.message(
      'Logout',
      name: 'logoutButton',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhoto {
    return Intl.message(
      'Take Photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Open Gallery`
  String get openGallery {
    return Intl.message(
      'Open Gallery',
      name: 'openGallery',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Next Payment`
  String get nextPayment {
    return Intl.message(
      'Next Payment',
      name: 'nextPayment',
      desc: '',
      args: [],
    );
  }

  /// `Late`
  String get late {
    return Intl.message(
      'Late',
      name: 'late',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Payment Date`
  String get paymentDate {
    return Intl.message(
      'Payment Date',
      name: 'paymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Principle`
  String get principle {
    return Intl.message(
      'Principle',
      name: 'principle',
      desc: '',
      args: [],
    );
  }

  /// `Interest`
  String get interest {
    return Intl.message(
      'Interest',
      name: 'interest',
      desc: '',
      args: [],
    );
  }

  /// `Penalty`
  String get penalty {
    return Intl.message(
      'Penalty',
      name: 'penalty',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get paynow {
    return Intl.message(
      'Pay Now',
      name: 'paynow',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message(
      'Item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Amount Paid`
  String get amountPaid {
    return Intl.message(
      'Amount Paid',
      name: 'amountPaid',
      desc: '',
      args: [],
    );
  }

  /// `Pay Off Slip`
  String get payOff {
    return Intl.message(
      'Pay Off Slip',
      name: 'payOff',
      desc: '',
      args: [],
    );
  }

  /// `Payment Schedule`
  String get paymentSchedule {
    return Intl.message(
      'Payment Schedule',
      name: 'paymentSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Proccessing`
  String get proccessing {
    return Intl.message(
      'Proccessing',
      name: 'proccessing',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `No money return`
  String get textNote {
    return Intl.message(
      'No money return',
      name: 'textNote',
      desc: '',
      args: [],
    );
  }

  /// `Transfer By`
  String get transferBy {
    return Intl.message(
      'Transfer By',
      name: 'transferBy',
      desc: '',
      args: [],
    );
  }

  /// `Transfer Information`
  String get transferInfo {
    return Intl.message(
      'Transfer Information',
      name: 'transferInfo',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get receiver {
    return Intl.message(
      'Receiver',
      name: 'receiver',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Picture`
  String get invoicePic {
    return Intl.message(
      'Invoice Picture',
      name: 'invoicePic',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeMenu {
    return Intl.message(
      'Home',
      name: 'homeMenu',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notificationMenu {
    return Intl.message(
      'Notification',
      name: 'notificationMenu',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number. You will receive 4 digit OTP to verify`
  String get enterPinCode {
    return Intl.message(
      'Please enter your phone number. You will receive 4 digit OTP to verify',
      name: 'enterPinCode',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Phone`
  String get continuePhone {
    return Intl.message(
      'Continue with Phone',
      name: 'continuePhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password ?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Request Loan`
  String get requestLoan {
    return Intl.message(
      'Request Loan',
      name: 'requestLoan',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalinfo {
    return Intl.message(
      'Personal Information',
      name: 'personalinfo',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullname {
    return Intl.message(
      'Full Name',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// `Enter full name`
  String get enterFullName {
    return Intl.message(
      'Enter full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Sex`
  String get sex {
    return Intl.message(
      'Sex',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailaddress {
    return Intl.message(
      'Email Address',
      name: 'emailaddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter Current address`
  String get enterCurrentAddress {
    return Intl.message(
      'Enter Current address',
      name: 'enterCurrentAddress',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phnonenumber {
    return Intl.message(
      'Phone Number',
      name: 'phnonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Current Address`
  String get currentaddress {
    return Intl.message(
      'Current Address',
      name: 'currentaddress',
      desc: '',
      args: [],
    );
  }

  /// `Residence Address`
  String get residenceaddress {
    return Intl.message(
      'Residence Address',
      name: 'residenceaddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter resident address`
  String get enterresidenceaddress {
    return Intl.message(
      'Enter resident address',
      name: 'enterresidenceaddress',
      desc: '',
      args: [],
    );
  }

  /// `Work Information`
  String get workinfo {
    return Intl.message(
      'Work Information',
      name: 'workinfo',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Company Name`
  String get enterCompanyName {
    return Intl.message(
      'Enter Company Name',
      name: 'enterCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Position`
  String get position {
    return Intl.message(
      'Position',
      name: 'position',
      desc: '',
      args: [],
    );
  }

  /// `Enter Position`
  String get enterPosition {
    return Intl.message(
      'Enter Position',
      name: 'enterPosition',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get continueButton {
    return Intl.message(
      'Next',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Enter Salary`
  String get enterSalary {
    return Intl.message(
      'Enter Salary',
      name: 'enterSalary',
      desc: '',
      args: [],
    );
  }

  /// `Current Salary`
  String get salary {
    return Intl.message(
      'Current Salary',
      name: 'salary',
      desc: '',
      args: [],
    );
  }

  /// `Loan Request`
  String get loanrequest {
    return Intl.message(
      'Loan Request',
      name: 'loanrequest',
      desc: '',
      args: [],
    );
  }

  /// `Enter Loan Request`
  String get enterLoanrequest {
    return Intl.message(
      'Enter Loan Request',
      name: 'enterLoanrequest',
      desc: '',
      args: [],
    );
  }

  /// `Loan Duration (month)`
  String get loanduration {
    return Intl.message(
      'Loan Duration (month)',
      name: 'loanduration',
      desc: '',
      args: [],
    );
  }

  /// `Enter Loan Duration`
  String get enterLoanDuration {
    return Intl.message(
      'Enter Loan Duration',
      name: 'enterLoanDuration',
      desc: '',
      args: [],
    );
  }

  /// `Upload Identity Card`
  String get uploadIdCard {
    return Intl.message(
      'Upload Identity Card',
      name: 'uploadIdCard',
      desc: '',
      args: [],
    );
  }

  /// `Please put your identity card in the right way to make good quality of photo`
  String get uploadIdguideText {
    return Intl.message(
      'Please put your identity card in the right way to make good quality of photo',
      name: 'uploadIdguideText',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get nointernet {
    return Intl.message(
      'No internet connection',
      name: 'nointernet',
      desc: '',
      args: [],
    );
  }

  /// `Payment Infomation`
  String get paymentInfo {
    return Intl.message(
      'Payment Infomation',
      name: 'paymentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Account No`
  String get accountNo {
    return Intl.message(
      'Account No',
      name: 'accountNo',
      desc: '',
      args: [],
    );
  }

  /// `House No`
  String get houseNo {
    return Intl.message(
      'House No',
      name: 'houseNo',
      desc: '',
      args: [],
    );
  }

  /// `Stree No`
  String get streetNo {
    return Intl.message(
      'Stree No',
      name: 'streetNo',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message(
      'Province',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Commune`
  String get commune {
    return Intl.message(
      'Commune',
      name: 'commune',
      desc: '',
      args: [],
    );
  }

  /// `Village`
  String get village {
    return Intl.message(
      'Village',
      name: 'village',
      desc: '',
      args: [],
    );
  }

  /// `Enter House No`
  String get enterhouseNo {
    return Intl.message(
      'Enter House No',
      name: 'enterhouseNo',
      desc: '',
      args: [],
    );
  }

  /// `Enter Street No`
  String get enterstreetNo {
    return Intl.message(
      'Enter Street No',
      name: 'enterstreetNo',
      desc: '',
      args: [],
    );
  }

  /// `Select Province`
  String get enterprovince {
    return Intl.message(
      'Select Province',
      name: 'enterprovince',
      desc: '',
      args: [],
    );
  }

  /// `Select District`
  String get enterdistrict {
    return Intl.message(
      'Select District',
      name: 'enterdistrict',
      desc: '',
      args: [],
    );
  }

  /// `Select Commune`
  String get entercommune {
    return Intl.message(
      'Select Commune',
      name: 'entercommune',
      desc: '',
      args: [],
    );
  }

  /// `Select Village`
  String get entervillage {
    return Intl.message(
      'Select Village',
      name: 'entervillage',
      desc: '',
      args: [],
    );
  }

  /// `Fee`
  String get fee {
    return Intl.message(
      'Fee',
      name: 'fee',
      desc: '',
      args: [],
    );
  }

  /// `Extra`
  String get extra {
    return Intl.message(
      'Extra',
      name: 'extra',
      desc: '',
      args: [],
    );
  }

  /// `Bank`
  String get bank {
    return Intl.message(
      'Bank',
      name: 'bank',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get paymentStatus {
    return Intl.message(
      'Status',
      name: 'paymentStatus',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get rejected {
    return Intl.message(
      'Rejected',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get invoice {
    return Intl.message(
      'Invoice',
      name: 'invoice',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Loan History`
  String get loanHistory {
    return Intl.message(
      'Loan History',
      name: 'loanHistory',
      desc: '',
      args: [],
    );
  }

  /// `Request Date`
  String get requestLoanDate {
    return Intl.message(
      'Request Date',
      name: 'requestLoanDate',
      desc: '',
      args: [],
    );
  }

  /// `Type of loan`
  String get typeofloan {
    return Intl.message(
      'Type of loan',
      name: 'typeofloan',
      desc: '',
      args: [],
    );
  }

  /// `Requirement`
  String get required {
    return Intl.message(
      'Requirement',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `ID Card / Passport`
  String get idcard {
    return Intl.message(
      'ID Card / Passport',
      name: 'idcard',
      desc: '',
      args: [],
    );
  }

  /// `Family Book`
  String get familyBook {
    return Intl.message(
      'Family Book',
      name: 'familyBook',
      desc: '',
      args: [],
    );
  }

  /// `Salary Slip / Bank Statement`
  String get salaryslip {
    return Intl.message(
      'Salary Slip / Bank Statement',
      name: 'salaryslip',
      desc: '',
      args: [],
    );
  }

  /// `Resident Book`
  String get residentBook {
    return Intl.message(
      'Resident Book',
      name: 'residentBook',
      desc: '',
      args: [],
    );
  }

  /// `What type of loan do you prefer ?`
  String get whattypeofloan {
    return Intl.message(
      'What type of loan do you prefer ?',
      name: 'whattypeofloan',
      desc: '',
      args: [],
    );
  }

  /// `Personal Loan`
  String get personalloan {
    return Intl.message(
      'Personal Loan',
      name: 'personalloan',
      desc: '',
      args: [],
    );
  }

  /// `Business Loan`
  String get businessloan {
    return Intl.message(
      'Business Loan',
      name: 'businessloan',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Please take your resident book Correctly and clear`
  String get pleasetakeid {
    return Intl.message(
      'Please take your resident book Correctly and clear',
      name: 'pleasetakeid',
      desc: '',
      args: [],
    );
  }

  /// `Upload Salary Slip / Bank Statement (last 3 months)`
  String get uploadsalarySlip {
    return Intl.message(
      'Upload Salary Slip / Bank Statement (last 3 months)',
      name: 'uploadsalarySlip',
      desc: '',
      args: [],
    );
  }

  /// `Please take your Salary Slip/ Salary Slip Correctly and clear`
  String get pleasetakeSalary {
    return Intl.message(
      'Please take your Salary Slip/ Salary Slip Correctly and clear',
      name: 'pleasetakeSalary',
      desc: '',
      args: [],
    );
  }

  /// `Upload Family Book`
  String get uploadFamilyBook {
    return Intl.message(
      'Upload Family Book',
      name: 'uploadFamilyBook',
      desc: '',
      args: [],
    );
  }

  /// `Please take your family book correctly and clear`
  String get pleasetakeFamilyBook {
    return Intl.message(
      'Please take your family book correctly and clear',
      name: 'pleasetakeFamilyBook',
      desc: '',
      args: [],
    );
  }

  /// `Please take your family book correctly and clear`
  String get pleasetakeResidentBook {
    return Intl.message(
      'Please take your family book correctly and clear',
      name: 'pleasetakeResidentBook',
      desc: '',
      args: [],
    );
  }

  /// `Upload Resident Book`
  String get uploadResident {
    return Intl.message(
      'Upload Resident Book',
      name: 'uploadResident',
      desc: '',
      args: [],
    );
  }

  /// `Loan Purpose`
  String get loanpurpos {
    return Intl.message(
      'Loan Purpose',
      name: 'loanpurpos',
      desc: '',
      args: [],
    );
  }

  /// `Enter Loan Purpose`
  String get enterloanPurpose {
    return Intl.message(
      'Enter Loan Purpose',
      name: 'enterloanPurpose',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get report {
    return Intl.message(
      'Reports',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `UT Mngt`
  String get trade {
    return Intl.message(
      'UT Mngt',
      name: 'trade',
      desc: '',
      args: [],
    );
  }

  /// `Directory`
  String get directory {
    return Intl.message(
      'Directory',
      name: 'directory',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get event {
    return Intl.message(
      'Event',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `QR Scan`
  String get qrCode {
    return Intl.message(
      'QR Scan',
      name: 'qrCode',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Use Fingerprint to Sign in`
  String get useFingerPrint {
    return Intl.message(
      'Use Fingerprint to Sign in',
      name: 'useFingerPrint',
      desc: '',
      args: [],
    );
  }

  /// `Use Face ID to Sign in`
  String get useFaceIDtoSignIn {
    return Intl.message(
      'Use Face ID to Sign in',
      name: 'useFaceIDtoSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `About CiC Mobile App`
  String get aboutCiC {
    return Intl.message(
      'About CiC Mobile App',
      name: 'aboutCiC',
      desc: '',
      args: [],
    );
  }

  /// `Share Information`
  String get shareInformation {
    return Intl.message(
      'Share Information',
      name: 'shareInformation',
      desc: '',
      args: [],
    );
  }

  /// `Current Share Price`
  String get currentSharePrice {
    return Intl.message(
      'Current Share Price',
      name: 'currentSharePrice',
      desc: '',
      args: [],
    );
  }

  /// `Total Share`
  String get totalShare {
    return Intl.message(
      'Total Share',
      name: 'totalShare',
      desc: '',
      args: [],
    );
  }

  /// `Toal Net Worth`
  String get totalNetWorth {
    return Intl.message(
      'Toal Net Worth',
      name: 'totalNetWorth',
      desc: '',
      args: [],
    );
  }

  /// `Share Price Evolution`
  String get sharepriceEvolution {
    return Intl.message(
      'Share Price Evolution',
      name: 'sharepriceEvolution',
      desc: '',
      args: [],
    );
  }

  /// `Figure in USD`
  String get figureInUSD {
    return Intl.message(
      'Figure in USD',
      name: 'figureInUSD',
      desc: '',
      args: [],
    );
  }

  /// `Share Subscription History`
  String get shareSubscriptionHistory {
    return Intl.message(
      'Share Subscription History',
      name: 'shareSubscriptionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Share Balance By Year`
  String get shareBalanceByYear {
    return Intl.message(
      'Share Balance By Year',
      name: 'shareBalanceByYear',
      desc: '',
      args: [],
    );
  }

  /// `Figure in number of share`
  String get figureInNumberofShare {
    return Intl.message(
      'Figure in number of share',
      name: 'figureInNumberofShare',
      desc: '',
      args: [],
    );
  }

  /// `Investment Return Information`
  String get investmentReturnInformation {
    return Intl.message(
      'Investment Return Information',
      name: 'investmentReturnInformation',
      desc: '',
      args: [],
    );
  }

  /// `Total Dividend Recieved`
  String get totalDividendRecieved {
    return Intl.message(
      'Total Dividend Recieved',
      name: 'totalDividendRecieved',
      desc: '',
      args: [],
    );
  }

  /// `Last Year Dividend`
  String get lastYearDividend {
    return Intl.message(
      'Last Year Dividend',
      name: 'lastYearDividend',
      desc: '',
      args: [],
    );
  }

  String get viewImage {
    return Intl.message(
      'View Image',
      name: 'viewImage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'kh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
