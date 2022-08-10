import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InformationShimmer extends StatelessWidget {
  const InformationShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              height: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}
