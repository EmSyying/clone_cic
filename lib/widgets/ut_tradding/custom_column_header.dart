import 'package:cicgreenloan/modules/ut_trading/models/detail_model.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_cell_row.dart';

import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class CustomColumnHeader extends StatelessWidget {
  final List<PayOffSlip>? transactionDetailList;
  const CustomColumnHeader({Key? key, required this.transactionDetailList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              flex: 3,
              child: Text(
                "Quantity(UT)",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "Price",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                "Amount",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        const Divider(
          height: 1,
        ),
        Column(
            children: transactionDetailList!
                .map((e) => CustomerCellRow(dataRow: e))
                .toList()),
        const SizedBox(height: 10.0),
        const Divider(
          height: 1,
        )
      ],
    );
  }
}
