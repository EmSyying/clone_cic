import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class CustomCardGuestsTicket extends StatelessWidget {
  final String? guest;
  final String? nameGuest;
  final String? who;
  final bool isCheckBox;
  final GestureTapCallback? onTap;
  const CustomCardGuestsTicket({
    Key? key,
    this.guest,
    this.nameGuest,
    this.who,
    this.onTap,
    this.isCheckBox = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              guest ?? '',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Name',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: const Color(0xff464646),
                  ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              children: [
                Text(
                  nameGuest ?? '',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      ),
                ),
                const SizedBox(
                  height: 14,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 30,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  who ?? '',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        //===Check Box====
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color:
                    isCheckBox ? AppColor.mainColor : AppColor.chartLabelColor,
                width: 0.6,
              ),
              shape: BoxShape.rectangle,
              color:
                  isCheckBox ? AppColor.mainColor : Theme.of(context).cardColor,
            ),
            child: isCheckBox
                ? Center(
                    child: Icon(
                      Icons.done,
                      size: 16.0,
                      color: isCheckBox
                          ? AppColor.paymentBackgroundColor
                          : AppColor.chartLabelColor,
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
