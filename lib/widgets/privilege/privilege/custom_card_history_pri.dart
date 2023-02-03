import 'package:flutter/material.dart';

import '../../../Utils/helper/color.dart';

class CustomCardHistoryPri extends StatelessWidget {
  final String? shopName;
  final String? code;
  final String? amount;
  final String? paymentDate;
  final String? image;

  const CustomCardHistoryPri(
      {Key? key,
      this.shopName,
      this.code,
      this.amount,
      this.paymentDate,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 104,
      decoration: BoxDecoration(
        color: AppColor.arrowforwardColor['dark'],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600]!.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 84,
            height: 84,
            padding: const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image ?? ''),
                )),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: Text(
                      shopName ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    paymentDate ?? '',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff848F92),
                          fontSize: 10,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        amount ?? '',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 53,
                        height: 18,
                        decoration: BoxDecoration(
                          color:
                              AppColor.statusColor['pending']!.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 12),
                          child: Text(
                            code ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: AppColor.statusColor['pending'],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
