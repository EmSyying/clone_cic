import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/helper/container_partern.dart';
import '../../Utils/helper/format_number.dart';
import 'custom_buy_sale_button.dart';

class CustomFunCard extends StatelessWidget {
  final bool? isLoading;
  final num? utPrice;
  final num? totalPrice;
  final VoidCallback? onBuy;
  final VoidCallback? onSale;
  const CustomFunCard(
      {Key? key,
      this.utPrice,
      this.totalPrice,
      this.onBuy,
      this.onSale,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: containerCiCPartern,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/svgfile/inquiryFun.svg',
                height: 20,
                width: 20,
              ),
              // Icon(Icons.person),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'CiC Equity Fund',
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff0A0B09)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total UT',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    isLoading!
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[100]!,
                            highlightColor: Colors.white,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 15,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )
                        : Text(
                            utPrice == null
                                ? '0.00'
                                : '${FormatNumber.formatNumberDefualt(utPrice!)}',
                            style: const TextStyle(
                                color: Color(0xffED1E26),
                                fontFamily: 'DM Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CustomTradingButton(
                        color:
                            isLoading! ? Colors.grey : const Color(0xff75BF72),
                        title: 'Buy In',
                        onTap: isLoading! ? () {} : onBuy,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      isLoading!
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[100]!,
                              highlightColor: Colors.white,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 15,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          : Text(
                              totalPrice == null
                                  ? '\$0.00'
                                  : '\$${FormatNumber.formatNumber(totalPrice!)}',
                              style: const TextStyle(
                                  color: Color(0xffED1E26),
                                  fontFamily: 'DM Sans',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CustomTradingButton(
                          title: 'Sell Out',
                          color: isLoading!
                              ? Colors.grey
                              : const Color(0xffED1E26),
                          onTap: isLoading! ? () {} : onSale,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
