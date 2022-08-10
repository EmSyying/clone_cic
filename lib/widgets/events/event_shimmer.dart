import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/helper/container_partern.dart';

class EventShimmerCard extends StatelessWidget {
  const EventShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        eventShimmer(context),
        eventShimmer(context),
        eventShimmer(context),
        eventShimmer(context),
        eventShimmer(context),
        eventShimmer(context),
        eventShimmer(context),
      ],
    );
  }

  Widget eventShimmer(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
          height: 135.0,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 135.0,
                width: 135.0,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(borderRaduis),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 15,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(borderRaduis),
                      ),
                      margin: const EdgeInsets.only(
                          top: 10, left: 10.0, right: 15.0),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10.0, right: 20.0, left: 10.0),
                          height: 15,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(borderRaduis),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(borderRaduis),
                      ),
                      height: 15,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(borderRaduis),
                            ),
                            width: MediaQuery.of(context).size.width * 0.35,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                          ),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[300],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
