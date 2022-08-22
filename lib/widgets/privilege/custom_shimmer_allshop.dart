import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerAllShop extends StatelessWidget {
  const CustomShimmerAllShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customShimmerCardAllStores(context),
          customShimmerCardAllStores(context),
          customShimmerCardAllStores(context),
          customShimmerCardAllStores(context),
          customShimmerCardAllStores(context),
          customShimmerCardAllStores(context),
        ],
      ),
    );
  }

  // Widget customShimmerRowStoresAndCatego(BuildContext context) {
  //   return Row(
  //     children: [
  //       Container(
  //         height: 10,
  //         width: MediaQuery.of(context).size.width * 0.3,
  //         color: Colors.grey[100],
  //       ),
  //       const Spacer(),
  //       Container(
  //         height: 10,
  //         width: MediaQuery.of(context).size.width * 0.3,
  //         color: Colors.grey[100],
  //       ),
  //     ],
  //   );
  // }

  Widget customShimmerCardAllStores(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      width: double.infinity,
      height: 100,
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
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[50],
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        height: 8,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        height: 8,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        height: 8,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        height: 8,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
