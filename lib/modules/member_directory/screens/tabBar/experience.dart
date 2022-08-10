// import 'package:cicgreenloan/controller/memberController.dart';
// import 'package:cicgreenloan/controller/optionController.dart';
// import 'package:cicgreenloan/models/member/member.dart';
// import 'package:cicgreenloan/models/user/user.dart';
// import 'package:cicgreenloan/widgets/custom_button.dart';
// import 'package:cicgreenloan/widgets/member/emptyState.dart';
// import 'package:cicgreenloan/widgets/member/experienceCard.dart';
// import 'package:cicgreenloan/widgets/member/informationShimmer.dart';
// import 'package:cicgreenloan/widgets/newTextField.dart';
// import 'package:cicgreenloan/widgets/requestLoanComponent/customDropdownNew.dart';
// import 'package:cicgreenloan/widgets/requestLoanComponent/dropdowItem.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class Experience extends StatefulWidget {
//   final User? customer;
//   final Member? member;
//   final bool? isEdiable;

//   Experience({this.customer, this.member, this.isEdiable});
//   @override
//   _ExperienceState createState() => _ExperienceState();
// }

// class _ExperienceState extends State<Experience> {
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   final _memberCon = Get.put(MemberController());
//   final _optionForm = Get.put(DocumentCategory());
//   final dateTime = DateFormat('yyyy-MM-dd');
//   bool? isValidateTitle;
//   final titleKey = GlobalKey();
//   bool? isValidateEmployeeType;
//   bool? isValidateStartDate;
//   final startDateKey = GlobalKey();
//   bool? isValidateEndDate;
//   final endDateKey = GlobalKey();

//   final employeeTypeKey = GlobalKey();
//   bool isValidate() {
//     if (_memberCon.school.value.isEmpty) {
//       setState(() {
//         isValidateEmployeeType = false;
//       });
//       Scrollable.ensureVisible(titleKey.currentContext!);
//       return false;
//     }

//     return true;
//   }

//   // Future<dynamic> loadData() async {
//   //   await _memberCon.fetchExperienceMember(widget.customer.customerId);

//   //   print("Chhany");
//   // }

//   @override
//   void initState() {
//     if (widget.customer != null) {
//       _memberCon.fetchExperienceMember(widget.customer!.customerId!);
//     } else {
//       _memberCon.fetchExperienceMember(widget.member!.id!);
//     }
//     super.initState();
//   }

