import 'package:cicgreenloan/Utils/chart/circle_chart_ut.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import '../../Utils/helper/format_number.dart';

class ShareRequestedCard extends StatelessWidget {
  final String? type;
  final String? shareRequestTitle;
  final String? shareRequestValue;
  final String? shareTradedValue;
  final String? shareTradedTitle;
  final String? tradingDate;
  final num? avgSharePrice;
  final num? utPrice;
  const ShareRequestedCard(
      {Key? key,
      this.shareRequestTitle,
      this.avgSharePrice,
      this.shareRequestValue,
      this.shareTradedTitle,
      this.shareTradedValue,
      this.tradingDate,
      this.type,
      this.utPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.80),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1.0, 1.0), blurRadius: 3, color: Colors.black12)
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '$shareRequestTitle',
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '$shareRequestValue',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                ),
                if (type == 'Submitted')
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'UT Price',
                      style: type != 'Submitted'
                          ? TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.7))
                          : const TextStyle(color: Colors.black54),
                    ),
                  ),
                if (type == 'Submitted')
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      '\$${FormatNumber.formatNumber(utPrice!)}',
                      style: type != 'Submitted'
                          ? TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).primaryColor)
                          : const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    '$shareTradedTitle',
                    style: type != 'Submitted'
                        ? TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.7))
                        : const TextStyle(color: Colors.black54),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '$shareTradedValue',
                    style: type != 'Submitted'
                        ? TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).primaryColor)
                        : const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                ),
                if (shareRequestValue != shareTradedValue &&
                    type != 'Submitted')
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'UT Unmatched',
                      style: TextStyle(
                          color: const Color(0xffE28112).withOpacity(0.7)),
                    ),
                  ),
                if (shareRequestValue != shareTradedValue &&
                    type != 'Submitted')
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      '${int.parse(shareRequestValue!) - int.parse(shareTradedValue!)}',
                      style: const TextStyle(
                          color: Color(0xffE28112),
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
              ]),
              const Spacer(),
              Expanded(
                child: CircleUTChart(
                  shareRequestPrice: shareRequestValue != null
                      ? double.parse(shareRequestValue!.toString())
                      : 0,
                  shareTrade: shareTradedValue != null
                      ? double.parse(shareTradedValue!.toString())
                      : 0,
                  isUnmatch: type == 'Matched' &&
                      shareRequestValue != shareTradedValue,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/svgfile/calender.svg'),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Trading Date: $tradingDate',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          if (type == 'Matched')
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/svgfile/currency.svg'),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Avg UT Price: USD ${FormatNumber.formatNumber(avgSharePrice!)}/UT',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
        ]),
      ),
    );
  }
}
