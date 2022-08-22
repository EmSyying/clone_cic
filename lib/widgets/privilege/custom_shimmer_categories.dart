import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCategories extends StatelessWidget {
  const CustomShimmerCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          customShimmerAllCategories(context),
          customShimmerAllCategories(context),
          customShimmerAllCategories(context),
        ],
      ),
    );
  }

  Widget customShimmerAllCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[100]!,
          highlightColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
