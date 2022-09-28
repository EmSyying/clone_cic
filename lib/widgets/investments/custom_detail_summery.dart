import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/widgets/investments/custom_product_type_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/helper/color.dart';

class CustomDetailSummery extends StatelessWidget {
  const CustomDetailSummery({
    Key? key,
    this.investDate,
    this.firstpaymentDate,
    this.maturityDate,
    this.annuallyInterestRate,
    this.investDuration,
    this.investPayment,
    this.durationPeriod,
    this.maturityInstruction,
    this.accountBank,
  }) : super(key: key);
  final String? investDate;
  final String? firstpaymentDate;
  final String? maturityDate;
  final String? annuallyInterestRate;
  final String? investDuration;
  final num? investPayment;
  final String? durationPeriod;
  final String? maturityInstruction;
  final String? accountBank;
  @override
  Widget build(BuildContext context) {
    final fifController = Get.put(PriceController());
    // num? progress = fifController.fifAccountDetailModel.value.originalDuration;
    // num? duration = fifController.fifAccountDetailModel.value.paid;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfffafafa)),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Investment Duration:',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 14)),
                      Text('$investDuration',
                          style: Theme.of(context).textTheme.bodyText2)
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300]),
                      ),
                      if (fifController
                              .fifAccountDetailModel.value.paymentProgressBar !=
                          0)
                        Container(
                          width: (MediaQuery.of(context).size.width - 80) *
                              fifController.fifAccountDetailModel.value
                                  .paymentProgressBar!,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.mainColor),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$durationPeriod',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ProductTypeDetailText(
                  label: 'Investment Date',
                  value: '$investDate',
                ),
                const SizedBox(height: 15),
                ProductTypeDetailText(
                  label: 'First Payment Date',
                  value: '$firstpaymentDate',
                ),
                const SizedBox(height: 15),
                ProductTypeDetailText(
                  label: 'Maturity Date',
                  value: '$maturityDate',
                ),
                if (maturityInstruction != '') const SizedBox(height: 15),
                if (maturityInstruction != '')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Maturity Instruction',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 14),
                      ),
                      Text(
                        maturityInstruction ?? '...',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Interest Rate',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 14),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/svgfile/star.svg'),
                        const SizedBox(width: 8),
                        Text(
                          '$annuallyInterestRate',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Coupon Receiving Account',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '$accountBank',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
