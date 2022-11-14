import 'package:flutter/material.dart';

class CustomTitleEventCheckIn extends StatelessWidget {
  final String? title;
  final String? descript;
  const CustomTitleEventCheckIn({
    Key? key,
    this.title,
    this.descript,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final contro = Get.put(EventController());
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: const Color(0xff464646),
                ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            descript ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                ),
          ),
        ],
      ),
    );
  }
}
