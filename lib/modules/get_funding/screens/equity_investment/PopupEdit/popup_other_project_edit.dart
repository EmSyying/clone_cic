import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/form_builder/custom_button.dart';
import '../../../../../Utils/helper/firebase_analytics.dart';
import '../../../../../widgets/get_funding/custom_select_getfunding.dart';
import '../../../../../widgets/get_funding/custom_text_getfunding.dart';
import '../../../controller/equity_investment_controller.dart';
import '../../../models/equat_equity_model.dart';

class CustomOtherProjectEdited extends StatefulWidget {
  const CustomOtherProjectEdited({Key? key}) : super(key: key);

  @override
  State<CustomOtherProjectEdited> createState() =>
      _CustomOtherProjectEditedState();
}

class _CustomOtherProjectEditedState extends State<CustomOtherProjectEdited> {
  Step3EquityModel step3local = Step3EquityModel();
  Step3EquityModel step3defual = Step3EquityModel();
  final equityController = Get.put(EquityInvestmentController());
  @override
  void initState() {
    step3local = Step3EquityModel(
      marketStudy: equityController.marketStudy.value,
      otherDocuments: equityController.otherDocuments.value,
    );
    step3defual = Step3EquityModel(
      marketStudy: equityController.marketStudy.value,
      otherDocuments: equityController.otherDocuments.value,
    );
    super.initState();
  }

  _onpressOtherDoc(
    context,
    marketystudy,
    otherdoc,
  ) {
    equityController.marketStudy.value = marketystudy;
    equityController.otherDocuments.value = otherdoc;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Text(
                  'Other',
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15,
                      color: Color(0xff0F50A4),
                      fontWeight: FontWeight.w700),
                ),
              ),
              const CustomTextGetfunding(
                isrequire: true,
                label1: 'Do you have market study documents?',
                label2: '',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    CustomSelectgetFunding(
                      onSelect: step3local.marketStudy == 0,
                      title: 'No',
                      ontap: () {
                        setState(() {
                          step3local.marketStudy = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomSelectgetFunding(
                      title: 'Yes',
                      onSelect: step3local.marketStudy == 1,
                      ontap: () {
                        setState(() {
                          step3local.marketStudy = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const CustomTextGetfunding(
                isrequire: true,
                label1:
                    'Do you have other documents necessary for business and market understanding?',
                label2: '',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    CustomSelectgetFunding(
                      onSelect: step3local.otherDocuments == 0,
                      title: 'No',
                      ontap: () {
                        setState(() {
                          step3local.otherDocuments = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomSelectgetFunding(
                      title: 'Yes',
                      onSelect: step3local.otherDocuments == 1,
                      ontap: () {
                        setState(() {
                          step3local.otherDocuments = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomButton(
                  isDisable: false,
                  isOutline: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'Cancel',
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: CustomButton(
                  isDisable: false,
                  isOutline: false,
                  onPressed: step3defual == step3local
                      ? null
                      : () {
                          FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              "Equity Edit OtherDoc Preview Form");
                          _onpressOtherDoc(
                            context,
                            step3local.marketStudy,
                            step3local.otherDocuments,
                          );
                        },
                  title: 'Save',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
