import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../modules/wallet/model/exchange_point_transaction.dart/recent_activities.dart';

class CustomRecentCard extends StatelessWidget {
  final RecentActivities? recentActivities;

  const CustomRecentCard({super.key, this.recentActivities});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 0),
              spreadRadius: 3,
              blurRadius: 5,
              color: Colors.grey[200]!),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: double.infinity,
                margin: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 10, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    recentActivities!.shopLogo ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 180,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recentActivities!.shopName ?? "",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                Text(
                  recentActivities!.date ?? "",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  recentActivities!.amount ?? '',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Text(
                  recentActivities!.code ?? "",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffF9D423), Color(0xffE65C00)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      recentActivities!.pointAmount != null
                          ? recentActivities!.pointAmount.toString()
                          : "",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      'assets/images/svgfile/Union.svg',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
