import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/color.dart';
import '../../../widgets/investments/custom_invest_amount_card.dart';

class MMADepositAmountScreen extends StatelessWidget {
  const MMADepositAmountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CiC MM Account'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
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
                    const CustomInvestAmonutCard(
                      title: 'CiC MM Account',
                      investAmount: '2400',
                      isColors: true,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: DottedDecoration(
                        strokeWidth: 1,
                        shape: Shape.line,
                        color: const Color(0xffDBDBDB).withOpacity(0.6),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 20.0,
                      ),
                      child: Column(children: [
                        Text(
                          'Amount To Deposit',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '500 USD',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: DottedDecoration(
                        strokeWidth: 2,
                        shape: Shape.line,
                        color: const Color(0xffDBDBDB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Card mma amount component====
            Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Available Payment Account',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  customMMAountCardBank(context),
                  customMMAountCardBank(context),
                ],
              ),
            ),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: CustomButton(
                title: 'Done',
                isDisable: false,
                isOutline: false,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//Custom compoment card mma amount bank===
  Widget customMMAountCardBank(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    AssetImage('assets/images/banks/aba_bank1.png'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ACLEDA Bank',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: AppColor.textColor,
                  ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextMMA(
                context,
                title: 'Acc Name :',
                description: 'Cambodia Invester Club',
              ),
              customTextMMA(
                context,
                title: 'Acc Number :',
                description: '1234 01234467 67',
              ),
              customTextMMA(
                context,
                title: 'Remark :',
                description: 'Trans ID',
                textColor: true,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20.0,
            ),
            decoration: DottedDecoration(
              strokeWidth: 1,
              shape: Shape.line,
              color: const Color(0xffDBDBDB),
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextMMA(
    BuildContext context, {
    String? title,
    String? description,
    bool? textColor = false,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        children: [
          const Icon(
            Icons.circle_rounded,
            size: 5,
          ),
          const SizedBox(
            width: 6.0,
          ),
          Expanded(
            flex: 2,
            child: Text(
              title ?? '',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: textColor == true
                        ? AppColor.primaryColor
                        : AppColor.textColor,
                  ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              description ?? '',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: textColor == true
                        ? AppColor.primaryColor
                        : AppColor.darkColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
