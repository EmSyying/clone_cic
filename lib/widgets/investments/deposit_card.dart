import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/widgets/investments/custom_invest_amount_card.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/form_builder/custom_button.dart';
import 'fif_contract/custom_copy_bank.dart';

class DepositCard extends StatelessWidget {
  final String? title;
  final bool? isMMA;
  final String? content;
  final String? imageProfile;
  final String? amount;

  DepositCard({
    Key? key,
    this.imageProfile,
    this.title,
    this.isMMA = false,
    this.content,
    this.amount,
  }) : super(key: key);
  final depositCon = Get.put(PriceController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 0.1,
                      offset: const Offset(0, 2),
                      blurRadius: 8),
                ],
              ),
              child: Column(
                children: [
                  CustomInvestAmonutCard(
                    title: 'Investment Amount',
                    investAmount: amount,
                    isColors: true,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: DottedDecoration(
                        strokeWidth: 2,
                        shape: Shape.line,
                        color: const Color(0xffDBDBDB)),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => Column(
                      children:
                          depositCon.withdrawBankList.asMap().entries.map((e) {
                        return CustomCopyBank(
                            imgUrl: e.value.image,
                            bankName: e.value.bankName,
                            accountNumber: e.value.accountNumber,
                            accountName: e.value.accountName);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          top: false, //we don't want safeArea on top
          minimum: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: CustomButton(
            title: 'Close',
            isDisable: false,
            isOutline: false,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
    // return !isMMA!
    //     ? SizedBox(
    //         height: 680,
    //         width: double.infinity,
    //         child: Stack(
    //           children: [
    //             Container(
    //               height: double.infinity,
    //               width: double.infinity,
    //               margin: const EdgeInsets.all(20),
    //               padding: const EdgeInsets.all(20),
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(
    //                     borderRaduis,
    //                   ),
    //                   color: Colors.white,
    //                   boxShadow: [
    //                     BoxShadow(
    //                         offset: const Offset(0, 1),
    //                         blurRadius: 7,
    //                         spreadRadius: 4,
    //                         color: Colors.grey.shade200)
    //                   ]),
    //               child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    // CustomInvestAmonutCard(
    //   title: 'Investment Amount',
    //   investAmount: amount,
    //   isColors: true,
    // ),
    //                     const SizedBox(height: 30),
    //                     Stack(
    //                       alignment: Alignment.center,
    //                       children: [
    //                         Container(
    //                           decoration: DottedDecoration(
    //                               strokeWidth: 2,
    //                               shape: Shape.line,
    //                               color: Colors.grey[100]!),
    //                         ),
    //                         Container(
    //                           color: Colors.white,
    //                           child: SvgPicture.asset(
    //                             'assets/images/svgfile/deposit_arrow_down.svg',
    //                             width: 40,
    //                             height: 40,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     const SizedBox(height: 15),
    //                     Center(
    //                       child: Text(
    //                         '$title',
    //                         style: Theme.of(context)
    //                             .textTheme
    //                             .bodyMedium!
    //                             .copyWith(
    //                                 fontSize: 12, fontWeight: FontWeight.w400),
    //                       ),
    //                     ),
    //                     const SizedBox(height: 10),
    //                     Center(
    //                       child: Text(
    //                         amount!,
    //                         style: Theme.of(context)
    //                             .textTheme
    //                             .bodyMedium!
    //                             .copyWith(
    //                                 fontSize: 18, fontWeight: FontWeight.w600),
    //                       ),
    //                     ),
    // const SizedBox(height: 30),
    // Padding(
    //   padding: const EdgeInsets.only(top: 30, bottom: 20),
    //   child: Text(
    //     'Choose payment methods',
    //     style: Theme.of(context).textTheme.bodyMedium,
    //   ),
    // ),
    //                     // ListView.builder(
    //                     //     scrollDirection: Axis.vertical,
    //                     //     itemCount: bankCon.bankMemberDataList.length,
    //                     //     itemBuilder: ((context, index) {
    //                     //       return CustomBankTransferCard(
    //                     //         bankDetail: bankCon.bankMemberDataList[index],
    //                     //       );
    //                     //     }))
    // Expanded(
    //   child: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.only(bottom: 30),
    //       child: Obx(
    //         () => Column(
    //           children: depositCon.withdrawBankList
    //               .asMap()
    //               .entries
    //               .map((e) {
    //             return CustomBankTransferCard(
    //               isTranId: false,
    //               bankDetail: e.value,
    //             );
    //             // PaymentCard(
    //             //   accountName: e.value.title,
    //             //   content: e.value.date,
    //             //   image: e.value.image,
    //             //   selectIndex: depositCon.isSelect.value,
    //             //   currentIndex:
    //             //       depositCon.selected.value == 'Selected'
    //             //           ? e.key
    //             //           : null,
    //             //   onTab: () {
    //             //     depositCon.selected.value = 'Selected';
    //             //     depositCon.isSelect.value = e.key;
    //             //     depositCon.update();
    //             //     depositCon.selected.refresh();
    //             //   },
    //             // );
    //           }).toList(),
    //         ),
    //       ),
    //     ),
    //   ),
    // ),

    //                     // PaymentCard(
    //                     //   accountName: 'CiC MM Account',
    //                     //   content: 'Pay securly with CiC MM Account',
    //                     //   image: 'assets/images/svgfile/cicAcc.png',
    //                     //   currentIndex: depositCon.isSelectCiC.value,
    //                     //   selectIndex: 0,
    //                     //   onTab: () {
    //                     //     depositCon.isSelectCiC.value = 0;
    //                     //   },
    //                     // ),
    //                     // SizedBox(height: 20),
    //                     // PaymentCard(
    //                     //   accountName: 'ABA Bank',
    //                     //   content: 'Tap to pay with ABA Mobile',
    //                     //   image: 'assets/images/banks/aba_bank1.png',
    //                     //   isSeleted: depositCon.isSelectABA.value,
    //                     //   onTab: () {
    //                     //     depositCon.isSelectABA.value =
    //                     //         !depositCon.isSelectABA.value;
    //                     //   },
    //                     // ),
    //                   ]),
    //             ),
    //             Positioned(
    //               left: 20,
    //               right: 20,
    //               top: 293,
    //               child: Container(
    //                 decoration: DottedDecoration(
    //                   shape: Shape.line,
    //                   color: Colors.grey[300]!,
    //                   strokeWidth: 2,
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               left: 10,
    //               top: 280,
    //               child: Container(
    //                 width: 25,
    //                 height: 25,
    //                 alignment: Alignment.center,
    //                 decoration: BoxDecoration(
    //                   color: Theme.of(context).scaffoldBackgroundColor,
    //                   border: Border.fromBorderSide(
    //                     BorderSide(
    //                         color: Theme.of(context).scaffoldBackgroundColor),
    //                   ),
    //                   shape: BoxShape.circle,
    //                   boxShadow: const [
    //                     BoxShadow(
    //                         color: Colors.grey, blurRadius: 1, spreadRadius: 1),
    //                     BoxShadow(
    //                         color: Colors.white,
    //                         blurRadius: 5,
    //                         spreadRadius: 4),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               left: -15,
    //               top: 270,
    //               child: Container(
    //                 width: 35,
    //                 height: 40,
    //                 decoration: BoxDecoration(
    //                   color: Theme.of(context).scaffoldBackgroundColor,
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               right: 10,
    //               top: 280,
    //               child: Container(
    //                 width: 25,
    //                 height: 25,
    //                 decoration: BoxDecoration(
    //                   color: Theme.of(context).scaffoldBackgroundColor,
    //                   border: Border.fromBorderSide(
    //                     BorderSide(
    //                         color: Theme.of(context).scaffoldBackgroundColor),
    //                   ),
    //                   shape: BoxShape.circle,
    //                   boxShadow: const [
    //                     BoxShadow(
    //                         color: Colors.grey, blurRadius: 1, spreadRadius: 1),
    //                     BoxShadow(
    //                         color: Colors.white,
    //                         blurRadius: 5,
    //                         spreadRadius: 4),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               right: -15,
    //               top: 270,
    //               child: Container(
    //                 width: 35,
    //                 height: 40,
    //                 decoration: BoxDecoration(
    //                   color: Theme.of(context).scaffoldBackgroundColor,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     : Container(
    //         padding: const EdgeInsets.only(top: 30),
    //         width: double.infinity,
    //         margin: const EdgeInsets.all(20),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //                 offset: const Offset(0, 1),
    //                 blurRadius: 5,
    //                 spreadRadius: 3,
    //                 color: Colors.grey[200]!)
    //           ],
    //         ),
    //         child: Column(children: [
    //           Container(
    //             width: 80,
    //             height: 80,
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               color: Colors.grey[100],
    //               // image: DecorationImage(
    //               //     image:
    //               //         AssetImage('assets/images/cic_logo_deposite.png'),
    //               //     fit: BoxFit.fill)
    //             ),
    //             child: Center(
    //               child: SvgPicture.asset(imageProfile ?? '...'),
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           Text(
    //             '$title',
    //             style: Theme.of(context)
    //                 .textTheme
    //                 .headlineMedium!
    //                 .copyWith(fontWeight: FontWeight.w700),
    //           ),
    //           const SizedBox(
    //             height: 5,
    //           ),
    //           Text('$content', style: Theme.of(context).textTheme.headlineSmall),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           Stack(
    //             alignment: Alignment.center,
    //             children: [
    //               Container(
    //                 margin: const EdgeInsets.all(20),
    //                 decoration: DottedDecoration(
    //                     shape: Shape.line, color: Colors.grey[400]!),
    //               ),
    //               Container(
    //                 padding: const EdgeInsets.only(left: 10, right: 10),
    //                 color: Colors.white,
    //                 child: Text(
    //                   'Invest in CiC FIF',
    //                   style: Theme.of(context)
    //                       .textTheme
    //                       .headlineSmall!
    //                       .copyWith(fontSize: 14),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           const SizedBox(height: 20),
    //           Padding(
    //             padding: const EdgeInsets.all(20),
    //             child: CustomInvestAmonutCard(
    //               isColors: true,
    //               title: 'Investment Amount',
    //               investAmount: amount,
    //             ),
    //           )
    //         ]),
    //       );
  }
}
