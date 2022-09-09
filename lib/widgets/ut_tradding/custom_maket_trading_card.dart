import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/widgets/ut_tradding/sub_min_max.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomMaketTradingCar extends StatelessWidget {
  const CustomMaketTradingCar(
      {Key? key,
      this.maximum,
      this.base,
      this.minimum,
      required this.isOpen,
      this.onViewLastTrading,
      this.fromTime,
      this.toTime})
      : super(key: key);
  final String? maximum;
  final String? base;
  final String? minimum;
  final bool isOpen;
  final String? fromTime;
  final String? toTime;
  final GestureTapCallback? onViewLastTrading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(1.0, 0.0), color: Colors.black12, blurRadius: 6)
        ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.mainColor),
        color: const Color(0XFF0F50A4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/svgfile/CalendarUT.svg',
                  fit: BoxFit.fill,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            FormatDate.displayDayOnly(
                                DateTime.now().toString()),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1.0, 0.0),
                                  color: Colors.black12,
                                  blurRadius: 6)
                            ],
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: AppColor.mainColor),
                            color: isOpen == true
                                ? const Color(0XFF0685CF)
                                : const Color(0XFFF54E5E),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 2.0, bottom: 2.0),
                            child: Text(
                              isOpen == true
                                  ? "Trading Open"
                                  : "Trading Closed",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 12.0),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                      child: Row(
                        children: [
                          Text(
                            FormatDate.investmentDateDisplay(
                                DateTime.now().toString()),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 12.0),
                          ),
                          if (fromTime != "" && toTime != "")
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 6.0, right: 6.0),
                              height: 10.0,
                              width: 1.0,
                              color: const Color(0XFFAFAFAF),
                            ),
                          if (fromTime != "" && toTime != "")
                            Text(
                              "$fromTime - $toTime",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 12.0),
                            ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: minimum == null
                    ? const SubMinMax(
                        title: "Minimum",
                        price: '--',
                      )
                    : SubMinMax(
                        title: "Minimum",
                        price: isOpen == true ? minimum : '--',
                      ),
              ),
              Container(
                height: 28.0,
                width: 1.0,
                color: const Color(0XFFAFAFAF),
              ),
              Expanded(
                child: base == null
                    ? const SubMinMax(
                        title: "Base",
                        price: "--",
                      )
                    : SubMinMax(
                        title: "Base",
                        price: isOpen == true ? base : '--',
                      ),
              ),
              Container(
                height: 28.0,
                width: 1.0,
                color: const Color(0XFFAFAFAF),
              ),
              Expanded(
                child: maximum == null
                    ? const SubMinMax(
                        title: "Maximum",
                        price: "--",
                      )
                    : SubMinMax(
                        title: "Maximum",
                        price: isOpen == true ? maximum : '--',
                      ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            height: 1.0,
            width: double.infinity,
            color: const Color(0XFFAFAFAF),
          ),
          GestureDetector(
            onTap: onViewLastTrading,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, left: 20.0, bottom: 12.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    "View Last Trading",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14.0),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 14,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
