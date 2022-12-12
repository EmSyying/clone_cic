import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/helper/container_partern.dart';

class FeatureShimmer extends StatelessWidget {
  const FeatureShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 45.0, right: 20.0, bottom: 10, left: 3),
          child: SizedBox(
            height: 225.0,
            width: 290.0,
            // decoration: containerCiCPartern,
            child: Padding(
              padding: const EdgeInsets.only(top: 130.0, left: 15.0),
              child: Shimmer.fromColors(
                enabled: true,
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(borderRaduis),
                      ),
                      margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                    ),
                    Container(
                      height: 15,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(borderRaduis),
                      ),
                      margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(borderRaduis),
                            ),
                            margin:
                                const EdgeInsets.only(top: 10.0, right: 10.0),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(borderRaduis),
                            ),
                            margin:
                                const EdgeInsets.only(top: 10.0, right: 10.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 115.0,
          left: 20.0,
          right: 20.0,
          child: Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.white,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(borderRaduis),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
