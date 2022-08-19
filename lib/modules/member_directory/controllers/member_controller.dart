// import 'dart:async';
// import 'dart:io';
// import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
// import 'package:cicgreenloan/Utils/helper/option_model/gender.dart';
// import 'package:cicgreenloan/modules/member_directory/models/user.dart';
// import 'package:cicgreenloan/modules/member_directory/models/company_data.dart';
// import 'package:cicgreenloan/modules/member_directory/models/eductation.dart';
// import 'package:cicgreenloan/modules/member_directory/models/member.dart';
// import 'package:cicgreenloan/modules/member_directory/models/member_data.dart';
// import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';
// import 'package:cicgreenloan/modules/member_directory/models/subscription.dart';
// import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
// import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
// import 'package:cicgreenloan/utils/select_address/address_model/document_type.dart';
// import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:flutter_svg/svg.dart';

// import 'package:get/get.dart';
// import 'package:global_configuration/global_configuration.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';

// class MemberController extends GetxController {
//   final memberData = MemberData().obs;
//   final member = Member().obs;
//   final selectedMember = Member().obs;
//   final memberList = <Member>[].obs;
//   final invitedMemberList = <Member>[].obs;
//   final isTicked = false.obs;
//   final memberLastPage = 0.obs;
//   final memberCurrentPage = 1.obs;
//   final memberResult = 0.obs;
//   final filterResult = <Member>[].obs;
//   final isLoading = false.obs;

//   final isLoadingInvite = false.obs;
//   final isReset = false.obs;
//   final isloadingMore = false.obs;
//   final page = 1.obs;
//   String? tokenKey;
//   final isNomoreData = false.obs;
//   final currentPage = 0.obs;
//   final isEmty = false.obs;
//   final mapList = <String, List<int>>{}.obs;
//   final personalProfile = PersonalProfileModel().obs;
//   final personalProfilemember = User().obs;
//   final educationMemberData = <EducationData>[].obs;
//   // final educationModel = EducationModel().obs;
//   // final educationMemberDataList = <EducationData>[].obs;

//   final subscription = SubscriptionModel().obs;
//   final subscriptionList = <SubscriptionData>[].obs;
//   final _customerController = Get.put(CustomerController());
//   // final _memberCon = Get.put(MemberController());

//   // Update Personal Profile Key
//   final isValidatePermenantAddress = true.obs;
//   final isValidateFullAddress = true.obs;
//   final currentAddressList = <Address>[].obs;
//   final fullCurrentAddress = FullAddress().obs;
//   final fullResidentAddress = FullAddress().obs;

//   //add new company
//   final addCompany = false.obs;
//   final isAddNewComapny = false.obs;

//   FullAddress selectedAddress = FullAddress();
//   final khmerName = ''.obs;
//   final fullName = ''.obs;
//   final customerDateOfBirth = ''.obs;
//   final phone = ''.obs;
//   final gmail = ''.obs;
//   final telegram = ''.obs;
//   final whatApp = ''.obs;
//   final skype = ''.obs;
//   final messenger = ''.obs;
//   final webSite = ''.obs;
//   final facebook = ''.obs;
//   final linkIn = ''.obs;
//   final tweeter = ''.obs;
//   final currentAddress = ''.obs;
//   final currentStreet = ''.obs;
//   final currentHours = ''.obs;
//   final permanentAddress = ''.obs;
//   final permanentStreet = ''.obs;
//   final permanetHours = ''.obs;
//   final nationality = CustomerGender();
//   final nationalityCode = ''.obs;
//   final identityType = ''.obs;
//   final identityTypeCode = ''.obs;
//   final identityNumber = ''.obs;
//   final identityDate = ''.obs;
//   final identityExpireDate = ''.obs;
//   final other = ''.obs;
//   final yearJoin = ''.obs;
//   final memberType = ''.obs;
//   final expertise = ''.obs;
//   final recommand = ''.obs;
//   final profileBiorgraphy = ''.obs;
//   final isSelectTap = false.obs;
//   // Education Key
//   final dateTime = DateFormat('yyyy-MM-dd');
//   final school = ''.obs;
//   final degree = ''.obs;
//   final fieldOfstudy = ''.obs;
//   final startDate = ''.obs;
//   final endDate = ''.obs;
//   final grade = ''.obs;
//   final description = ''.obs;
//   final isButtonTapped = false.obs;
//   // Experience Key
//   final title = ''.obs;
//   final employmentType = ''.obs;
//   final companyName = ''.obs;
//   final experienceStartDate = ''.obs;
//   final experienceEndDate = ''.obs;
//   final location = ''.obs;
//   final experienceGrade = ''.obs;
//   final experienceDecription = ''.obs;
//   final gender = GenderOption().obs;
//   //Company
//   final comCompanyName = ''.obs;
//   final comKhmerName = ''.obs;
//   final comMajorOfBusiness = ''.obs;
//   final comPosition = DocumentType().obs;
//   final comPositions = ''.obs;
//   final comLegalSatuts = ''.obs;
//   final comRegisteredBusiness = ''.obs;
//   final comCompanySize = ''.obs;
//   final comNumberOfBranches = ''.obs;
//   final comBusinessModel = ''.obs;
//   final comCapitalInvestment = ''.obs;
//   final comYearfounded = ''.obs;
//   final comIsPrimary = ''.obs;
//   final comPersonalInterest = ''.obs;
//   final comCompanyProfile = ''.obs;
//   final comcompanyproductandservice = ''.obs;
//   final comhouseno = ''.obs;
//   final comstreetno = ''.obs;
//   final comaddress = ''.obs;
//   final comphonenumber = ''.obs;
//   final comEmail = ''.obs;
//   final comWhatapp = ''.obs;
//   final comTelegram = ''.obs;
//   final comMessenger = ''.obs;
//   final comSkype = ''.obs;
//   final comWechat = ''.obs;
//   final comWebsite = ''.obs;
//   final comFacebook = ''.obs;
//   final comLinkedin = ''.obs;
//   final comTwitter = ''.obs;
//   final comCompanyLogoString = ''.obs;
//   File? comCompanyLogo;
//   final memberIdList = <dynamic>[].obs;
//   // List<dynamic>? invitedList=memberIdList;
//   int? eventId;
//   // onInviteMember({Member? member}) {
//   //   invitedMemberList.add(member!);
//   //   update();
//   // }

//   onSelected({int? index, Member? member}) {
//     // isTicked.value = !isTicked.value;

//     memberList[index!].isTicked = !memberList[index].isTicked!;
//     if (memberList[index].isTicked == true) {
//       invitedMemberList.add(member!);
//       memberIdList.clear();
//       invitedMemberList.map((element) {
//         memberIdList.add(element.id!);
//       }).toList();
//     } else {
//       invitedMemberList.remove(member);
//     }
//     update();
//   }

//   onClearInvitedMember() {
//     memberList.map((e) {
//       e.isTicked = false;
//     }).toList();

//     invitedMemberList.clear();
//     invitedMemberList.refresh();

//     update();
//   }

//   // final genderList = List<GenderOption>().obs;
//   List<GenderOption> genderList = [
//     GenderOption(id: 01, display: 'Male'),
//     GenderOption(id: 02, display: 'Female'),
//   ];
//   String base64Image = '';
//   Future<String?> networkImageToBase64(String? imageUrl) async {
//     http.Response response = await http.get(
//       Uri.parse(imageUrl!),
//     );
//     final bytes = response.bodyBytes;
//     return base64Encode(bytes);
//   }

//   final customerController = Get.put(CustomerController());
//   Future<void> onInvitedEventMember({
//     required BuildContext context,
//   }) async {
//     List<dynamic>? inviteId = memberIdList;

//     Map<String, dynamic> arqument = {
//       "event_id": "$eventId",
//       "invite_id": "$inviteId",
//       "member_id": "${customerController.customer.value.customerId}",
//       "name": "${customerController.customer.value.fullName}",
//       "company_name": "${customerController.customer.value.company}",
//       "position": customerController.customer.value.position!.display!,
//       "phone_number": "${customerController.customer.value.phone}",
//       "email": "${customerController.customer.value.email}"
//     };
//     var body = json.encode(arqument);
//     isLoadingInvite.value = true;
//     tokenKey = await LocalData.getCurrentUser();

