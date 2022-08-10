import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/helper/container_partern.dart';

class TradingSessionShimmerCard extends StatelessWidget {
  const TradingSessionShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: containerCiCPartern,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
