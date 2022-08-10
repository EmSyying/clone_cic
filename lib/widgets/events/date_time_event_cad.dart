import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/helper/container_partern.dart';

class DateTimeEventCard extends StatelessWidget {
  final String? title;
  final String? date;
  final String? imgUrl;
  final String? fromTime;
  final String? toTime;
  final bool isDate;
  const DateTimeEventCard(
      {Key? key,
      this.title,
      this.date,
      this.imgUrl,
      this.fromTime,
      this.toTime,
      this.isDate = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            "$title",
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'DMSans',
              fontSize: 14,
              //                                  fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 40.0,
          width: double.infinity,
          decoration: containerCiCPartern,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    isDate ? '$date' : '$fromTime to $toTime',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSans',
                      fontSize: 12,
                      //                                        fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(imgUrl!)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
