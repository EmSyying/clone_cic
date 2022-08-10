import 'package:cicgreenloan/modules/investment_module/model/share_balance_by_year.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class CiCBarChartTradeByYear extends StatelessWidget {
  final List<ShareBalanceByYears>? dataList;
  final Color? barColor;

  const CiCBarChartTradeByYear({Key? key, this.dataList, this.barColor})
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
        ColumnSeries<ShareBalanceByYears, String>(
          color: barColor,
          width: 0.1,
          dataSource: dataList!,
          xValueMapper: (ShareBalanceByYears sales, _) => sales.year.toString(),
          yValueMapper: (ShareBalanceByYears sales, _) => sales.numberShare,
        ),
      ],
    );
  }
}
