import 'package:cicgreenloan/modules/ut_trading/models/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CiCBarChartSharePriceBreakdown extends StatelessWidget {
  final List<PayOffSlip>? dataList;
  final Color? barColor;

  const CiCBarChartSharePriceBreakdown({Key? key, this.dataList, this.barColor})
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
        ColumnSeries<PayOffSlip, String>(
            color: barColor,
            width: 0.1,
            dataSource: dataList!,
            xValueMapper: (PayOffSlip sales, _) => sales.price.toString(),
            yValueMapper: (PayOffSlip sales, _) => sales.quantity!.toDouble()),
      ],
    );
  }
}
