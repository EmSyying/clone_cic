import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/helper/firebase_analytics.dart';
import '../../../widgets/get_funding/custom_cancelled_ged_funding.dart';
import '../../../widgets/get_funding/custom_rejected_get_funding.dart';

class HistoryGetFunding extends StatefulWidget {
  const HistoryGetFunding({Key? key}) : super(key: key);

  @override
  State<HistoryGetFunding> createState() => _HistoryGetFundingState();
}

class _HistoryGetFundingState extends State<HistoryGetFunding> {
  List<Widget> widgets = [
    const CustomRejectedGetFunding(),
    const CustomCancelledGetFunding(),
  ];
  int? getFundingController = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              //color: Colors.white,
              color: Colors.white.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Divider(
                //   thickness: 1.2,
                //   color: Colors.grey[200],
                // ),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    width: double.infinity,
                    child: CupertinoSlidingSegmentedControl(
                        groupValue: getFundingController,
                        backgroundColor:
                            const Color(0xff252552).withOpacity(0.1),
                        children: const <int, Widget>{
                          0: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Rejected'),
                          ),
                          1: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Cancelled'),
                          ),
                        },
                        onValueChanged: (int? value) {
                          // if (value == 1) {
                          //   Timer(const Duration(seconds: 3), () {
                          //   contro.isLoadingData.value = false;
                          //   });
                          // } else if (value == 0) {
                          // contro.isLoadingSubmit.value = true;
                          // }
                          setState(() {
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                'tab bar contract history');
                            getFundingController = value!;
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: widgets[getFundingController!],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
