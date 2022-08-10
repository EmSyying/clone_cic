import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCardGetFunding extends StatelessWidget {
  const CustomShimmerCardGetFunding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customShimmerGetFunding(context),
          customShimmerGetFunding(context),
          customShimmerGetFunding(context),
          customShimmerGetFunding(context),
          customShimmerGetFunding(context),
          customShimmerGetFunding(context),
          customShimmerGetFunding(context),
          customShimmerGetFunding(context),
          customShimmerGetFunding(context),
        ],
      ),
    );
  }
}

Widget customShimmerGetFunding(BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[100],
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ));
}
