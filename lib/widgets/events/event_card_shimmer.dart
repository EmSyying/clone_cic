import 'package:flutter/material.dart';

import '../../Utils/helper/container_partern.dart';

class EventCardShimmer extends StatelessWidget {
  const EventCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      width: double.infinity,
      decoration: containerCiCPartern,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: Colors.grey[100],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 135.0,
                width: 90.0,
                color: Colors.grey[100],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.grey[100],
                      margin: const EdgeInsets.only(top: 15.0, left: 10.0),
                      child: Text(
                        '',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Colors.grey[100],
                    ),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Colors.grey[100],
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Colors.grey[100],
                    ),
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
