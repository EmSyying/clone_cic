import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
      decoration: BoxDecoration(
          // boxShadow: const [
          //   BoxShadow(
          //       offset: Offset(1.0, 0.0), color: Colors.black12, blurRadius: 6)
          // ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color(0XFFAFAFAF).withAlpha(75), width: 0.5),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'CiC Equity Fund',
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 16,
                    color: Color(0xff0A0B09)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/images/svgfile/totalShare.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total UT',
                          style: Get.theme.brightness == Brightness.light
                              ? TextStyle(
                                  color: Colors.grey[500],
                                  fontFamily: 'DMSans',
                                  fontSize: 14.0)
                              : const TextStyle(
                                  color: Colors.white, fontFamily: 'DMSans'),
                        ),
                        isLoading!
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey[100]!,
                                highlightColor: Colors.white,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  height: 15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
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
                                    color: Color(0xff0A0B09),
                                    fontFamily: 'DM Sans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                      ],
                    )
                  ],
                ),
              ),
              SvgPicture.asset("assets/images/svgfile/investdivider.svg",
                  height: 50.0),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20.0),
                    SvgPicture.asset('assets/images/svgfile/totalNetworth.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total UT Price',
                          style: Get.theme.brightness == Brightness.light
                              ? TextStyle(
                                  color: Colors.grey[500], fontFamily: 'DMSans')
                              : const TextStyle(
                                  color: Colors.white, fontFamily: 'DMSans'),
                        ),
                        isLoading!
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey[100]!,
                                highlightColor: Colors.white,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  height: 15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
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
                                    color: Color(0xff0A0B09),
                                    fontFamily: 'DM Sans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTradingButton(
                    isBuying: true,
                    color: isLoading!
                        ? const Color(0xff75BF72).withAlpha(76)
                        : const Color(0xff75BF72).withAlpha(76),
                    title: 'Buy In',
                    onTap: isLoading! ? () {} : onBuy,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTradingButton(
                    isBuying: false,
                    title: 'Sell Out',
                    color: isLoading!
                        ? const Color(0XFFF54E5E).withAlpha(76)
                        : const Color(0XFFF54E5E).withAlpha(76),
                    onTap: isLoading! ? () {} : onSale,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