//     String url = '${GlobalConfiguration().get('api_base_urlv2')}registration';

//     try {
//       await http
//           .post(Uri.parse(url),
//               headers: {
//                 'Accept': 'application/json',
//                 'Content-Type': 'application/json',
//                 'Authorization': 'Bearer $tokenKey'
//               },
//               body: body)
//           .then((response) {
//         if (response.statusCode == 200) {
//           Get.snackbar("", "Your Invite was Submit Successful...!",
//               borderRadius: 8,
//               duration: const Duration(seconds: 2),
//               backgroundColor: Colors.green,
//               colorText: Colors.white,
//               icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
//               snackPosition: SnackPosition.TOP,
//               margin: const EdgeInsets.all(10),
//               overlayBlur: 3.0,
//               titleText: const Text(
//                 'Event Invitation',
//                 style: TextStyle(color: Colors.white),
//               ),
//               messageText: const Text(
//                 'Your invitation was submitted successfully...!',
//                 style: TextStyle(color: Colors.white),
//               ),
//               snackStyle: SnackStyle.FLOATING);
//         } else {}
//       });
//     } finally {
//       isLoadingInvite.value = false;
//     }
//   }

//   Future<void> onUpdateCompany(BuildContext context, int id) async {
//     String url =
//         '${GlobalConfiguration().get('api_base_url')}member-company/update';
//     if (comCompanyLogo != null) {
//       final byte = comCompanyLogo!.readAsBytesSync();
//       final companyLogos = await FlutterImageCompress.compressWithList(
//         byte.buffer.asUint8List(),
//         minWidth: 800,
//         minHeight: 800,
//         quality: 70,
//         rotate: 0,
//       );
//       base64Image = base64Encode(companyLogos);
//     } else if (comCompanyLogoString.value != '') {
//       base64Image = (await networkImageToBase64(comCompanyLogoString.value))!;
//     }

//     tokenKey = await LocalData.getCurrentUser();
//     var data = json.encode({
//       "id": id,
//       "company_name": comCompanyName.value,
//       "member_id": _customerController.customer.value.customerId,
//       "khmer_name": comKhmerName.value,
//       "position": comPositions.value,
//       "company_logo":
//           base64Image == '' ? '' : "data:image/png;base64,$base64Image",
//       "company_profile": comCompanyProfile.value,
//       "company_product_and_service": comcompanyproductandservice.value,
//       "house_no": comhouseno.value,
//       "street_no": comstreetno.value,
//       "address": comaddress.value,
//       "phone_number": comphonenumber.value,
//       "email": comEmail.value,
//       "what_app": comWhatapp.value,
//       "telegram": comTelegram.value,
//       "messenger": comMessenger.value,
//       "skype": comSkype.value,
//       "we_chat": comWechat.value,
//       "website": comWebsite.value,
//       "facebook": comFacebook.value,
//       "linkedin": comLinkedin.value,
//       "twitter": comTwitter.value
//     });

//     try {
//       isLoading(true);
//       var response = await http.post(Uri.parse(url),
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $tokenKey'
//           },
//           body: data);

//       if (response.statusCode == 200) {
//         Get.snackbar("", "Company Updated Successful...!",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: const Color(0xff60AD00),
//             colorText: Colors.white,
//             icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Updated Company',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               ' Company Updated Successful...!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);
//         Timer(const Duration(seconds: 1), () {
//           Navigator.pop(context);
//           Navigator.pop(context);
//         });
//       } else {
//         Get.snackbar("", "Company Updated Failed...!",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: Colors.red,
//             colorText: Colors.white,
//             icon: const Icon(
//               Icons.close,
//               color: Colors.white,
//             ),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Updated Company',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               'Company Updated Failed...!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);
//       }
//     } finally {
//       base64Image = '';
//       isLoading(false);
//     }
//   }

//   Future<void> onSubmitCompany(BuildContext context) async {
//     String url = '${GlobalConfiguration().get('api_base_url')}member-company';
//     tokenKey = await LocalData.getCurrentUser();
//     if (comCompanyLogo != null) {
//       final byte = comCompanyLogo!.readAsBytesSync();
//       List<int> companyLogos = await FlutterImageCompress.compressWithList(
//         byte,
//         minWidth: 800,
//         minHeight: 800,
//         quality: 70,
//         rotate: 0,
//       );
//       base64Image = base64Encode(companyLogos);
//     }
//     var data = json.encode({
//       //  "id": _customerController.customer.value.customerId,
//       "company_name": comCompanyName.value,
//       "member_id": _customerController.customer.value.customerId,
//       "khmer_name": comKhmerName.value,

//       "company_logo":
//           base64Image == '' ? '' : "data:image/png;base64,$base64Image",
//       "position": comPositions.value,

//       "company_profile": comCompanyProfile.value,
//       "company_product_and_service": comcompanyproductandservice.value,
//       "house_no": comhouseno.value,
//       "street_no": comstreetno.value,
//       "address": comaddress.value,
//       "phone_number": comphonenumber.value,
//       "email": comEmail.value,
//       "what_app": comWhatapp.value,
//       "telegram": comTelegram.value,
//       "messenger": comMessenger.value,
//       "skype": comSkype.value,
//       "we_chat": comWechat.value,
//       "website": comWebsite.value,
//       "facebook": comFacebook.value,
//       "linkedin": comLinkedin.value,
//       "twitter": comTwitter.value
//     });

//     try {
//       isLoading(true);
//       var response = await http.post(Uri.parse(url),
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $tokenKey'
//           },
//           body: data);
//       if (response.statusCode == 200) {
//         Get.snackbar("", "Company Submit Successful...!",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: const Color(0xff60AD00),
//             colorText: Colors.white,
//             icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Submit Company',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               'Submit Company Successful...!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);

//         Timer(const Duration(seconds: 1), () {
//           Navigator.pop(context, true);
//         });
//       } else {
//         Get.snackbar("", "Company Submit Failed...!",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: Colors.red,
//             colorText: Colors.white,
//             icon: const Icon(
//               Icons.close,
//               color: Colors.white,
//             ),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Submit Company',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               'Submit Company Failed...!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);
//       }
//     } finally {
//       //  isSelectTap.value = false;
//       base64Image = '';
//       isLoading(false);
//     }
//   }

//   Future<void> updatePersonalProfile(BuildContext context) async {
//     String url =
//         '${GlobalConfiguration().get('api_base_url')}member-profile/update';
//     tokenKey = await LocalData.getCurrentUser();

//     var data = json.encode({
//       'member_id': _customerController.customer.value.customerId,
//       // 'position': '92',
//       'khmer_name': khmerName.value != ''
//           ? khmerName.value
//           : personalProfile.value.customerName,
//       'full_name': fullName.value != ''
//           ? fullName.value
//           : '${personalProfile.value.customerLatinName}',
//       'date_of_birth': customerDateOfBirth.value != ''
//           ? customerDateOfBirth.value
//           : '${personalProfile.value.customerDateOfBirth}',
//       'gender': gender.value.display != null
//           ? '${gender.value.id}'
//           : personalProfile.value.customerGender!.id,
//       'nationality': nationality.id != null
//           ? "${nationality.id}"
//           : personalProfile.value.customerNationality!.id,

