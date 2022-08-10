import 'package:cicgreenloan/widgets/ut_tradding/custom_last_trading_info.dart';
import 'package:flutter/material.dart';

class LastTradingCard extends StatelessWidget {
  LastTradingCard(
      {Key? key,
      this.borderType,
      this.title,
      this.color,
      this.price,
      this.isPrice = false})
      : super(key: key);
  final bool isTap = false;
  final BorderType? borderType;
  final controller = PageController(initialPage: 1);
  final String? title;
  final num? price;
  final Color? color;
  final bool? isPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          // height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 65,
                height: 30,
                child: Text(
                  title!,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 11, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: color!.withOpacity(0.09)),
                width: double.infinity,
                height: 45,
                child: Row(
                  children: [
                    if (borderType == BorderType.BorderLeft ||
                        borderType == BorderType.All)
                      Container(
                        height: 50,
                        width: 4,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                      ),
                    Expanded(
                      child: Center(
                        child: isPrice == true
                            ? Text(
                                price != null ? '$price\$' : "0",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                              )
                            : Text(
                                '$price',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                              ),
                      ),
                    ),
                    if (borderType == BorderType.BorderRight ||
                        borderType == BorderType.All)
                      Container(
                        height: double.infinity,
                        width: 4,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