//   Future<void> onRefresh() async {
//     if (widget.customer!.id != null) {
//       await _memberCon.fetchExperienceMember(widget.customer!.customerId!);
//     } else {
//       await _memberCon.fetchExperienceMember(widget.member!.id!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => _memberCon.isLoading.value
//           ? InformationShimmer()
//           : _memberCon.experienceList.length != 0
//               ? Container(
//                   color: Colors.white,
//                   child: SingleChildScrollView(
//                     physics: NeverScrollableScrollPhysics(),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ExperienceInformationCard(
//                           experienceList: _memberCon.experienceList,
//                           isEditable: widget.isEdiable!,
//                           onSave: () {
//                             showBarModalBottomSheet(
//                                 isDismissible: true,
//                                 context: context,
//                                 builder: (context) {
//                                   return StatefulBuilder(
//                                       builder: (context, myState) {
//                                     return SingleChildScrollView(
//                                       child: Form(
//                                         key: formkey,
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             SizedBox(
//                                               height: 20,
//                                             ),
//                                             CustomTextFieldNew(
//                                               isValidate: isValidateTitle!,
//                                               key: titleKey,
//                                               labelText: 'Enter Title',
//                                               hintText: 'Enter Title',
//                                               onChange: (value) {
//                                                 if (value.isEmpty) {
//                                                   setState(() {
//                                                     _memberCon.title.value = '';
//                                                     isValidateTitle = false;
//                                                     _memberCon.title.value = '';
//                                                   });
//                                                 } else {
//                                                   setState(() {
//                                                     _memberCon.title.value =
//                                                         value;
//                                                     isValidateTitle = true;
//                                                   });
//                                                 }
//                                               },
//                                               initialValue: '',
//                                               onSave: ((value) {
//                                                 _memberCon.title.value = value!;
//                                               }),
//                                             ),
//                                             CustomTextFieldNew(
//                                               hintText: 'Enter Company Name',
//                                               isRequired: false,
//                                               labelText: 'Enter Comapany Name',
//                                               initialValue: '',
//                                               onSave: (value) {
//                                                 _memberCon.companyName.value =
//                                                     value!;
//                                               },
//                                             ),
//                                             CICDropdown(
//                                               isValidate:
//                                                   isValidateEmployeeType,
//                                               key: employeeTypeKey,
//                                               item: _optionForm.shiftWorkList
//                                                   .asMap()
//                                                   .entries
//                                                   .map((e) {
//                                                 return DropDownItem(
//                                                   itemList: {
//                                                     "Name": e.value.display!,
//                                                     "Code":
//                                                         e.value.id.toString()
//                                                   },
//                                                 );
//                                               }).toList(),
//                                               onChange: (value) {
//                                                 _memberCon.employmentType
//                                                     .value = value["Code"];
//                                                 // setState(() {
//                                                 //   // reqCon.purpose.value =
//                                                 //   //     OptionForm(
//                                                 //   //         id: int.parse(
//                                                 //   //             value["Code"]),
//                                                 //   //         display: value["Name"]);
//                                                 //   // print(
//                                                 //   //     "Purose : ${reqCon.purpose.value.display}");
//                                                 //   isValidateEmployeeType = true;
//                                                 // });
//                                               },
//                                               label: 'Employment Type',
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             CICDropdown(
//                                               isValidate: isValidateStartDate,
//                                               key: startDateKey,
//                                               label: 'Start Date',
//                                               onChange: (value) {
//                                                 setState(() {
//                                                   _memberCon.experienceStartDate
//                                                       .value = value["Name"];
//                                                   isValidateStartDate = true;
//                                                 });
//                                               },
//                                               defaultValue: {
//                                                 "Code": "02",
//                                                 "Name": dateTime
//                                                     .format(DateTime.now())
//                                               },
//                                               isDateTimePicker: true,
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             CICDropdown(
//                                               isValidate: isValidateEndDate,
//                                               key: endDateKey,
//                                               label: 'End Date',
//                                               onChange: (value) {
//                                                 setState(() {
//                                                   _memberCon.experienceEndDate
//                                                       .value = value["Name"];
//                                                   isValidateEndDate = true;
//                                                 });
//                                               },
//                                               defaultValue: {
//                                                 "Code": "02",
//                                                 "Name": dateTime
//                                                     .format(DateTime.now())
//                                               },
//                                               isDateTimePicker: true,
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             CustomTextFieldNew(
//                                               hintText: 'Enter Description',
//                                               isRequired: false,
//                                               labelText: 'Enter Description',
//                                               initialValue: '',
//                                               onSave: (value) {
//                                                 _memberCon.experienceDecription
//                                                     .value = value!;
//                                               },
//                                             ),
//                                             CustomTextFieldNew(
//                                               hintText: 'Enter Grade',
//                                               isRequired: false,
//                                               labelText: 'Enter Grade',
//                                               initialValue: '',
//                                               onSave: (value) {
//                                                 _memberCon.experienceGrade
//                                                     .value = value!;
//                                               },
//                                             ),
//                                             CustomTextFieldNew(
//                                               hintText: 'Enter Location',
//                                               isRequired: false,
//                                               labelText: 'Enter Lcoation',
//                                               initialValue: '',
//                                               onSave: (value) {
//                                                 _memberCon.location.value =
//                                                     value!;
//                                               },
//                                             ),
//                                             SizedBox(
//                                               height: 20,
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 20),
//                                               child: CustomButton(
//                                                 isDisable: false,
//                                                 isOutline: false,
//                                                 onPressed: () {
//                                                   myState(() {
//                                                     formkey.currentState!
//                                                         .save();
//                                                     _memberCon
//                                                         .onSubmitExperience(
//                                                             context);
//                                                     onRefresh();
//                                                   });

//                                                   Navigator.pop(context);
//                                                 },
//                                                 title: 'Done',
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 40,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   });
//                                 });
//                           },
//                           onEdit: () {
//                             print('Edit Experience');
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : EmptyStateProfile(
//                   isEditable: widget.isEdiable!,
//                   title: 'No Experience Yet',
//                   caption:
//                       'Here��s where you’ll find the newest update of member profile',
//                   buttonLabel: 'Add Experience',
//                   iconUrl: 'assets/images/emptyState.png',
//                   onTap: () {
//                     showBarModalBottomSheet(
//                         isDismissible: true,
//                         context: context,
//                         builder: (context) {
//                           return StatefulBuilder(builder: (context, myState) {
//                             return SingleChildScrollView(
//                               child: Form(
//                                 key: formkey,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     CustomTextFieldNew(
//                                       isValidate: isValidateTitle!,
//                                       key: titleKey,
//                                       labelText: 'Enter Title',
//                                       hintText: 'Enter Title',
//                                       onChange: (value) {
//                                         if (value.isEmpty) {
//                                           setState(() {
//                                             _memberCon.title.value = '';
//                                             isValidateTitle = false;
//                                             _memberCon.title.value = '';
//                                           });
//                                         } else {
//                                           setState(() {
//                                             _memberCon.title.value = value;
//                                             isValidateTitle = true;
//                                           });
//                                         }
//                                       },
//                                       initialValue: '',
//                                       onSave: ((value) {
//                                         _memberCon.title.value = value!;
//                                       }),
//                                     ),
//                                     CICDropdown(
//                                       isValidate: isValidateEmployeeType,
//                                       key: employeeTypeKey,
//                                       item: _optionForm.shiftWorkList
//                                           .asMap()
//                                           .entries
//                                           .map((e) {
//                                         return DropDownItem(
//                                           itemList: {
//                                             "Name": e.value.display!,
//                                             "Code": e.value.id.toString()
//                                           },
//                                         );
//                                       }).toList(),
//                                       onChange: (value) {
//                                         _memberCon.employmentType.value =
//                                             value["Code"];
//                                         setState(() {
//                                           _memberCon.employmentType.value =
//                                               value["Code"];
//                                           isValidateEmployeeType = true;
//                                         });
//                                       },
//                                       label: 'Select Emloyment Type',
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     CICDropdown(
//                                       isValidate: isValidateStartDate,
//                                       key: startDateKey,
//                                       label: 'Start Date',
//                                       onChange: (value) {
//                                         setState(() {
//                                           _memberCon.startDate.value =
//                                               value["Name"];
//                                           isValidateStartDate = true;
//                                         });
//                                       },
//                                       defaultValue: {
//                                         "Code": "02",
//                                         "Name": dateTime.format(DateTime.now())
//                                       },
//                                       isDateTimePicker: true,
//                                     ),
//                                     CICDropdown(
//                                       isValidate: isValidateEndDate,
//                                       key: endDateKey,
//                                       label: 'End Date',
//                                       onChange: (value) {
//                                         setState(() {
//                                           _memberCon.endDate.value =
//                                               value["Name"];
//                                           isValidateEndDate = true;
//                                         });
//                                       },
//                                       defaultValue: {
//                                         "Code": "02",
//                                         "Name": dateTime.format(DateTime.now())
//                                       },
//                                       isDateTimePicker: true,
//                                     ),
//                                     CustomTextFieldNew(
//                                       hintText: 'Enter Description',
//                                       isRequired: false,
//                                       labelText: 'Enter Description',
//                                       initialValue: '',
//                                       onSave: (value) {
//                                         _memberCon.description.value = value!;
//                                       },
//                                     ),
//                                     CustomTextFieldNew(
//                                       hintText: 'Enter Grade',
//                                       isRequired: false,
//                                       labelText: 'Enter Grade',
//                                       initialValue: '',
//                                       onSave: (value) {
//                                         _memberCon.grade.value = value!;
//                                       },
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 20),
//                                       child: CustomButton(
//                                         isDisable: false,
//                                         isOutline: false,
//                                         onPressed: () {
//                                           myState(() {
//                                             formkey.currentState!.save();
//                                             _memberCon
//                                                 .onSubmitExperience(context);
//                                             onRefresh();
//                                           });

//                                           Navigator.pop(context);
//                                         },
//                                         title: 'Done',
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 40,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           });
//                         });
//                   },
//                 ),
//     );
//   }
// }
