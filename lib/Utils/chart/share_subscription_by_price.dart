import 'package:cicgreenloan/modules/investment_module/model/share_subcription_by_price.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class CiCBarChartByPrice extends StatelessWidget {
  final List<ShareSubscriptionByPrices>? dataList;
  final Color? barColor;

  const CiCBarChartByPrice({Key? key, this.dataList, this.barColor})
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
            decimalDigits: 1,
            // locale: 'en_In',
          ),
          axisLine: AxisLine(color: Theme.of(context).primaryColor),
          majorGridLines: const MajorGridLines(
            dashArray: [10],
          )),
      series: <ChartSeries>[
        ColumnSeries<ShareSubscriptionByPrices, String>(
          color: barColor,
          width: 0.1,
          dataSource: dataList!,
          xValueMapper: (ShareSubscriptionByPrices sales, _) =>
              sales.price.toString(),
          yValueMapper: (ShareSubscriptionByPrices sales, _) =>
              sales.numberShare,
        )
      ],
    );
  }
}
