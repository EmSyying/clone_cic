// import 'package:cicgreenloan/controller/memberController.dart';
// import 'package:cicgreenloan/controller/optionController.dart';
// import 'package:cicgreenloan/controller/requestLoanController.dart';
// import 'package:cicgreenloan/controller/updateMember.dart';
// import 'package:cicgreenloan/models/member/member.dart';
// import 'package:cicgreenloan/models/user/user.dart';
// import 'package:cicgreenloan/widgets/custom_button.dart';
// import 'package:cicgreenloan/widgets/member/educationCard.dart';
// import 'package:cicgreenloan/widgets/member/emptyState.dart';
// import 'package:cicgreenloan/widgets/member/informationShimmer.dart';
// import 'package:cicgreenloan/widgets/newTextField.dart';
// import 'package:cicgreenloan/widgets/requestLoanComponent/customDropdownNew.dart';
// import 'package:cicgreenloan/widgets/requestLoanComponent/dropdowItem.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class Education extends StatefulWidget {
//   final User? customer;
//   final Member? member;
//   final bool? isEdiable;

//   Education({this.customer, this.member, this.isEdiable});
//   @override
//   _EducationState createState() => _EducationState();
// }

// class _EducationState extends State<Education> {
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   final _memberCon = Get.put(MemberController());
//   final _optionForm = Get.put(DocumentCategory());
//   final reqCon = Get.put(RequestLoanController());
//   final onUpdate = Get.put(MemberUpdatController());
//   final dateTime = DateFormat('yyyy-MM-dd');
//   bool? isValidateStartDate;
//   bool? isValidateEndDate;
//   final startDateKey = GlobalKey();
//   final endDateKey = GlobalKey();
//   bool? isValidateSchool;
//   final schoolKey = GlobalKey();
//   bool? isValidateFieldOfStudy;
//   final fieldOfStudyKey = GlobalKey();
//   bool? isValidateDegree;
//   final degreeKey = GlobalKey();
//   bool isValidate() {
//     if (_memberCon.school.value.isEmpty) {
//       setState(() {
//         isValidateSchool = false;
//       });
//       Scrollable.ensureVisible(schoolKey.currentContext!);
//       return false;
//     }
//     // else if (cusCon.customer.value.dateOfBirth.isEmpty) {
//     //   setState(() {
//     //     isValidateDateOfBirth = false;
//     //   });
//     //   Scrollable.ensureVisible(dateofBirthKey.currentContext);
//     //   return false;
//     // } else if (reqCon.email.value.isEmpty) {
//     //   setState(() {
//     //     isValidateEmail = false;
//     //   });
//     //   Scrollable.ensureVisible(emailKey.currentContext);
//     //   return false;
//     // } else if (purposeLabel.value.isEmpty) {
//     //   setState(() {
//     //     isValidatePurpose = false;
//     //     return false;
//     //   });
//     //   Scrollable.ensureVisible(purposeKey.currentContext);
//     //   print("No purpose: ${reqCon.purpose.value.display}");
//     //   return false;
//     // } else if (loanAmount.isEmpty) {
//     //   setState(() {
//     //     isValidateLoanAmount = false;
//     //   });
//     //   Scrollable.ensureVisible(loanAmountKey.currentContext);
//     //   return false;
//     // }
//     // if (cusCon.customer.value.dateOfBirth.isEmpty) {
//     //   setState(() {
//     //     isValidateDateOfBirth = false;
//     //   });
//     //   return false;
//     // }
//     // if (reqCon.email.value.isEmpty) {
//     //   setState(() {
//     //     isValidateEmail = false;
//     //   });
//     //   return false;
//     // }
//     // if (purposeLabel.value.isEmpty) {
//     //   setState(() {
//     //     isValidatePurpose = false;
//     //   });
//     //   return false;
//     // }
//     // if (loanAmount.isEmpty) {
//     //   setState(() {
//     //     isValidateLoanAmount = false;
//     //   });
//     //   return false;
//     // }
//     return true;
//   }

//   @override
//   void initState() {
//     _optionForm.fetchDocumentCategory();
//     // _optionForm.optionForm('fghj');

//     if (widget.customer != null) {
//       _memberCon.fetchEducationMember(widget.customer!.customerId!);
//     } else {
//       _memberCon.fetchEducationMember(widget.member!.id!);
//     }
//     super.initState();
//   }