//       'identity_type': identityTypeCode.value != ''
//           ? identityTypeCode.value
//           : personalProfile.value.customerIdentityType!.id,
//       'identity_number': identityNumber.value != ''
//           ? identityNumber.value
//           : personalProfile.value.customerIdentityNumber,
//       'identity_date': identityDate.value != ''
//           ? identityDate.value
//           : personalProfile.value.customerIdentityDate,
//       'identity_expired_date': identityExpireDate.value != ''
//           ? identityExpireDate.value
//           : personalProfile.value.customerIdentityExpiredDate,
//       'current_address': currentAddress.value != ''
//           ? '$currentAddress'
//           : personalProfile.value.currentAddress!.village!.code != ''
//               ? personalProfile.value.currentAddress!.village!.code
//               : '',
//       'current_street_no': currentStreet.value != ''
//           ? '$currentStreet'
//           : personalProfile.value.streetNo,
//       'current_house_no': currentHours.value != ''
//           ? '#$currentHours'
//           : personalProfile.value.houseNo,
//       'permanent_address': permanentAddress.value != ''
//           ? '$permanentAddress'
//           : personalProfile.value.permanentAddress!.village!.code != ''
//               ? personalProfile.value.permanentAddress!.village!.code
//               : '',
//       'permanent_street_no': permanentStreet.value != ''
//           ? '$permanentStreet'
//           : personalProfile.value.permanentStreetNo,
//       'permanent_house_no': permanetHours.value != ''
//           ? '$permanetHours'
//           : personalProfile.value.permanentHouseNo,
//       'phone': _customerController.customer.value.phone != ''
//           ? _customerController.customer.value.phone
//           : personalProfile.value.phone,
//       'email': gmail.value != '' ? gmail.value : personalProfile.value.email,
//       'whatapp':
//           whatApp.value != '' ? whatApp.value : personalProfile.value.whatapp,
//       'telegram': telegram.value != ''
//           ? telegram.value
//           : personalProfile.value.telegram,
//       'messenger': messenger.value != ''
//           ? messenger.value
//           : personalProfile.value.messenger,
//       'skype': skype.value != '' ? skype.value : personalProfile.value.skype,
//       'website':
//           webSite.value != '' ? webSite.value : personalProfile.value.website,
//       'facebook': facebook.value != ''
//           ? facebook.value
//           : personalProfile.value.facebook,
//       'linkedin':
//           linkIn.value != '' ? linkIn.value : personalProfile.value.linkedin,
//       'twitter':
//           tweeter.value != '' ? tweeter.value : personalProfile.value.twitter,
//     });

//     try {
//       isLoading(true);
//       var response = await http.post(Uri.parse(url),
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $tokenKey'
//           },
//           body: data);
//       if (response.statusCode == 200) {
//         Get.snackbar("", "Personal Profile Updated Successful...!",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: const Color(0xff60AD00),
//             colorText: Colors.white,
//             icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Updated Personal Personal',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               'Personal Profile Updated Successful...!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);

//         Navigator.pop(context);
//       } else {
//         Get.snackbar("", "Personal Profile Updated Failed...!",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: Colors.red,
//             colorText: Colors.white,
//             icon: const Icon(
//               Icons.close,
//               color: Colors.white,
//             ),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Updated Personal Personal',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               'Personal Profile Updated Failed...!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> onUpdateEducation() async {
//     String url =
//         '${GlobalConfiguration().get('api_base_url')}member-education/update';
//     tokenKey = await LocalData.getCurrentUser();

//     var data = json.encode({
//       "id": _customerController.customer.value.id,
//       "school": school.value,
//       "field_of_study": fieldOfstudy.value,
//       "grade": grade.value,
//       "degree": degree.value,
//       "description": description.value,
//       "end_date": endDate.value,
//       "start_date": startDate.value
//     });

