// import 'package:cicgreenloan/controller/GetFunding/debt_investment_controller.dart';
// import 'package:cicgreenloan/controller/memberController.dart';
// import 'package:cicgreenloan/controller/requestLoanController.dart';
// import 'package:cicgreenloan/helper/containerPartern.dart';
// import 'package:cicgreenloan/models/option/gender.dart';
// import 'package:cicgreenloan/models/requestLoanModel/address.dart';
// import 'package:cicgreenloan/models/requestLoanModel/fullAddressModel.dart';
// import 'package:cicgreenloan/widgets/addressSelectModalSheet.dart';
// import 'package:cicgreenloan/widgets/custom_button.dart';
// import 'package:cicgreenloan/widgets/formRequestLoanNewWidget/addressPicker.dart';
// import 'package:cicgreenloan/widgets/formRequestLoanNewWidget/customChips.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EditAddress extends StatefulWidget {
//   const EditAddress({Key? key}) : super(key: key);

//   @override
//   _EditAddressState createState() => _EditAddressState();
// }

// class _EditAddressState extends State<EditAddress> {
//   final DebtInvestmentController debtCon = Get.put(DebtInvestmentController());
//   final MemberController memCon = Get.put(MemberController());
//   final reqCon = Get.put(RequestLoanController());
//   List addressOption = ['Yes', 'No'];
//   List<GenderOption> sex = [
//     GenderOption(id: 01, display: 'Male'),
//     GenderOption(id: 02, display: 'Female'),
//   ];
//   _onSaveAddress({BuildContext? context, FullAddress? currentAddress,
//       FullAddress? peranentAddress}) {
//     if (currentAddress!.addressList != null) {
//       debtCon.fullCurrentAddress.value = currentAddress;
//       debtCon.fullResidentAddress.value = peranentAddress!;
//     }
//   }


