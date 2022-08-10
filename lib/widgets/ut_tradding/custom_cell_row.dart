import 'package:cicgreenloan/modules/ut_trading/models/detail_model.dart';
import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';
import '../../Utils/helper/format_number.dart';

class CustomerCellRow extends StatelessWidget {
  final PayOffSlip? dataRow;
  const CustomerCellRow({Key? key, this.dataRow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                dataRow!.quantity!.toString(),
                style: const TextStyle(
                    color: AppColor.textColor,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                '\$${FormatNumber.formatNumber(dataRow!.price!)}',
                style: const TextStyle(
                    color: AppColor.textColor,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                '\$${FormatNumber.formatNumber(dataRow!.total!)}',
                style: const TextStyle(
                    color: AppColor.textColor,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