//     try {
//       isLoading(true);
//       var response = await http.post(Uri.parse(url),
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $tokenKey'
//           },
//           body: data);
//       if (response.statusCode == 200) {
//       } else {}
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<bool> onSubmitEducationUserProfile(BuildContext context) async {
//     String url = '${GlobalConfiguration().get('api_base_url')}member-education';
//     tokenKey = await LocalData.getCurrentUser();

//     var data = json.encode({
//       "member_id": _customerController.customer.value.customerId,
//       "school": school.value,
//       "field_of_study": fieldOfstudy.value,
//       "grade": grade.value,
//       "degree": degree.value,
//       "description": description.value,
//       "end_date":
//           endDate.value != "" ? endDate.value : dateTime.format(DateTime.now()),
//       "start_date": startDate.value != ""
//           ? startDate.value
//           : dateTime.format(DateTime.now())
//     });

//     try {
//       isLoading(true);
//       var response = await http.post(Uri.parse(url),
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $tokenKey'
//           },
//           body: data);
//       if (response.statusCode == 200) {
//         Get.snackbar("", "Education Submit Successful...!",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: const Color(0xff60AD00),
//             colorText: Colors.white,
//             icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Submit Education',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               'Education Submit Successful...!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);

//         Timer(const Duration(seconds: 1), () {
//           Navigator.pop(context, true);
//         });
//       } else {}
//     } finally {
//       isLoading(false);
//     }
//     return true;
//   }

//   Future<bool> onSubmitExperience(BuildContext context) async {
//     String url =
//         '${GlobalConfiguration().get('api_base_url')}member-experience';
//     tokenKey = await LocalData.getCurrentUser();

//     var data = json.encode({
//       "member_id": _customerController.customer.value.customerId,
//       "title": title.value,
//       "employment_type": employmentType.value,
//       "company_name": companyName.value,
//       "grade": grade.value,
//       "location": location.value,
//       "description": experienceDecription.value,
//       "end_date": experienceEndDate.value != ""
//           ? experienceEndDate.value
//           : dateTime.format(DateTime.now()),
//       "start_date": experienceStartDate.value != ""
//           ? experienceStartDate.value
//           : dateTime.format(DateTime.now())
//     });

//     try {
//       isLoading(true);
//       var response = await http.post(Uri.parse(url),
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $tokenKey'
//           },
//           body: data);
//       if (response.statusCode == 200) {
//         Get.snackbar("", "Experience Submit Successful...!",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: const Color(0xff60AD00),
//             colorText: Colors.white,
//             icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Submit Education',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               'Experience Submit Successful...!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);

//         Timer(const Duration(seconds: 1), () {
//           Navigator.pop(context, true);
//         });
//       } else {}
//     } finally {
//       isLoading(false);
//     }
//     return true;
//   }

//   Future<List<SubscriptionData>> fetchSubscriptionMember(int id) async {
//     tokenKey = await LocalData.getCurrentUser();
//     try {
//       isLoading(true);
//       String url =
//           '${GlobalConfiguration().get('api_base_url')}member-subscription?member_id=$id';
//       await http.get(Uri.parse(url), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $tokenKey'
//       }).then((response) {
//         if (response.statusCode == 200) {
//           var responseJson = json.decode(response.body);
//           subscription.value = SubscriptionModel.fromJson(responseJson);
//           subscriptionList.value = subscription.value.data!;
//         } else if (response.statusCode == 404) {
//         } else {}
//       });
//     } finally {
//       isLoading(false);
//     }
//     return subscriptionList;
//   }

//   final isLoadingProfile = false.obs;
//   final isLoadingQRCode = false.obs;
//   Future<User> getUserDetail(int id) async {
//     isLoadingQRCode(true);
//     dynamic responseJson;
//     var _token = await LocalData.getCurrentUser();

//     String userUrl =
//         '${GlobalConfiguration().getValue('main_api_url')}user-detail?customer_id=$id';
//     try {
//       await http.get(Uri.parse(userUrl), headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $_token'
//       }).then((response) async {
//         if (response.statusCode == 200) {
//           responseJson = json.decode(response.body);
//           personalProfilemember.value = User.fromJson(responseJson);
//         } else {}
//       });
//     } finally {
//       isLoadingQRCode(false);
//     }
//     return personalProfilemember.value;
//   }

//   Future<PersonalProfileModel> fetchMemberPersonProfile(int id) async {
//     isLoadingProfile(true);

//     tokenKey = await LocalData.getCurrentUser();
//     try {
//       String url =
//           '${GlobalConfiguration().get('api_base_url')}member-profile?member_id=$id';
//       await http.get(Uri.parse(url), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $tokenKey'
//       }).then((response) {
//         // print('=============S Member=============: ${response.body}');
//         if (response.statusCode == 200) {
//           var responseJson = json.decode(response.body)['data'];

//           personalProfile.value = PersonalProfileModel.fromJson(responseJson);
//         } else {}
//       });
//     } finally {
//       isLoadingProfile(false);
//     }
//     return personalProfile.value;
//   }

//   // Future<List<EducationData>> fetchEducationMember(int id) async {
//   //   tokenKey = await LocalData.getCurrentUser();
//   //   try {
//   //     isLoading(true);
//   //     String url =
//   //         '${GlobalConfiguration().get('api_base_url')}member-education?member_id=$id';
//   //     await http.get(Uri.parse(url), headers: {
//   //       'Content-Type': 'application/json',
//   //       'Accept': 'application/json',
//   //       'Authorization': 'Bearer $tokenKey'
//   //     }).then((response) {
//   //       if (response.statusCode == 200) {
//   //         var responseJson = json.decode(response.body);

//   //         educationModel.value = EducationModel.fromJson(responseJson);
//   //         educationMemberData.value = educationModel.value.data!;
//   //       } else if (response.statusCode == 404) {
//   //       } else {}
//   //     });
//   //   } catch (e) {
//   //     print(e);
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   //   return educationMemberData;
//   // }

//   Future<void> submitHiden({
//     int? memberId,
//     String? pages,
//     String? profile,
//     String? field,
//     int? active,
//   }) async {
//     String url = '${GlobalConfiguration().get('api_base_url')}hidden-field';
//     tokenKey = await LocalData.getCurrentUser();

//     var data = json.encode({
//       "member_id": memberId,
//       "page": pages,
//       "field": field,
//       "active": active
//     });

//     try {
//       isLoading(true);
//       var response = await http.post(Uri.parse(url),
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $tokenKey'
//           },
//           body: data);
//       if (response.statusCode == 200) {
//       } else {}
//     } finally {
//       isLoading(false);
//     }
//   }

//   // final experience = ExperienceModel().obs;
//   // final experienceList = <ExperienceData>[].obs;

//   // Future<List<ExperienceData>> fetchExperienceMember(int id) async {
//   //   tokenKey = await LocalData.getCurrentUser();
//   //   try {
//   //     isLoading(true);
//   //     String url =
//   //         '${GlobalConfiguration().get('api_base_url')}member-experience?member_id=$id';
//   //     await http.get(Uri.parse(url), headers: {
//   //       'Content-Type': 'application/json',
//   //       'Accept': 'application/json',
//   //       'Authorization': 'Bearer $tokenKey'
//   //     }).then((response) {
//   //       if (response.statusCode == 200) {
//   //         var responseJson = json.decode(response.body);

//   //         experience.value = ExperienceModel.fromJson(responseJson);
//   //         experienceList.value = experience.value.data!;
//   //       } else if (response.statusCode == 404) {
//   //       } else {}
//   //     });
//   //   } catch (e) {
//   //     print(e);
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   //   return experienceList;
//   // }

//   final company = CompanyData().obs;
//   final companyDataList = <CompanyData>[].obs;
//   Future<List<CompanyData>> fetchCompanyMember({int? id}) async {
//     tokenKey = await LocalData.getCurrentUser();
//     try {
//       companyDataList.clear();
//       isLoading(true);
//       String? url;
//       if (id != null) {
//         url =
//             '${GlobalConfiguration().get('api_base_urlv3')}member-company?member_id=$id';
//       } else {
//         url = '${GlobalConfiguration().get('api_base_urlv3')}company';
//       }

//       await http.get(Uri.parse(url), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $tokenKey'
//       }).then((response) {
//         if (response.statusCode == 200) {
//           companyDataList.clear();
//           var responseJson = json.decode(response.body)['data'];

//           responseJson.map((json) {
//             companyDataList.add(CompanyData.fromJson(json));
//           }).toList();
//         }
//       });
//     } finally {
//       isLoading(false);
//     }
//     return companyDataList;
//   }

//   final isLoadingCompany = false.obs;
//   Future<List<CompanyData>> fetchCompanyMemberDetail(int id) async {
//     tokenKey = await LocalData.getCurrentUser();
//     isLoadingCompany(true);
//     try {
//       companyDataList.clear();

//       String url =
//           '${GlobalConfiguration().get('api_base_urlv2')}member-company?member_id=$id';
//       await http.get(Uri.parse(url), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $tokenKey'
//       }).then((response) {
//         if (response.statusCode == 200) {
//           companyDataList.clear();
//           var responseJson = json.decode(response.body)['data'];

//           responseJson.map((json) {
//             companyDataList.add(CompanyData.fromJson(json));
//           }).toList();
//         }
//       });
//     } finally {
//       isLoadingCompany(false);
//     }
//     return companyDataList;
//   }

//   Future<List<Member>> fetchAllMembers(
//       {String? filter,
//       int pageNumber = 1,
//       String? filterJson,
//       int? eventId,
//       int? isShowCiCTeam}) async {
//     isLoading(true);

//     page.value++;
//     tokenKey = await LocalData.getCurrentUser();
//     String url = '';
//     if (filter != null) {
//       if (isShowCiCTeam != null) {
//         debugPrint("is member: 1");
//         url =
//             '${GlobalConfiguration().get('api_base_url')}customer?fillter=$filter&show_cic_team=1&page=$pageNumber&hide_me=1';
//       } else {
//         debugPrint("is event:");
//         debugPrint("is member: 2");
//         url =
//             '${GlobalConfiguration().get('api_base_url')}customer?fillter=$filter&page=$pageNumber&event_id=$eventId';
//       }
//     } else if (filterJson != null) {
//       if (memberCurrentPage.value != 0) {
//         //1
//         if (memberCurrentPage.value < memberLastPage.value) {
//           memberCurrentPage.value = memberCurrentPage.value + 1; //2

//           if (isShowCiCTeam != null) {
//             debugPrint("is member: 3");
//             url =
//                 '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterJson&show_cic_team=1&page=$memberCurrentPage&hide_me=1';
//           } else {
//             debugPrint("is member: 4");
//             url =
//                 '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterJson&page=$memberCurrentPage&event_id=$eventId';
//           }
//         }
//       } else {
//         if (isShowCiCTeam != null) {
//           debugPrint("is member: 5");
//           url =
//               '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterJson&show_cic_team=1&hide_me=1';
//         } else {
//           debugPrint("is member: 6");
//           url =
//               '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterJson&event_id=$eventId';
//         }
//       }
//     } else {
//       if (isShowCiCTeam != null) {
//         debugPrint("is member: 7");
//         url =
//             '${GlobalConfiguration().get('api_base_url')}customer?show_cic_team=1&hide_me=1&page=$pageNumber';
//       } else {
//         debugPrint("is member: 8");
//         url =
//             '${GlobalConfiguration().get('api_base_url')}customer?page=$pageNumber&event_id=$eventId';
//       }
//     }

//     try {
//       if (page.value > 0) {
//         isloadingMore(true);
//       }

//       await http.get(Uri.parse(url), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $tokenKey'
//       }).then(
//         (response) {
//           if (response.statusCode == 200) {
//             var responseJson = json.decode(response.body);

//             memberData.value = MemberData.fromJson(responseJson);
//             debugPrint("working 1");

//             currentPage.value = memberData.value.meta!.currentPage!;
//             debugPrint("working 2");

//             ///
//             memberList.clear();
//             if (memberData.value.links!.next == null) {
//               memberList.addAll(memberData.value.data!);
//               isEmty(true);
//             } else {
//               isEmty(false);
//             }
//             debugPrint("working 3");

//             ///
//             memberList.clear();
//             if (filter != null || eventId != null) {
//               debugPrint("working 4");
//               memberList.addAll(memberData.value.data!);
//               debugPrint("member data is 1 ");
//             } else if (filter != null || eventId != null) {
//               //  memberList.clear();
//               debugPrint("working 5");

//               if (currentPage.value < memberData.value.meta!.lastPage! + 1) {
//                 debugPrint("working 6");
//                 memberList.addAll(memberData.value.data!);
//                 debugPrint("member data is 2 ");
//               }
//               memberResult.value = memberData.value.meta!.total!;
//               memberLastPage.value = memberData.value.meta!.lastPage!;
//               if (memberCurrentPage.value == 0) memberCurrentPage.value = 1;
//             } else {
//               if (memberData.value.links!.next != null) {
//                 debugPrint("working 7");
//                 memberList.addAll(memberData.value.data!);
//                 debugPrint("member data is 3 ");
//               } else {
//                 isloadingMore(false);
//               }
//             }
//           }
//         },
//       );
//     } finally {
//       isloadingMore(false);
//       isLoading(false);
//       isEmty(false);
//       // isEmty(false);
//       // update();
//     }
//     return memberList;
//   }

//   List<Member> filterMemberResult = [];

//   Future<List<Member>> filterMember({String? filterOption}) async {
//     String url =
//         '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterOption';
//     try {
//       memberList.clear();
//       isLoading(true);

//       tokenKey = await LocalData.getCurrentUser();
//       await http.get(Uri.parse(url), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $tokenKey'
//       }).then((response) {
//         if (response.statusCode == 200) {
//           var responseJson = json.decode(response.body);
//           memberData.value = MemberData.fromJson(responseJson);

//           filterMemberResult.addAll(memberData.value.data!);
//         } else {}
//       });
//     } finally {
//       isLoading(false);
//     }
//     return filterMemberResult;
//   }

//   @override
//   void onReady() {
//     fetchMemberPersonProfile(customerController.customer.value.customerId!);
//     fetchCompanyMember();
//     super.onReady();
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/Utils/helper/option_model/gender.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:cicgreenloan/modules/member_directory/models/company_data.dart';
import 'package:cicgreenloan/modules/member_directory/models/eductation.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/modules/member_directory/models/member_data.dart';
import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';
import 'package:cicgreenloan/modules/member_directory/models/subscription.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/document_type.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import '../../../Utils/helper/firebase_analytics.dart';

class MemberController extends GetxController {
  final keyCompany = GlobalKey().obs;
  final memberData = MemberData().obs;
  final member = Member().obs;
  final selectedMember = Member().obs;
  final memberList = <Member>[].obs;
  final invitedMemberList = <Member>[].obs;
  final isTicked = false.obs;
  final memberLastPage = 0.obs;
  final memberCurrentPage = 1.obs;
  final memberResult = 0.obs;
  final filterResult = <Member>[].obs;
  final isLoading = false.obs;

  final isLoadingInvite = false.obs;
  final isReset = false.obs;
  final isloadingMore = false.obs;
  final page = 1.obs;
  String? tokenKey;
  final isNomoreData = false.obs;
  final currentPage = 0.obs;
  final isEmty = false.obs;
  final mapList = <String, List<int>>{}.obs;
  final personalProfile = PersonalProfileModel().obs;
  final personalProfilemember = User().obs;
  final educationMemberData = <EducationData>[].obs;

  // final educationModel = EducationModel().obs;
  // final educationMemberDataList = <EducationData>[].obs;

  final subscription = SubscriptionModel().obs;
  final subscriptionList = <SubscriptionData>[].obs;
  final _customerController = Get.put(CustomerController());
  // final _memberCon = Get.put(MemberController());

  // Update Personal Profile Key
  final isValidatePermenantAddress = true.obs;
  final isValidateFullAddress = true.obs;
  final currentAddressList = <Address>[].obs;
  final fullCurrentAddress = FullAddress().obs;
  final fullResidentAddress = FullAddress().obs;

  //add new company
  final addCompany = false.obs;
  final isAddNewComapny = false.obs;

  FullAddress selectedAddress = FullAddress();
  final khmerName = ''.obs;
  final fullName = ''.obs;
  final customerDateOfBirth = ''.obs;
  final phone = ''.obs;
  final gmail = ''.obs;
  final telegram = ''.obs;
  final whatApp = ''.obs;
  final skype = ''.obs;
  final messenger = ''.obs;
  final webSite = ''.obs;
  final facebook = ''.obs;
  final linkIn = ''.obs;
  final tweeter = ''.obs;
  final currentAddress = ''.obs;
  final currentStreet = ''.obs;
  final currentHours = ''.obs;
  final permanentAddress = ''.obs;
  final permanentStreet = ''.obs;
  final permanetHours = ''.obs;
  final nationality = CustomerGender();
  final nationalityCode = ''.obs;
  final identityType = ''.obs;
  final identityTypeCode = ''.obs;
  final identityNumber = ''.obs;
  final identityDate = ''.obs;
  final identityExpireDate = ''.obs;
  final other = ''.obs;
  final yearJoin = ''.obs;
  final memberType = ''.obs;
  final expertise = ''.obs;
  final recommand = ''.obs;
  final profileBiorgraphy = ''.obs;
  final isSelectTap = false.obs;
  final position = ''.obs;
  final comapnyName = ''.obs;
  final aboutAs = ''.obs;
  // Education Key
  final dateTime = DateFormat('yyyy-MM-dd');
  final school = ''.obs;
  final degree = ''.obs;
  final fieldOfstudy = ''.obs;
  final startDate = ''.obs;
  final endDate = ''.obs;
  final grade = ''.obs;
  final description = ''.obs;
  final isButtonTapped = false.obs;
  // Experience Key
  final title = ''.obs;
  final employmentType = ''.obs;
  final companyName = ''.obs;
  final experienceStartDate = ''.obs;
  final experienceEndDate = ''.obs;
  final location = ''.obs;
  final experienceGrade = ''.obs;
  final experienceDecription = ''.obs;
  final gender = GenderOption().obs;
  //Company
  final comCompanyName = ''.obs;
  final comKhmerName = ''.obs;
  final comMajorOfBusiness = ''.obs;
  final comPosition = DocumentType().obs;
  final comPositions = ''.obs;
  final comLegalSatuts = ''.obs;
  final comRegisteredBusiness = ''.obs;
  final comCompanySize = ''.obs;
  final comNumberOfBranches = ''.obs;
  final comBusinessModel = ''.obs;
  final comCapitalInvestment = ''.obs;
  final comYearfounded = ''.obs;
  final comIsPrimary = ''.obs;
  final comPersonalInterest = ''.obs;
  final comCompanyProfile = ''.obs;
  final comcompanyproductandservice = ''.obs;
  final comhouseno = ''.obs;
  final comstreetno = ''.obs;
  final comaddress = ''.obs;
  final comphonenumber = ''.obs;
  final comEmail = ''.obs;
  final comWhatapp = ''.obs;
  final comTelegram = ''.obs;
  final comMessenger = ''.obs;
  final comSkype = ''.obs;
  final comWechat = ''.obs;
  final comWebsite = ''.obs;
  final comFacebook = ''.obs;
  final comLinkedin = ''.obs;
  final comTwitter = ''.obs;
  final comCompanyLogoString = ''.obs;
  File? comCompanyLogo;
  final memberIdList = <dynamic>[].obs;
  final profilePage = 1.obs;
  // List<dynamic>? invitedList=memberIdList;
  int? eventId;
  // onInviteMember({Member? member}) {
  //   invitedMemberList.add(member!);
  //   update();
  // }

  onSelected({int? index, Member? member}) {
    // isTicked.value = !isTicked.value;

    memberList[index!].isTicked = !memberList[index].isTicked!;
    if (memberList[index].isTicked == true) {
      invitedMemberList.add(member!);
      memberIdList.clear();
      invitedMemberList.map((element) {
        memberIdList.add(element.id!);
      }).toList();
    } else {
      invitedMemberList.remove(member);
    }
    update();
  }

  onClearInvitedMember() {
    memberList.map((e) {
      e.isTicked = false;
    }).toList();

    invitedMemberList.clear();
    invitedMemberList.refresh();

    update();
  }

  // final genderList = List<GenderOption>().obs;
  List<GenderOption> genderList = [
    GenderOption(id: 01, display: 'Male'),
    GenderOption(id: 02, display: 'Female'),
  ];
  String base64Image = '';
  Future<String?> networkImageToBase64(String? imageUrl) async {
    http.Response response = await http.get(
      Uri.parse(imageUrl!),
    );
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
  }

  final customerController = Get.put(CustomerController());
  Future<void> onInvitedEventMember({
    required BuildContext context,
  }) async {
    List<dynamic>? inviteId = memberIdList;

    Map<String, dynamic> arqument = {
      "event_id": "$eventId",
      "invite_id": "$inviteId",
      "member_id": "${customerController.customer.value.customerId}",
      "name": "${customerController.customer.value.fullName}",
      "company_name": "${customerController.customer.value.company}",
      "position": customerController.customer.value.position!.display!,
      "phone_number": "${customerController.customer.value.phone}",
      "email": "${customerController.customer.value.email}"
    };
    var body = json.encode(arqument);
    isLoadingInvite.value = true;
    tokenKey = await LocalData.getCurrentUser();

    String url = '${GlobalConfiguration().get('api_base_urlv2')}registration';

    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: body)
          .then((response) {
        if (response.statusCode == 200) {
          Get.snackbar("", "Your Invite was Submit Successful...!",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.green,
              colorText: Colors.white,
              icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Event Invitation',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'Your invitation was submitted successfully...!',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        } else {}
      });
    } finally {
      isLoadingInvite.value = false;
    }
  }

  Future<void> onUpdateCompany(BuildContext context, int id) async {
    String url =
        '${GlobalConfiguration().get('api_base_url')}member-company/update';
    if (comCompanyLogo != null) {
      final byte = comCompanyLogo!.readAsBytesSync();
      final companyLogos = await FlutterImageCompress.compressWithList(
        byte.buffer.asUint8List(),
        minWidth: 800,
        minHeight: 800,
        quality: 70,
        rotate: 0,
      );
      base64Image = base64Encode(companyLogos);
    } else if (comCompanyLogoString.value != '') {
      base64Image = (await networkImageToBase64(comCompanyLogoString.value))!;
    }

    tokenKey = await LocalData.getCurrentUser();
    var data = json.encode({
      "id": id,
      "company_name": comCompanyName.value,
      "member_id": _customerController.customer.value.customerId,
      "khmer_name": comKhmerName.value,
      "position": comPositions.value,
      "company_logo":
          base64Image == '' ? '' : "data:image/png;base64,$base64Image",
      "company_profile": comCompanyProfile.value,
      "company_product_and_service": comcompanyproductandservice.value,
      "house_no": comhouseno.value,
      "street_no": comstreetno.value,
      "address": comaddress.value,
      "phone_number": comphonenumber.value,
      "email": comEmail.value,
      "what_app": comWhatapp.value,
      "telegram": comTelegram.value,
      "messenger": comMessenger.value,
      "skype": comSkype.value,
      "we_chat": comWechat.value,
      "website": comWebsite.value,
      "facebook": comFacebook.value,
      "linkedin": comLinkedin.value,
      "twitter": comTwitter.value
    });

    try {
      isLoading(true);
      await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: data)
          .then((response) {
        if (response.statusCode == 200) {
          Get.snackbar("", "Company Updated Successful...!",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: const Color(0xff60AD00),
              colorText: Colors.white,
              icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Updated Company',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                ' Company Updated Successful...!',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);

          Timer(const Duration(seconds: 1), () {
            Navigator.pop(context);
          });
        } else {
          debugPrint('Status Code = ${response.body}');
          Get.snackbar("", "Company Updated Failed...!",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Updated Company',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'Company Updated Failed...!',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        }
      });
    } finally {
      base64Image = '';
      isLoading(false);
    }
  }

  Future<void> onSubmitCompany(BuildContext context) async {
    String url = '${GlobalConfiguration().get('api_base_url')}member-company';
    tokenKey = await LocalData.getCurrentUser();
    if (comCompanyLogo != null) {
      final byte = comCompanyLogo!.readAsBytesSync();
      List<int> companyLogos = await FlutterImageCompress.compressWithList(
        byte,
        minWidth: 800,
        minHeight: 800,
        quality: 70,
        rotate: 0,
      );
      base64Image = base64Encode(companyLogos);
    }
    var data = json.encode({
      //  "id": _customerController.customer.value.customerId,
      "company_name": comCompanyName.value,
      "member_id": _customerController.customer.value.customerId,
      "khmer_name": comKhmerName.value,

      "company_logo":
          base64Image == '' ? '' : "data:image/png;base64,$base64Image",
      "position": comPositions.value,

      "company_profile": comCompanyProfile.value,
      "company_product_and_service": comcompanyproductandservice.value,
      "house_no": comhouseno.value,
      "street_no": comstreetno.value,
      "address": comaddress.value,
      "phone_number": comphonenumber.value,
      "email": comEmail.value,
      "what_app": comWhatapp.value,
      "telegram": comTelegram.value,
      "messenger": comMessenger.value,
      "skype": comSkype.value,
      "we_chat": comWechat.value,
      "website": comWebsite.value,
      "facebook": comFacebook.value,
      "linkedin": comLinkedin.value,
      "twitter": comTwitter.value
    });

    try {
      isLoading(true);
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey'
          },
          body: data);
      if (response.statusCode == 200) {
        FirebaseAnalyticsHelper.sendAnalyticsEvent('Success Submit Company');
        Get.snackbar("", "Company Submit Successful...!",
            borderRadius: 8,
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xff60AD00),
            colorText: Colors.white,
            icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            overlayBlur: 3.0,
            titleText: const Text(
              'Submit Company',
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              'Submit Company Successful...!',
              style: TextStyle(color: Colors.white),
            ),
            snackStyle: SnackStyle.FLOATING);

        Timer(const Duration(seconds: 1), () {
          Navigator.pop(context, true);
        });
      } else {
        FirebaseAnalyticsHelper.sendAnalyticsEvent('Fail Submit Company');
        Get.snackbar("", "Company Submit Failed...!",
            borderRadius: 8,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            overlayBlur: 3.0,
            titleText: const Text(
              'Submit Company',
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              'Submit Company Failed...!',
              style: TextStyle(color: Colors.white),
            ),
            snackStyle: SnackStyle.FLOATING);
      }
    } finally {
      //  isSelectTap.value = false;
      base64Image = '';
      isLoading(false);
    }
  }

  Future<void> updatePersonalProfile(BuildContext context) async {
    String url =
        '${GlobalConfiguration().get('api_base_url')}member-profile/update';
    tokenKey = await LocalData.getCurrentUser();

    var data = json.encode({
      'member_id': _customerController.customer.value.customerId,
      // 'position': '92',
      'khmer_name': khmerName.value != ''
          ? khmerName.value
          : personalProfile.value.customerName,
      'full_name': fullName.value != ''
          ? fullName.value
          : '${personalProfile.value.customerLatinName}',
      'date_of_birth': customerDateOfBirth.value != ''
          ? customerDateOfBirth.value
          : '${personalProfile.value.customerDateOfBirth}',
      'gender': gender.value.display != null
          ? '${gender.value.id}'
          : personalProfile.value.customerGender!.id,
      'nationality': nationality.id != null
          ? "${nationality.id}"
          : personalProfile.value.customerNationality!.id,

      'identity_type': identityTypeCode.value != ''
          ? identityTypeCode.value
          : personalProfile.value.customerIdentityType!.id,
      'identity_number': identityNumber.value != ''
          ? identityNumber.value
          : personalProfile.value.customerIdentityNumber,
      'identity_date': identityDate.value != ''
          ? identityDate.value
          : personalProfile.value.customerIdentityDate,
      'identity_expired_date': identityExpireDate.value != ''
          ? identityExpireDate.value
          : personalProfile.value.customerIdentityExpiredDate,
      'current_address': currentAddress.value != ''
          ? '$currentAddress'
          : personalProfile.value.currentAddress!.village!.code != ''
              ? personalProfile.value.currentAddress!.village!.code
              : '',
      'current_street_no': currentStreet.value != ''
          ? '$currentStreet'
          : personalProfile.value.streetNo,
      'current_house_no': currentHours.value != ''
          ? '#$currentHours'
          : personalProfile.value.houseNo,
      'permanent_address': permanentAddress.value != ''
          ? '$permanentAddress'
          : personalProfile.value.permanentAddress!.village!.code != ''
              ? personalProfile.value.permanentAddress!.village!.code
              : '',
      'permanent_street_no': permanentStreet.value != ''
          ? '$permanentStreet'
          : personalProfile.value.permanentStreetNo,
      'permanent_house_no': permanetHours.value != ''
          ? '$permanetHours'
          : personalProfile.value.permanentHouseNo,
      'phone': _customerController.customer.value.phone != ''
          ? _customerController.customer.value.phone
          : personalProfile.value.phone,
      'email': gmail.value != '' ? gmail.value : personalProfile.value.email,
      'whatapp':
          whatApp.value != '' ? whatApp.value : personalProfile.value.whatapp,
      'telegram': telegram.value != ''
          ? telegram.value
          : personalProfile.value.telegram,
      'messenger': messenger.value != ''
          ? messenger.value
          : personalProfile.value.messenger,
      'skype': skype.value != '' ? skype.value : personalProfile.value.skype,
      'website':
          webSite.value != '' ? webSite.value : personalProfile.value.website,
      'facebook': facebook.value != ''
          ? facebook.value
          : personalProfile.value.facebook,
      'linkedin':
          linkIn.value != '' ? linkIn.value : personalProfile.value.linkedin,
      'twitter':
          tweeter.value != '' ? tweeter.value : personalProfile.value.twitter,
    });

    try {
      isLoading(true);
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey'
          },
          body: data);
      if (response.statusCode == 200) {
        Get.snackbar("", "Personal Profile Updated Successful...!",
            borderRadius: 8,
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xff60AD00),
            colorText: Colors.white,
            icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            overlayBlur: 3.0,
            titleText: const Text(
              'Updated Personal Personal',
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              'Personal Profile Updated Successful...!',
              style: TextStyle(color: Colors.white),
            ),
            snackStyle: SnackStyle.FLOATING);

        Future.delayed(Duration.zero).then((_) {
          Navigator.of(context).pop();
        });
      } else {
        Get.snackbar("", "Personal Profile Updated Failed...!",
            borderRadius: 8,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            overlayBlur: 3.0,
            titleText: const Text(
              'Updated Personal Personal',
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              'Personal Profile Updated Failed...!',
              style: TextStyle(color: Colors.white),
            ),
            snackStyle: SnackStyle.FLOATING);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> onUpdateEducation() async {
    String url =
        '${GlobalConfiguration().get('api_base_url')}member-education/update';
    tokenKey = await LocalData.getCurrentUser();

    var data = json.encode({
      "id": _customerController.customer.value.id,
      "school": school.value,
      "field_of_study": fieldOfstudy.value,
      "grade": grade.value,
      "degree": degree.value,
      "description": description.value,
      "end_date": endDate.value,
      "start_date": startDate.value
    });

    try {
      isLoading(true);
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey'
          },
          body: data);
      if (response.statusCode == 200) {
      } else {}
    } finally {
      isLoading(false);
    }
  }

  Future<bool> onSubmitEducationUserProfile(BuildContext context) async {
    String url = '${GlobalConfiguration().get('api_base_url')}member-education';
    tokenKey = await LocalData.getCurrentUser();

    var data = json.encode({
      "member_id": _customerController.customer.value.customerId,
      "school": school.value,
      "field_of_study": fieldOfstudy.value,
      "grade": grade.value,
      "degree": degree.value,
      "description": description.value,
      "end_date":
          endDate.value != "" ? endDate.value : dateTime.format(DateTime.now()),
      "start_date": startDate.value != ""
          ? startDate.value
          : dateTime.format(DateTime.now())
    });

    try {
      isLoading(true);
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey'
          },
          body: data);
      if (response.statusCode == 200) {
        Get.snackbar("", "Education Submit Successful...!",
            borderRadius: 8,
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xff60AD00),
            colorText: Colors.white,
            icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            overlayBlur: 3.0,
            titleText: const Text(
              'Submit Education',
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              'Education Submit Successful...!',
              style: TextStyle(color: Colors.white),
            ),
            snackStyle: SnackStyle.FLOATING);

        Timer(const Duration(seconds: 1), () {
          Navigator.pop(context, true);
        });
      } else {}
    } finally {
      isLoading(false);
    }
    return true;
  }

  Future<bool> onSubmitExperience(BuildContext context) async {
    String url =
        '${GlobalConfiguration().get('api_base_url')}member-experience';
    tokenKey = await LocalData.getCurrentUser();

    var data = json.encode({
      "member_id": _customerController.customer.value.customerId,
      "title": title.value,
      "employment_type": employmentType.value,
      "company_name": companyName.value,
      "grade": grade.value,
      "location": location.value,
      "description": experienceDecription.value,
      "end_date": experienceEndDate.value != ""
          ? experienceEndDate.value
          : dateTime.format(DateTime.now()),
      "start_date": experienceStartDate.value != ""
          ? experienceStartDate.value
          : dateTime.format(DateTime.now())
    });

    try {
      isLoading(true);
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey'
          },
          body: data);
      if (response.statusCode == 200) {
        Get.snackbar("", "Experience Submit Successful...!",
            borderRadius: 8,
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xff60AD00),
            colorText: Colors.white,
            icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            overlayBlur: 3.0,
            titleText: const Text(
              'Submit Education',
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              'Experience Submit Successful...!',
              style: TextStyle(color: Colors.white),
            ),
            snackStyle: SnackStyle.FLOATING);

        Timer(const Duration(seconds: 1), () {
          Navigator.pop(context, true);
        });
      } else {}
    } finally {
      isLoading(false);
    }
    return true;
  }

  Future<List<SubscriptionData>> fetchSubscriptionMember(int id) async {
    tokenKey = await LocalData.getCurrentUser();
    try {
      isLoading(true);
      String url =
          '${GlobalConfiguration().get('api_base_url')}member-subscription?member_id=$id';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          subscription.value = SubscriptionModel.fromJson(responseJson);
          subscriptionList.value = subscription.value.data!;
        } else if (response.statusCode == 404) {
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return subscriptionList;
  }

  final isLoadingProfile = false.obs;
  final isLoadingQRCode = false.obs;
  Future<User> getUserDetail(int id) async {
    isLoadingQRCode(true);
    dynamic responseJson;
    var token = await LocalData.getCurrentUser();

    String userUrl =
        '${GlobalConfiguration().getValue('main_api_url')}user-detail?customer_id=$id';
    try {
      await http.get(Uri.parse(userUrl), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) async {
        if (response.statusCode == 200) {
          responseJson = json.decode(response.body);
          personalProfilemember.value = User.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingQRCode(false);
    }
    return personalProfilemember.value;
  }

  Future<PersonalProfileModel> fetchMemberPersonProfile(int id) async {
    isLoadingProfile(true);
    tokenKey = await LocalData.getCurrentUser();

    try {
      String url =
          '${GlobalConfiguration().get('api_base_url')}member-profile?member_id=$id';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        // print('=============S Member=============: ${response.body}');
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];

          personalProfile.value = PersonalProfileModel.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingProfile(false);
    }
    return personalProfile.value;
  }

  // Future<List<EducationData>> fetchEducationMember(int id) async {
  //   tokenKey = await LocalData.getCurrentUser();
  //   try {
  //     isLoading(true);
  //     String url =
  //         '${GlobalConfiguration().get('api_base_url')}member-education?member_id=$id';
  //     await http.get(Uri.parse(url), headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $tokenKey'
  //     }).then((response) {
  //       if (response.statusCode == 200) {
  //         var responseJson = json.decode(response.body);

  //         educationModel.value = EducationModel.fromJson(responseJson);
  //         educationMemberData.value = educationModel.value.data!;
  //       } else if (response.statusCode == 404) {
  //       } else {}
  //     });
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     isLoading(false);
  //   }
  //   return educationMemberData;
  // }

  Future<void> submitHiden({
    int? memberId,
    String? pages,
    String? profile,
    String? field,
    int? active,
  }) async {
    String url = '${GlobalConfiguration().get('api_base_url')}hidden-field';
    tokenKey = await LocalData.getCurrentUser();

    var data = json.encode({
      "member_id": memberId,
      "page": pages,
      "field": field,
      "active": active
    });

    try {
      isLoading(true);
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey'
          },
          body: data);
      if (response.statusCode == 200) {
      } else {}
    } finally {
      isLoading(false);
    }
  }

  // final experience = ExperienceModel().obs;
  // final experienceList = <ExperienceData>[].obs;

  // Future<List<ExperienceData>> fetchExperienceMember(int id) async {
  //   tokenKey = await LocalData.getCurrentUser();
  //   try {
  //     isLoading(true);
  //     String url =
  //         '${GlobalConfiguration().get('api_base_url')}member-experience?member_id=$id';
  //     await http.get(Uri.parse(url), headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $tokenKey'
  //     }).then((response) {
  //       if (response.statusCode == 200) {
  //         var responseJson = json.decode(response.body);

  //         experience.value = ExperienceModel.fromJson(responseJson);
  //         experienceList.value = experience.value.data!;
  //       } else if (response.statusCode == 404) {
  //       } else {}
  //     });
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     isLoading(false);
  //   }
  //   return experienceList;
  // }

  final company = CompanyData().obs;
  final isLoadingCompanyProfile = false.obs;
  final companyDataList = <CompanyData>[].obs;
  Future<List<CompanyData>> fetchCompanyMember({int? id}) async {
    tokenKey = await LocalData.getCurrentUser();
    try {
      companyDataList.clear();
      isLoadingCompanyProfile(true);
      String? url;
      if (id != null) {
        url =
            '${GlobalConfiguration().get('api_base_urlv3')}member-company?member_id=$id';
      } else {
        url = '${GlobalConfiguration().get('api_base_urlv3')}company';
      }

      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          debugPrint('helooooooooooooo1234567:${response.body}');
          companyDataList.clear();
          var responseJson = json.decode(response.body)['data'];

          responseJson.map((json) {
            companyDataList.add(CompanyData.fromJson(json));
          }).toList();
        }
      });
    } finally {
      isLoadingCompanyProfile(false);
    }
    return companyDataList;
  }

  final isLoadingCompany = false.obs;
  Future<List<CompanyData>> fetchCompanyMemberDetail(int id) async {
    tokenKey = await LocalData.getCurrentUser();
    isLoadingCompany(true);
    try {
      companyDataList.clear();

      String url =
          '${GlobalConfiguration().get('api_base_urlv2')}member-company?member_id=$id';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          companyDataList.clear();
          var responseJson = json.decode(response.body)['data'];

          responseJson.map((json) {
            companyDataList.add(CompanyData.fromJson(json));
          }).toList();
        }
      });
    } finally {
      isLoadingCompany(false);
    }
    return companyDataList;
  }

  Future<List<Member>> fetchAllMembers(
      {String? filter,
      int pageNumber = 1,
      String? filterJson,
      int? eventId,
      int? isShowCiCTeam}) async {
    isLoading(true);

    page.value++;
    tokenKey = await LocalData.getCurrentUser();
    String url = '';
    if (filter != null) {
      if (isShowCiCTeam != null) {
        debugPrint("is member: 1");
        url =
            '${GlobalConfiguration().get('api_base_url')}customer?fillter=$filter&show_cic_team=1&page=$pageNumber&hide_me=1';
      } else {
        debugPrint("is event:");
        debugPrint("is member: 2");
        url =
            '${GlobalConfiguration().get('api_base_url')}customer?fillter=$filter&page=$pageNumber&event_id=$eventId';
      }
    } else if (filterJson != null) {
      if (memberCurrentPage.value != 0) {
        //1
        if (memberCurrentPage.value < memberLastPage.value) {
          memberCurrentPage.value = memberCurrentPage.value + 1; //2

          if (isShowCiCTeam != null) {
            debugPrint("is member: 3");
            url =
                '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterJson&show_cic_team=1&page=$memberCurrentPage&hide_me=1';
          } else {
            debugPrint("is member: 4");
            url =
                '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterJson&page=$memberCurrentPage&event_id=$eventId';
          }
        }
      } else {
        if (isShowCiCTeam != null) {
          debugPrint("is member: 5");
          url =
              '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterJson&show_cic_team=1&hide_me=1';
        } else {
          debugPrint("is member: 6");
          url =
              '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterJson&event_id=$eventId';
        }
      }
    } else {
      if (isShowCiCTeam != null) {
        debugPrint("is member: 7");
        url =
            '${GlobalConfiguration().get('api_base_url')}customer?show_cic_team=1&hide_me=1&page=$pageNumber';
      } else {
        debugPrint("is member: 8");
        url =
            '${GlobalConfiguration().get('api_base_url')}customer?page=$pageNumber&event_id=$eventId';
      }
    }

    try {
      if (page.value > 0) {
        isloadingMore(true);
      }

      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then(
        (response) {
          if (response.statusCode == 200) {
            var responseJson = json.decode(response.body);

            memberData.value = MemberData.fromJson(responseJson);
            debugPrint("working 1");

            currentPage.value = memberData.value.meta!.currentPage!;
            debugPrint("working 2");

            ///
            // memberList.clear();
            if (memberData.value.links!.next == null) {
              memberList.addAll(memberData.value.data!);
              isEmty(true);
            } else {
              isEmty(false);
            }
            debugPrint("working 3");

            ///
            // memberList.clear();
            if (filter != null || eventId != null) {
              debugPrint("working 4");
              memberList.addAll(memberData.value.data!);
              debugPrint("member data is 1 ");
            } else if (filter != null || eventId != null) {
              //  memberList.clear();
              debugPrint("working 5");

              if (currentPage.value < memberData.value.meta!.lastPage! + 1) {
                debugPrint("working 6");
                memberList.addAll(memberData.value.data!);
                debugPrint("member data is 2 ");
              }
              memberResult.value = memberData.value.meta!.total!;
              memberLastPage.value = memberData.value.meta!.lastPage!;
              if (memberCurrentPage.value == 0) memberCurrentPage.value = 1;
            } else {
              if (memberData.value.links!.next != null) {
                debugPrint("working 7");
                memberList.addAll(memberData.value.data!);
                debugPrint("member data is 3 ");
              } else {
                isloadingMore(false);
              }
            }
          }
        },
      );
    } finally {
      isloadingMore(false);
      isLoading(false);
      isEmty(false);
      // isEmty(false);
      // update();
    }
    return memberList;
  }

  List<Member> filterMemberResult = [];

  Future<List<Member>> filterMember({String? filterOption}) async {
    String url =
        '${GlobalConfiguration().getValue('api_base_url')}customer?fillters=$filterOption';
    try {
      memberList.clear();
      isLoading(true);

      tokenKey = await LocalData.getCurrentUser();
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          memberData.value = MemberData.fromJson(responseJson);

          filterMemberResult.addAll(memberData.value.data!);
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return filterMemberResult;
  }

  @override
  void onReady() {
    fetchMemberPersonProfile(customerController.customer.value.customerId!);
    fetchCompanyMember();
    super.onReady();
  }

  ///Virak Fix Fetch Member
  final apiBaseHelper = ApiBaseHelper();
  var listAllMember = <Member>[].obs;
  var listMemberFiltered = <Member>[].obs;
  final fetchAllMemberLoading = false.obs;
  final fetchMoreMemberLoading = false.obs;
  final currentMemberPage = 1.obs;
  final currentPages = 1.obs;
  final next = true.obs;
  final searchTextFieldController = TextEditingController().obs;

  ///

  ///Fetch All Member
  Future<List<Member>> onFetchAllMember({
    @required int? page,
    int? eventId,
    String? filter,
    String? filterJson,
    bool? showCICteam,
    bool? hideMe,
  }) async {
    String pageParam =
        page != null && page != 0 && page > 0 ? '?page=$page' : '?page=1';
    String filterParam = filter != null ? '&fillter=$filter' : '';
    String isCICmemberParam = showCICteam == null
        ? ''
        : showCICteam == true
            ? '&show_cic_team=1'
            : '&show_cic_team=0';

    String hideMeParam = hideMe == null
        ? ''
        : hideMe == true
            ? '&hide_me=1'
            : '&hide_me=0';
    String eventParam = eventId == null ? '' : '&event_id=$eventId';
    String jsonParam = filterJson == null ? '' : '&fillters=$filterJson';

    ///Controll Loading
    if (page == 1) {
      fetchAllMemberLoading(true);
      fetchMoreMemberLoading(false);
    } else {
      fetchAllMemberLoading(false);
      fetchMoreMemberLoading(true);
    }

    ///Request to API
    await apiBaseHelper
        .onNetworkRequesting(
      urlFull:
          '${GlobalConfiguration().get('api_base_url')}customer$pageParam$filterParam$isCICmemberParam$hideMeParam$eventParam$jsonParam',
      // '${GlobalConfiguration().get('api_base_url')}customer?page=$page&hide_me=1$_filterParam',
      url: '',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      //Check Last Page
      if (response['links']["next"] != null) {
        next(true);
      } else if (response['links']["next"] == null) {
        next(false);
      }

      ///always clear list when using filter
      if (filter != null) {
        listAllMember.clear();
      }

      ///Clear List When Refresh
      if (page == 1) {
        listAllMember.clear();
      }

      var reultFromJson = response['data'];
      reultFromJson.map((e) {
        listAllMember.add(Member.fromJson(e));
      }).toList();

      ///handlel loading
      fetchMoreMemberLoading(false);
      fetchAllMemberLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      fetchAllMemberLoading(false);
      fetchMoreMemberLoading(false);
    });

    return listAllMember;
  }

  final textFieldSearch = ''.obs;
}
