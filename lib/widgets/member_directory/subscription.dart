import 'package:cicgreenloan/modules/member_directory/models/subscription.dart';
import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/helper/format_number.dart';

class SubscriptionInformationCard extends StatelessWidget {
  final List<SubscriptionData>? subscriptionModel;
  final bool? isHide;
  final bool? isEditable;

  const SubscriptionInformationCard(
      {Key? key, this.subscriptionModel, this.isHide, this.isEditable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isHide != null && isHide!
        ? Container()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: Row(
                  children: [
                    const Text(
                      'Subscription Information',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    if (isEditable != null && isEditable!)
                      GestureDetector(
                          child: SvgPicture.asset(
                              'assets/images/svgfile/edit-3.svg'))
                  ],
                ),
              ),
              Column(
                children: subscriptionModel!.map((e) {
                  return SubsciptionItem(
                    numberofShare: e.numberOfShare!,
                    price: e.price!,
                    transactionDate: e.tractionDate!,
                  );
                }).toList(),
              )
            ],
          );
  }
}

class SubsciptionItem extends StatelessWidget {
  final num? numberofShare;
  final num? price;
  final String? transactionDate;
  const SubsciptionItem(
      {Key? key, this.numberofShare, this.price, this.transactionDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          MemberDisplayInfo(
            isLongLabel: true,
            label: 'Number of share:',
            value: FormatNumber.formatNumber(numberofShare!).toString(),
          ),
          MemberDisplayInfo(
            isLongLabel: true,
            label: 'Price:',
            value: '\$${FormatNumber.formatNumber(price!).toString()}',
          ),
          MemberDisplayInfo(
            label: 'Transaction Date:',
            value: transactionDate,
            isLongLabel: true,
          ),
        ],
      ),
    );
  }
}
