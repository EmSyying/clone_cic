import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/helper/container_partern.dart';

class TradingSessionCard extends StatelessWidget {
  final bool? isLoading;
  final String? tradingstartDate;
  final String? tradingendDate;
  final bool? openMarket;
  final bool? isTap;
  final GestureTapCallback? onTap;

  final tradingCon = Get.put(InquiryController());
  TradingSessionCard({
    Key? key,
    this.onTap,
    this.tradingstartDate,
    this.tradingendDate,
    this.openMarket = false,
    this.isLoading = false,
    this.isTap = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: containerCiCPartern,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isLoading!
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[100]!,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 15,
                  ),
                )
              : openMarket == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.check_circle,
                            color: Color(0xff0685CF),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: const Text(
                            'Trading session is now opened',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xff0685CF),
                              fontFamily: 'DMSans',
                            ),
                          ),
                        ),
                        Container()
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/circle_outline_done.svg",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Text(
                            'Trading session will be open soon',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xffED1E26),
                              fontFamily: 'DMSans',
                            ),
                          ),
                        ),
                        Container()
                      ],
                    ),
          const SizedBox(
            height: 27,
          ),
          isLoading!
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[100]!,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 15,
                  ),
                )
              : const Text(
                  'Trading Date',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'DMSans',
                  ),
                ),
          const SizedBox(
            height: 6,
          ),
          isLoading!
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[100]!,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 15,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/tradingDate.svg",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      tradingstartDate! != "" ? tradingstartDate! : "--",
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff0A0B09),
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w100),
                    ),
                    Container()
                  ],
                ),
          const SizedBox(
            height: 20,
          ),
          isLoading!
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[100]!,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 15,
                  ),
                )
              : const Text(
                  'Trading Hours',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'DMSans',
                  ),
                ),
          const SizedBox(
            height: 6,
          ),
          isLoading!
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[100]!,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 15,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/trading(hour).svg",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      tradingendDate! != "" ? tradingendDate! : "--",
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff0A0B09),
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w100),
                    ),
                    Container()
                  ],
                ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'View Last Trading Info',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
