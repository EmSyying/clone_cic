import 'package:cicgreenloan/modules/investment_module/model/share_subscription_by_year.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class CiCBarChartByYear extends StatelessWidget {
  final List<ShareSubscriptionByYears>? dataList;
  final Color? barColor;

  const CiCBarChartByYear({Key? key, this.dataList, this.barColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
          axisLine: AxisLine(color: Theme.of(context).primaryColor),
          majorGridLines: const MajorGridLines(color: Colors.transparent)),
      primaryYAxis: NumericAxis(
          numberFormat: NumberFormat.compactCurrency(
            symbol: '',
            decimalDigits: 0,
            // locale: 'en_In',
          ),
          axisLine: AxisLine(color: Theme.of(context).primaryColor),
          majorGridLines: const MajorGridLines(
            dashArray: [10],
          )),
      series: <ChartSeries>[
        ColumnSeries<ShareSubscriptionByYears, String>(
          color: barColor,
          width: 0.1,
          dataSource: dataList!,
          xValueMapper: (ShareSubscriptionByYears sales, _) =>
              sales.year.toString(),
          yValueMapper: (ShareSubscriptionByYears sales, _) =>
              sales.numberShare,
        ),
      ],
    );
  }
}
