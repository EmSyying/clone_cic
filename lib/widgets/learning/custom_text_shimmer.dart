import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomTextShimmer extends StatelessWidget {
  final double? width;
  const CustomTextShimmer({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 10,
          width: width ?? MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        ));
  }
}
