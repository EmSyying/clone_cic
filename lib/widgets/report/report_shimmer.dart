import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReportShimmer extends StatelessWidget {
  const ReportShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 10),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1.0, 0.0),
                    color: Colors.black12,
                    blurRadius: 4)
              ]),
          width: 330,
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100]),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.8,
                        color: Colors.grey[100],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.5,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                ),
              ),
              // Icon(
              //   Icons.arrow_forward_ios,
              //   color: Colors.grey[100],
              //   size: 18,
              // ),
              // SizedBox(
              //   width: 10,
              // ),
            ],
          ),
        ));
  }
}
