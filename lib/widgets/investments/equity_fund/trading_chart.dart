import 'package:flutter/material.dart';

import '../../../Utils/helper/color.dart';
import 'chart_model.dart';
import 'custom_data_table.dart';
import 'custom_winlose_chart.dart';

class TradingChart extends StatelessWidget {
  const TradingChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                'Figure in Unit Trust',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              _buildSqarePoint(AppColor.primaryColor),
              Text(
                'Sell',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(width: 10),
              _buildSqarePoint(Theme.of(context).primaryColor),
              Text(
                'Buy',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: CustomWinLoseChart(
            onSelected: (v) {
              debugPrint('Hello ${v.x}');
            },
          ),
        ),
        const SizedBox(height: 20),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 30, right: 0),
          child: CustomDataTable(
            dataTable: tableData,
          ),
        ),
      ],
    );
  }

  Container _buildSqarePoint(Color color) => Container(
        width: 12,
        height: 12,
        margin: const EdgeInsets.only(right: 5),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
      );
}
