import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomAboutCICShimmer extends StatelessWidget {
  const CustomAboutCICShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 15.5, bottom: 10.0, top: 10.0),
              height: 50,
              width: 60,
              color: Colors.grey.shade400,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5.0,
                    width: 250.0,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 5.0,
                    width: 50.0,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
