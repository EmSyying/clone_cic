import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInterestSummary extends StatelessWidget {
  final String? titleDate, date, time;
  final int? selectedIndex;
  final int? currenctIndex;
  const CustomInterestSummary(
      {Key? key,
      this.selectedIndex,
      this.currenctIndex,
      this.titleDate,
      this.date,
      this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 3),
            child: SvgPicture.asset(selectedIndex == currenctIndex
                ? 'assets/images/svgfile/check_select_right.svg'
                : 'assets/images/svgfile/check_right.svg'),
          ),
          Text(
            '$titleDate',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 14),
          ),
          Expanded(
            child: Text(
              '$date',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ),
          Text(
            '$time',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