//   Future<void> onRefresh() async {
//     if (widget.customer!.id != null) {
//       await _memberCon.fetchEducationMember(widget.customer!.customerId!);
//     } else {
//       await _memberCon.fetchEducationMember(widget.member!.id!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => _memberCon.isLoading.value
//         ? InformationShimmer()
//         : _memberCon.educationMemberData.length != 0
//             ? Container(
//                 color: Colors.white,
//                 child: SingleChildScrollView(
//                   physics: NeverScrollableScrollPhysics(),
//                   child: Column(
//                     children: [
//                       EducationInformationCard(
//                         educationList: _memberCon.educationMemberData,
//                         isEditable: widget.isEdiable!,
//                         onSave: () {
//                           // showBarModalBottomSheet(
//                           //   context: context,
//                           //   builder: (context) {},
//                           // );
//                           showBarModalBottomSheet(
//                               isDismissible: true,
//                               context: context,
//                               builder: (context) {
//                                 return StatefulBuilder(
//                                     builder: (context, myState) {
//                                   return SingleChildScrollView(
//                                     child: Form(
//                                       key: formkey,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           CustomTextFieldNew(
//                                             isValidate: isValidateSchool!,
//                                             key: schoolKey,
//                                             labelText: 'Enter School Name *',
//                                             hintText: 'Enter School Name *',
//                                             onChange: (value) {
//                                               if (value.isEmpty) {
//                                                 setState(() {
//                                                   _memberCon.school.value = '';
//                                                   isValidateSchool = false;
//                                                   _memberCon.school.value = '';
//                                                 });
//                                               } else {
//                                                 setState(() {
//                                                   _memberCon.school.value =
//                                                       value;
//                                                   isValidateSchool = true;
//                                                 });
//                                               }
//                                             },
//                                             initialValue: '',
//                                             onSave: ((value) {
//                                               _memberCon.school.value = value!;
//                                             }),
//                                           ),
//                                           // SizedBox(
//                                           //   height: 10,
//                                           // ),
//                                           CICDropdown(
//                                             isValidate: isValidateFieldOfStudy!,
//                                             key: fieldOfStudyKey,
//                                             item: _optionForm.fieldOfStudyList
//                                                 .asMap()
//                                                 .entries
//                                                 .map((e) {
//                                               return DropDownItem(
//                                                 itemList: {
//                                                   "Name": e.value.display!,
//                                                   "Code": e.value.id.toString()
//                                                 },
//                                               );
//                                             }).toList(),
//                                             onChange: (value) {
//                                               _memberCon.fieldOfstudy.value =
//                                                   value["Code"];
//                                               setState(() {
//                                                 _memberCon.fieldOfstudy.value =
//                                                     value["Code"];
//                                                 isValidateFieldOfStudy = true;
//                                               });
//                                             },
//                                             label: 'Field of study *',
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CICDropdown(
//                                             isValidate: isValidateDegree!,
//                                             key: degreeKey,
//                                             item: _optionForm.degreeList
//                                                 .asMap()
//                                                 .entries
//                                                 .map((e) {
//                                               return DropDownItem(
//                                                 itemList: {
//                                                   "Name": e.value.display!,
//                                                   "Code": e.value.id.toString()
//                                                 },
//                                               );
//                                             }).toList(),
//                                             onChange: (value) {
//                                               _memberCon.degree.value =
//                                                   value["Code"];
//                                               setState(() {
//                                                 _memberCon.degree.value =
//                                                     value["Code"];
//                                                 isValidateDegree = true;
//                                               });
//                                             },
//                                             label: 'Degree *',
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CICDropdown(
//                                             isValidate: isValidateStartDate!,
//                                             key: startDateKey,
//                                             label: 'Start Date',
//                                             onChange: (value) {
//                                               setState(() {
//                                                 _memberCon.startDate.value =
//                                                     value["Name"];
//                                                 isValidateStartDate = true;
//                                               });
//                                             },
//                                             defaultValue: {
//                                               "Code": "02",
//                                               "Name": dateTime
//                                                   .format(DateTime.now())
//                                             },
//                                             isDateTimePicker: true,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CICDropdown(
//                                             isValidate: isValidateEndDate!,
//                                             key: endDateKey,
//                                             label: 'End Date',
//                                             onChange: (value) {
//                                               setState(() {
//                                                 _memberCon.endDate.value =
//                                                     value["Name"];
//                                                 isValidateEndDate = true;
//                                               });
//                                             },
//                                             defaultValue: {
//                                               "Code": "02",
//                                               "Name": dateTime
//                                                   .format(DateTime.now())
//                                             },
//                                             isDateTimePicker: true,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomTextFieldNew(
//                                             hintText: 'Enter Description',
//                                             isRequired: false,
//                                             labelText: 'Enter Description',
//                                             initialValue: '',
//                                             onSave: (value) {
//                                               _memberCon.description.value =
//                                                   value!;
//                                             },
//                                           ),
//                                           CustomTextFieldNew(
//                                             hintText: 'Enter Grade',
//                                             isRequired: false,
//                                             labelText: 'Enter Grade',
//                                             initialValue: '',
//                                             onSave: (value) {
//                                               _memberCon.grade.value = value!;
//                                             },
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 20),
//                                             child: CustomButton(
//                                               isDisable: false,
//                                               isOutline: false,
//                                               onPressed: () {
//                                                 myState(() {
//                                                   _memberCon
//                                                       .onSubmitEducationUserProfile(
//                                                           context);
//                                                   formkey.currentState!.save();
//                                                   onRefresh();
//                                                   // _memberCon
//                                                   //     .fetchEducationMember(
//                                                   //         widget.customer
//                                                   //             .customerId);
//                                                 });

//                                                 Navigator.pop(context);
//                                               },
//                                               title: 'Done',
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 40,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 });
//                               });
//                         },
//                         // =====================ON EDIT===================================
//                         onEdit: (int index) {
//                           showBarModalBottomSheet(
//                               isDismissible: true,
//                               context: context,
//                               builder: (context) {
//                                 return StatefulBuilder(
//                                     builder: (context, myState) {
//                                   return SingleChildScrollView(
//                                     child: Form(
//                                         key: formkey,
//                                         child: Column(children: [
//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           CustomTextFieldNew(
//                                             isValidate: isValidateSchool!,
//                                             key: schoolKey,
//                                             labelText: 'Enter School Name',
//                                             hintText: 'Enter School Name',
//                                             onChange: (value) {
//                                               if (value.isEmpty) {
//                                                 setState(() {
//                                                   onUpdate.school.value = '';
//                                                   isValidateSchool = false;
//                                                   onUpdate.school.value = '';
//                                                 });
//                                               } else {
//                                                 setState(() {
//                                                   onUpdate.school.value = value;
//                                                   isValidateSchool = true;
//                                                 });
//                                               }
//                                             },
//                                             initialValue: _memberCon
//                                                 .educationMemberData[index]
//                                                 .school!,
//                                             onSave: ((value) {
//                                               onUpdate.school.value = value!;
//                                             }),
//                                           ),
//                                           // SizedBox(
//                                           //   height: 10,
//                                           // ),
//                                           CICDropdown(
//                                             isValidate: isValidateFieldOfStudy!,
//                                             key: fieldOfStudyKey,
//                                             item: _optionForm.fieldOfStudyList
//                                                 .asMap()
//                                                 .entries
//                                                 .map((e) {
//                                               return DropDownItem(
//                                                 itemList: {
//                                                   "Name": e.value.display!,
//                                                   "Code": e.value.id.toString()
//                                                 },
//                                               );
//                                             }).toList(),
//                                             onChange: (value) {
//                                               onUpdate.fieldOfstudy.value =
//                                                   value["Code"];
//                                               setState(() {
//                                                 onUpdate.fieldOfstudy.value =
//                                                     value["Code"];
//                                                 isValidateFieldOfStudy = true;
//                                               });
//                                             },
//                                             label: _memberCon
//                                                         .educationMemberData[
//                                                             index]
//                                                         .fieldOfStudy!
//                                                         .display !=
//                                                     null
//                                                 ? _memberCon
//                                                     .educationMemberData[index]
//                                                     .fieldOfStudy!
//                                                     .display
//                                                 : 'Field of Study',
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CICDropdown(
//                                             isValidate: isValidateDegree,
//                                             key: degreeKey,
//                                             item: _optionForm.degreeList
//                                                 .asMap()
//                                                 .entries
//                                                 .map((e) {
//                                               return DropDownItem(
//                                                 itemList: {
//                                                   "Name": e.value.display!,
//                                                   "Code": e.value.id.toString()
//                                                 },
//                                               );
//                                             }).toList(),
//                                             onChange: (value) {
//                                               onUpdate.degree.value =
//                                                   value["Code"];
//                                               setState(() {
//                                                 onUpdate.degree.value =
//                                                     value["Code"];
//                                                 isValidateDegree = true;
//                                               });
//                                             },
//                                             label: _memberCon
//                                                         .educationMemberData[
//                                                             index]
//                                                         .degree!
//                                                         .display !=
//                                                     null
//                                                 ? _memberCon
//                                                     .educationMemberData[index]
//                                                     .degree!
//                                                     .display
//                                                 : 'Degree',
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CICDropdown(
//                                             isValidate: isValidateStartDate,
//                                             key: startDateKey,
//                                             label: 'Start Date',
//                                             onChange: (value) {
//                                               setState(() {
//                                                 onUpdate.startDate.value =
//                                                     value["Name"];
//                                                 isValidateStartDate = true;
//                                               });
//                                             },
//                                             defaultValue: {
//                                               "Code": "02",
//                                               "Name": _memberCon
//                                                           .educationMemberData[
//                                                               index]
//                                                           .startDate !=
//                                                       null
//                                                   ? _memberCon
//                                                       .educationMemberData[
//                                                           index]
//                                                       .startDate
//                                                   : dateTime
//                                                       .format(DateTime.now())
//                                             },
//                                             isDateTimePicker: true,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CICDropdown(
//                                             isValidate: isValidateEndDate,
//                                             key: endDateKey,
//                                             label: 'End Date',
//                                             onChange: (value) {
//                                               setState(() {
//                                                 onUpdate.endDate.value =
//                                                     value["Name"];
//                                                 isValidateEndDate = true;
//                                               });
//                                             },
//                                             defaultValue: {
//                                               "Code": "02",
//                                               "Name": _memberCon
//                                                           .educationMemberData[
//                                                               index]
//                                                           .endDate !=
//                                                       null
//                                                   ? _memberCon
//                                                       .educationMemberData[
//                                                           index]
//                                                       .endDate
//                                                   : dateTime
//                                                       .format(DateTime.now())
//                                             },
//                                             isDateTimePicker: true,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomTextFieldNew(
//                                             hintText: 'Enter Description',
//                                             isRequired: false,
//                                             labelText: 'Enter Description',
//                                             initialValue: _memberCon
//                                                 .educationMemberData[index]
//                                                 .description!,
//                                             onSave: (value) {
//                                               onUpdate.description.value =
//                                                   value!;
//                                             },
//                                           ),
//                                           CustomTextFieldNew(
//                                             hintText: 'Enter Grade',
//                                             isRequired: false,
//                                             labelText: 'Enter Grade',
//                                             initialValue: _memberCon
//                                                 .educationMemberData[index]
//                                                 .grade!,
//                                             onSave: (value) {
//                                               onUpdate.grade.value = value!;
//                                             },
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 20),
//                                             child: CustomButton(
//                                               isDisable: false,
//                                               isOutline: false,
//                                               onPressed: () {
//                                                 print(
//                                                     "=======School Name==========>${onUpdate.school}");
//                                                 myState(() {
//                                                   formkey.currentState!.save();
//                                                   _memberCon
//                                                       .onUpdateEducation();
//                                                 });
//                                                 onRefresh();
//                                                 Navigator.pop(context);
//                                               },
//                                               title: 'Done',
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 40,
//                                           ),
//                                         ])),
//                                   );
//                                 });
//                               });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             : EmptyStateProfile(
//                 isEditable: widget.isEdiable!,
//                 title: 'No Education Yet',
//                 bodySmall:
//                     'Here’s where you’ll find the newest update of member profile',
//                 buttonLabel: 'Add Education',
//                 iconUrl: 'assets/images/emptyState.png',
//                 onTap: () {
//                   showBarModalBottomSheet(
//                       isDismissible: true,
//                       context: context,
//                       builder: (context) {
//                         return StatefulBuilder(builder: (context, myState) {
//                           return SingleChildScrollView(
//                             child: Form(
//                               key: formkey,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   CustomTextFieldNew(
//                                     isValidate: isValidateSchool!,
//                                     key: schoolKey,
//                                     labelText: 'Enter School Name *',
//                                     hintText: 'Enter School Name *',
//                                     onChange: (value) {
//                                       if (value.isEmpty) {
//                                         setState(() {
//                                           _memberCon.school.value = '';
//                                           isValidateSchool = false;
//                                           _memberCon.school.value = '';
//                                         });
//                                       } else {
//                                         setState(() {
//                                           _memberCon.school.value = value;
//                                           isValidateSchool = true;
//                                         });
//                                       }
//                                     },
//                                     initialValue: '',
//                                     onSave: ((value) {
//                                       _memberCon.school.value = value!;
//                                     }),
//                                   ),
//                                   CICDropdown(
//                                     isValidate: isValidateFieldOfStudy,
//                                     key: fieldOfStudyKey,
//                                     item: _optionForm.fieldOfStudyList
//                                         .asMap()
//                                         .entries
//                                         .map((e) {
//                                       return DropDownItem(
//                                         itemList: {
//                                           "Name": e.value.display!,
//                                           "Code": e.value.id.toString()
//                                         },
//                                       );
//                                     }).toList(),
//                                     onChange: (value) {
//                                       _memberCon.fieldOfstudy.value =
//                                           value["Code"];
//                                       setState(() {
//                                         // reqCon.purpose.value =
//                                         //     OptionForm(
//                                         //         id: int.parse(
//                                         //             value["Code"]),
//                                         //         display: value["Name"]);
//                                         // print(
//                                         //     "Purose : ${reqCon.purpose.value.display}");
//                                         isValidateFieldOfStudy = true;
//                                       });
//                                     },
//                                     label: 'Field of study *',
//                                   ),
//                                   CICDropdown(
//                                     isValidate: isValidateDegree,
//                                     key: degreeKey,
//                                     item: _optionForm.degreeList
//                                         .asMap()
//                                         .entries
//                                         .map((e) {
//                                       return DropDownItem(
//                                         itemList: {
//                                           "Name": e.value.display!,
//                                           "Code": e.value.id.toString()
//                                         },
//                                       );
//                                     }).toList(),
//                                     onChange: (value) {
//                                       _memberCon.degree.value = value["Code"];
//                                       setState(() {
//                                         // reqCon.purpose.value =
//                                         //     OptionForm(
//                                         //         id: int.parse(
//                                         //             value["Code"]),
//                                         //         display: value["Name"]);
//                                         // print(
//                                         //     "Purose : ${reqCon.purpose.value.display}");
//                                         isValidateDegree = true;
//                                       });
//                                     },
//                                     label: 'Degree *',
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   CICDropdown(
//                                     isValidate: isValidateStartDate,
//                                     key: startDateKey,
//                                     label: 'Start Date',
//                                     onChange: (value) {
//                                       setState(() {
//                                         _memberCon.startDate.value =
//                                             value["Name"];
//                                         isValidateStartDate = true;
//                                       });
//                                     },
//                                     defaultValue: {
//                                       "Code": "02",
//                                       "Name": dateTime.format(DateTime.now())
//                                     },
//                                     isDateTimePicker: true,
//                                   ),
//                                   CICDropdown(
//                                     isValidate: isValidateEndDate,
//                                     key: endDateKey,
//                                     label: 'End Date',
//                                     onChange: (value) {
//                                       setState(() {
//                                         _memberCon.endDate.value =
//                                             value["Name"];
//                                         isValidateEndDate = true;
//                                       });
//                                     },
//                                     defaultValue: {
//                                       "Code": "02",
//                                       "Name": dateTime.format(DateTime.now())
//                                     },
//                                     isDateTimePicker: true,
//                                   ),
//                                   CustomTextFieldNew(
//                                     hintText: 'Enter Description',
//                                     isRequired: false,
//                                     labelText: 'Enter Description',
//                                     initialValue: '',
//                                     onSave: (value) {
//                                       _memberCon.description.value = value!;
//                                     },
//                                   ),
//                                   CustomTextFieldNew(
//                                     hintText: 'Enter Grade',
//                                     isRequired: false,
//                                     labelText: 'Enter Grade',
//                                     initialValue: '',
//                                     onSave: (value) {
//                                       _memberCon.grade.value = value!;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     child: CustomButton(
//                                       isDisable: false,
//                                       isOutline: false,
//                                       onPressed: () {
//                                         myState(() {
//                                           if (isValidate()) {
//                                             formkey.currentState!.save();
//                                             _memberCon
//                                                 .onSubmitEducationUserProfile(
//                                                     context);
//                                           }
//                                         });
//                                         onRefresh();
//                                         Navigator.pop(context);
//                                       },
//                                       title: 'Done',
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 40,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         });
//                       });
//                 },
//               ));
//   }
// }
