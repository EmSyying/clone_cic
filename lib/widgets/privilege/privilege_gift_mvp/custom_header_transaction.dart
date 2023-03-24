import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget headerCardGiftTemplate(
  BuildContext context, {
  String? titleGiftTemplate,
  String? acountNumGiftTemplate,
  int? id,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment(0.8, 1),
              colors: [
                Color(0xff3588E8),
                Color(0xff384593),
              ]),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/images/privilege/transfer_icon.svg',
        ),
      ),
      const SizedBox(
        width: 10.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleGiftTemplate ?? '',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            acountNumGiftTemplate ?? '',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    ],
  );
}
