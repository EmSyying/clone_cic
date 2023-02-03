import 'package:cicgreenloan/widgets/bonus/subscribe/custom_make_payment_card.dart';
import 'package:flutter/material.dart';

class CustomMakePayment extends StatelessWidget {
  final String? subscriptionStatus;
  final String? paymentStatus;
  final String? investID;
  final String? investName;
  final num? subscriptionUT;
  final num? subscriptiontCost;
  final Function? onTabDeduct;
  final Function? onTabtransfer;

  final num? remainingPayment;
  const CustomMakePayment(
      {Key? key,
      this.subscriptionStatus,
      this.paymentStatus,
      this.investID,
      this.investName,
      this.subscriptionUT,
      this.subscriptiontCost,
      this.remainingPayment,
      this.onTabDeduct,
      this.onTabtransfer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
          child: Text(
            'Please choose payment option',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        CustomMakePaymentCard(
            title: 'Deduct from CiC bonus',
            imageUrl: 'assets/images/svgfile/deduct.svg',
            onTab: () => onTabDeduct!()),
        CustomMakePaymentCard(
          title: 'Transfer to CiC’s bank account',
          imageUrl: 'assets/images/svgfile/payment.svg',
          onTab: () => onTabtransfer!(),
        )
      ],
    );
  }
}
