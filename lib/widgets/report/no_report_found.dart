import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoReportFound extends StatelessWidget {
  const NoReportFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/svgfile/noReportFound.svg'),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'No Document Found',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Here’s where you’ll find the newest',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        const Text(
          'report from our App.',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
