import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TransactionHistoryTemplate extends StatelessWidget {
  final String? dated;
  final String? amount;
  final String? image;
  final String? title;
  final String? amountColorType;
  final String? defaultImage;
  final int? id;
  final Color? backgroundColor;
  const TransactionHistoryTemplate({
    super.key,
    this.dated,
    this.amount,
    this.image,
    this.title,
    this.amountColorType,
    this.id,
    this.defaultImage,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
      child: Row(children: [
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: backgroundColor,
            color: Color(0xfff5f5f0),
          ),
          clipBehavior: Clip.hardEdge,
          child: image != null
              ? CachedNetworkImage(
                  imageUrl: image ?? '',
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Text(
                    defaultImage ?? ' ',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                        ),
                  ),
                ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              dated ?? '',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          amount ?? '',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 12,
                color:
                    amountColorType == "Cash Out" ? Colors.red : Colors.green,
                fontWeight: FontWeight.w500,
              ),
        ),
      ]),
    );
  }
}
