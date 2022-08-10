import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InvestTransactionCard extends StatelessWidget {
  const InvestTransactionCard(
      {Key? key,
      this.image,
      this.title,
      this.dateTime,
      this.status,
      this.currency})
      : super(key: key);
  final String? image;
  final String? title;
  final String? dateTime;
  final String? status;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.grey[200]!),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.withOpacity(0.3),
            ),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: SvgPicture.asset(
                '$image',
                color: Colors.green,
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '...',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 5),
              Text(
                dateTime ?? '',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                status ?? '',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 12,
                      color: status!.toUpperCase() == 'UNPAID' ||
                              status!.toUpperCase() == 'UNACCRUED'
                          ? Colors.red
                          : Colors.green,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                currency ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
