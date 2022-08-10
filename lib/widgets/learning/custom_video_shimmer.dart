import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomVideoShimmer extends StatelessWidget {
  const CustomVideoShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customShimmer(context),
          customShimmer(context),
          customShimmer(context),
          customShimmer(context),
          customShimmer(context),
          customShimmer(context),
          customShimmer(context),
          customShimmer(context),
          customShimmer(context),
        ],
      ),
    );
  }
}
//==

Widget customShimmer(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[100]!,
          highlightColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            height: 60,
            width: 60,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[100]!,
              highlightColor: Colors.white,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 15,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[100]!,
              highlightColor: Colors.white,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 15,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
