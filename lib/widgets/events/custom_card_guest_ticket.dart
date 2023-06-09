import 'package:flutter/material.dart';

class CustomCardGuestsTicket extends StatelessWidget {
  final String? guest;
  final String? nameGuest;
  final String? who;
  final bool isCheckBox;
  final GestureTapCallback? onTapSelect;
  final String? viewTicket;
  const CustomCardGuestsTicket({
    Key? key,
    this.guest,
    this.nameGuest,
    this.who,
    this.onTapSelect,
    this.isCheckBox = false,
    this.viewTicket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                guest ?? '',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        //===Check Box====
        if (viewTicket != null)
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GestureDetector(
              onTap: onTapSelect,
              child: isCheckBox
                  ? Icon(
                      Icons.check_box_rounded,
                      color: Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.grey[400],
                    ),
            ),
          ),
      ],
    );
  }
}
