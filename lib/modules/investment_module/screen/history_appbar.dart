import 'dart:async';

import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/helper/firebase_analytics.dart';
import '../../../widgets/investments/custom_contract_cancel.dart';
import '../../../widgets/investments/custom_contract_complete.dart';

class FIFHistoryAppbar extends StatefulWidget {
  const FIFHistoryAppbar({Key? key}) : super(key: key);

  @override
  State<FIFHistoryAppbar> createState() => _FIFHistoryAppbarState();
}

class _FIFHistoryAppbarState extends State<FIFHistoryAppbar> {
  List<Widget> widgets = [
    const CustomContractComplete(),
    const CustomContractCancel(),
  ];
  final fifController = Get.put(PriceController());
  int? contractController = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 1.2,
                  color: Colors.grey[200],
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    width: double.infinity,
                    child: CupertinoSlidingSegmentedControl(
                        groupValue: contractController,
                        backgroundColor:
                            const Color(0xff252552).withOpacity(0.1),
                        children: const <int, Widget>{
                          0: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Completed'),
                          ),
                          1: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Cancelled'),
                          ),
                        },
                        // onValueChanged: (int? value) {},
                        onValueChanged: (int? value) {
                          if (value == 1) {
                            Timer(const Duration(seconds: 3), () {
                              fifController.isLoadingContractHistory.value =
                                  false;
                            });
                          } else if (value == 0) {
                            fifController.isLoadingContractHistory.value = true;
                          }
                          setState(() {
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                'tab bar contract history');
                            contractController = value!;
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: widgets[contractController!],
                )
              ],
            ),
          ),
        ),
        // Expanded(
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 20),
        //     child: SingleChildScrollView(
        //         child: CustomContractTransaction(
        //       title: 'ying',
        //       date: '10/10',
        //       amount: '120',
        //       type: 'paid',
        //     )),
        //   ),
        // ),
      ],
    );
  }
}
