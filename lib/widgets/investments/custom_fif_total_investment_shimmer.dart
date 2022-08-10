import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/helper/container_partern.dart';

class CustomFIFTotalInvestmentShimmer extends StatelessWidget {
  const CustomFIFTotalInvestmentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      // width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: containerCiCPartern,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[100]!,
                      highlightColor: Colors.white,
                      child: SizedBox(
                        height: 105,
                        width: 105,
                        child: Transform.scale(
                          scale: 0.9,
                          child: const CircularProgressIndicator(
                            strokeWidth: 12,
                            value: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[100]!,
                      highlightColor: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey[100],
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[100]!,
                      highlightColor: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                      ),
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
