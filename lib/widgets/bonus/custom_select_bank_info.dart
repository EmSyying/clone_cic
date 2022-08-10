// import 'package:cicgreenloan/controller/Bonus/bonusController.dart';
// import 'package:cicgreenloan/helper/color.dart';
// import 'package:cicgreenloan/helper/containerPartern.dart';
// import 'package:cicgreenloan/models/bonus/bank_member.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class CustomSelectBankInfo extends StatelessWidget {
//   final GestureTapCallback? onTap;

//   final List<BankMemberData>? bankList;
//   const CustomSelectBankInfo({Key? key, this.bankList, this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bonusCon = Get.put(BonusController());
//     return Obx(
//       () => Container(
//         padding: EdgeInsets.only(bottom: 30),
//         height: MediaQuery.of(context).size.height * 0.50,
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               height: 5,
//               width: 50,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(borderRaduis),
//                   color: Colors.grey),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.arrow_back_ios)),
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 40),
//                   child: Text('Select Your Accont'),
//                 ),
//                 Spacer(),
//               ],
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: bankList!
//                       .asMap()
//                       .entries
//                       .map((e) => GestureDetector(
//                           onTap: () async {
//                             bonusCon.isSelectedBank.value = true;
//                             bonusCon.bankInfoIndex.value = e.key;
//                             bonusCon.bankName.value = e.value.bankName!;
//                             bonusCon.accountName.value = e.value.accountName!;
//                             bonusCon.accountNumber.value =
//                                 e.value.accountNumber!;
//                             bonusCon.accountNumber.value =
//                                 e.value.accountNumber!;
//                             bonusCon.bankInfoIndex.refresh();
//                             bonusCon.update();
//                           },
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             color: Colors.transparent,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   color: bonusCon.isSelectedBank.value ==
//                                               true &&
//                                           bonusCon.bankInfoIndex.value == e.key
//                                       ? Colors.grey[200]
//                                       : null,
//                                   padding: EdgeInsets.only(
//                                       left: 20, top: 10, bottom: 10),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             e.value.bankName!,
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .headline2,
//                                           ),
//                                         ],
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(right: 20),
//                                         child: bonusCon.isSelectedBank.value ==
//                                                     true &&
//                                                 bonusCon.bankInfoIndex.value ==
//                                                     e.key
//                                             ? SvgPicture.asset(
//                                                 'assets/images/svgfile/circle_check-selected.svg')
//                                             : SvgPicture.asset(
//                                                 'assets/images/svgfile/cicle_check.svg'),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Divider(
//                                     endIndent: 0,
//                                     height: 0,
//                                     indent: 0,
//                                     thickness: 1.2,
//                                     color: Colors.grey[300])
//                               ],
//                             ),
//                           )))
//                       .toList(),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: onTap,
//               child: Container(
//                 color: Colors.transparent,
//                 padding: const EdgeInsets.only(top: 10, left: 15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.add_circle_outline,
//                       color: AppColor.mainColor,
//                       size: 20,
//                     ),
//                     SizedBox(width: 15),
//                     Text(
//                       'Create new bank',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline1!
//                           .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
