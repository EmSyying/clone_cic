import 'package:flutter/material.dart';
import '../../Utils/helper/color.dart';

class CustomContractTransaction extends StatelessWidget {
  final String? title;
  final String? date;
  final String? amount;
  final String? type;
  final String? contractCode;
  final Color? color;
  const CustomContractTransaction(
      {Key? key,
      this.color,
      this.title,
      this.date,
      this.amount,
      this.type,
      this.contractCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final fifController = Get.put(PriceController());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 0.0), color: Colors.black12, blurRadius: 2)
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          color: Colors.white),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: Colors.black12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                contractCode ?? date!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Text(
            amount ?? '',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 14,
                color: color ??
                    (type != 'deduction'
                        ? AppColor.statusColor["nextPayment"]
                        : AppColor.statusColor["late"]),
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