//   @override
//   void initState() { 
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Padding(
//                   //   padding: EdgeInsets.only(
//                   //       left: padding,
//                   //       right: padding,
//                   //       top: padding,
//                   //       bottom: padding - 5),
//                   //   child: Text(
//                   //     'Address',
//                   //     style: Theme.of(context).textTheme.displayMedium,
//                   //   ),
//                   // ),
//                   SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       'Is current address the same permanent address!',
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                         children: addressOption.asMap().entries.map((e) {
//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             if (reqCon.selectedAddressOption.value != e.key) {
//                               reqCon.selectedAddressOption.value = e.key;
//                             } else {
//                               reqCon.selectedAddressOption.value = 1;
//                             }
//                             print(reqCon.selectedAddressOption.value);
//                           });
//                         },
//                         child: CustomChips(
//                           margin: EdgeInsets.only(right: 20),
//                           title: e.value,
//                           currentIndex: e.key,
//                           selectIndex: reqCon.selectedAddressOption.value,
//                         ),
//                       );
//                     }).toList()),
//                   ),
//                   SizedBox(height: padding),
//                   AddressPickerWidget(
//                     isValidate: true,
//                     onTap: () async {
//                       debtCon.currentAddressList.clear();
//                       debtCon.fullCurrentAddress.value =
//                           (await onShowModalSheet(
//                         context: context,
//                         streetNo: reqCon.fullCurrentAddress.value.streetNo,
//                         houseNo: reqCon.fullCurrentAddress.value.houseNo,
//                         onCancel: () {
//                           setState(() {
//                             reqCon.residentAddressList.clear();
//                           });
//                           print("on Cancel-----------------");
//                           Navigator.pop(context);
//                           // Navigator.pop(context);
//                         },
//                         selectAddress: reqCon.currentAddressList,
//                         onSelectProvince: (Address province) {
//                           print(province.name);

//                           setState(() {
//                             reqCon.districtList.clear();
//                             reqCon.getDistrict(province.code!, 'en');
//                             if (!reqCon.currentAddressList.contains(province)) {
//                               reqCon.currentAddressList.add(province);
//                             }
//                           });
//                         },
//                         onSelectCommune: (Address commune) {
//                           setState(() {
//                             reqCon.villageList.clear();
//                             reqCon.getVillage(commune.code!, 'en');
//                             if (!reqCon.currentAddressList.contains(commune)) {
//                               reqCon.currentAddressList.add(commune);
//                             }
//                           });
//                         },
//                         onSelectDistrict: (Address disctrict) {
//                           setState(() {
//                             reqCon.communeList.clear();
//                             reqCon.getCommune(disctrict.code!, 'en');
//                             if (!reqCon.currentAddressList
//                                 .contains(disctrict)) {
//                               reqCon.currentAddressList.add(disctrict);
//                             }
//                           });
//                         },
//                         onSelectVillage: (Address village) {
//                           setState(
//                             () {
//                               if (reqCon.currentAddressList.length != 4) {
//                                 if (!reqCon.currentAddressList
//                                     .contains(village)) {
//                                   reqCon.currentAddressList.add(village);
//                                 }
//                               } else {
//                                 reqCon.currentAddressList[3] = village;
//                               }
//                             },
//                           );
//                         },
//                         communeList: reqCon.communeList,
//                         provinceList: reqCon.provinceList,
//                         villageList: reqCon.villageList,
//                         districtList: reqCon.districtList,
//                       ))!;
//                     },
//                     selectAddress: debtCon
//                                 .fullCurrentAddress.value.addressList !=
//                             null
//                         ? debtCon.fullCurrentAddress.value.addressList!
//                                     .length ==
//                                 3
//                             ? '${debtCon.fullCurrentAddress.value.streetNo} ${debtCon.fullCurrentAddress.value.houseNo} ${debtCon.fullCurrentAddress.value.addressList![0].name} ${debtCon.fullCurrentAddress.value.addressList![1].name} ${debtCon.fullCurrentAddress.value.addressList![2].name}'
//                             : '${debtCon.fullCurrentAddress.value.streetNo} ${debtCon.fullCurrentAddress.value.houseNo} ${debtCon.fullCurrentAddress.value.addressList![0].name} ${debtCon.fullCurrentAddress.value.addressList![1].name} ${debtCon.fullCurrentAddress.value.addressList![2].name} ${debtCon.fullCurrentAddress.value.addressList![3].name}'
//                         : null,
//                     title: 'Select Current Address',
//                   ),
//                   SizedBox(height: padding - 5),
//                   if (reqCon.selectedAddressOption.value == 1)
//                     AddressPickerWidget(
//                       isValidate: true,
//                       onTap: () async {
//                         debtCon.fullResidentAddress.value =
//                             (await onShowModalSheet(
//                           context: context,
//                           onCancel: () {
//                             setState(() {
//                               reqCon.residentAddressList.clear();
//                             });
//                           },
//                           streetNo: reqCon.fullResidentAddress.value.streetNo,
//                           houseNo: reqCon.fullResidentAddress.value.houseNo,
//                           selectAddress: reqCon.residentAddressList,
//                           onSelectProvince: (Address province) {
//                             print(province.name);

//                             setState(() {
//                               reqCon.districtList.clear();
//                               reqCon.getDistrict(province.code!, 'en');
//                               if (!reqCon.residentAddressList
//                                   .contains(province)) {
//                                 reqCon.residentAddressList.add(province);
//                               }
//                             });
//                           },
//                           onSelectCommune: (Address commune) {
//                             setState(() {
//                               reqCon.villageList.clear();
//                               reqCon.getVillage(commune.code!, 'en');
//                               if (!reqCon.residentAddressList
//                                   .contains(commune)) {
//                                 reqCon.residentAddressList.add(commune);
//                               }
//                             });
//                           },
//                           onSelectDistrict: (Address disctrict) {
//                             setState(() {
//                               reqCon.communeList.clear();
//                               reqCon.getCommune(disctrict.code!, 'en');
//                               if (!reqCon.residentAddressList
//                                   .contains(disctrict)) {
//                                 reqCon.residentAddressList.add(disctrict);
//                               }
//                             });
//                           },
//                           onSelectVillage: (Address village) {
//                             setState(() {
//                               if (reqCon.residentAddressList.length != 4) {
//                                 if (!reqCon.residentAddressList
//                                     .contains(village)) {
//                                   reqCon.residentAddressList.add(village);
//                                 }
//                               } else {
//                                 reqCon.residentAddressList[3] = village;
//                               }
//                             });
//                           },
//                           communeList: reqCon.communeList,
//                           provinceList: reqCon.provinceList,
//                           villageList: reqCon.villageList,
//                           districtList: reqCon.districtList,
//                         ))!;
//                         if (reqCon.fullResidentAddress.value.addressList!
//                                 .length !=
//                             0) {
//                           setState(() {
//                             reqCon.isValidateResidentProvince.value = true;
//                           });
//                         }
//                       },
//                       selectAddress: debtCon
//                                   .fullResidentAddress.value.addressList !=
//                               null
//                           ? debtCon.fullResidentAddress.value.addressList!
//                                       .length ==
//                                   3
//                               ? '${debtCon.fullResidentAddress.value.streetNo} ${debtCon.fullResidentAddress.value.houseNo} ${debtCon.fullResidentAddress.value.addressList![0].name} ${debtCon.fullResidentAddress.value.addressList![1].name} ${debtCon.fullResidentAddress.value.addressList![2].name}'
//                               : '${debtCon.fullResidentAddress.value.streetNo} ${debtCon.fullResidentAddress.value.houseNo} ${debtCon.fullResidentAddress.value.addressList![0].name} ${debtCon.fullResidentAddress.value.addressList![1].name} ${debtCon.fullResidentAddress.value.addressList![2].name} ${debtCon.fullResidentAddress.value.addressList![3].name}'
//                           : null,
//                       // selectAddress: 'Hello world',
//                       title: 'Select Permenant Address',
//                     ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: CustomButton(
//                     isDisable: false,
//                     isOutline: true,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     title: 'Close',
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: CustomButton(
//                     isDisable: false,
//                     isOutline: false,
//                     onPressed: () {
//                       _onSaveAddress(context: context,currentAddress: );
//                       Navigator.pop(context);
//                     },
//                     title: 'Save',
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
