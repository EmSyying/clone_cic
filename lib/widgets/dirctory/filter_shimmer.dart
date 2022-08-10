import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class FilterShimmer extends StatelessWidget {
  const FilterShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(blurRadius: 2, color: Colors.black12)
                ]),
            child: Container(
              height: 20,
              width: double.infinity,
              color: Colors.grey[100],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 150.0,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(blurRadius: 2, color: Colors.black12)
                ]),
            child: Container(
              height: 20,
              width: double.infinity,
              color: Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }
}
