import 'package:flutter/material.dart';

Widget summeryLabel(BuildContext context, {String? label, String? value}) {
  return Padding(
    padding: const EdgeInsets.only(top: 17.0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label ?? '',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xff464646),
                ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.46,
            child: Text(
              value ?? "",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
              maxLines: 2,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}
