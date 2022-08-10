import 'package:cicgreenloan/modules/investment_module/model/share_price_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CiCLineChart extends StatelessWidget {
  final List<Evolution> dataList;
  const CiCLineChart({Key? key, this.dataList = const []}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        tooltipBehavior: TooltipBehavior(borderColor: Colors.red),
        plotAreaBorderColor: Colors.transparent,
        primaryXAxis: CategoryAxis(
            axisLine: AxisLine(color: Theme.of(context).primaryColor),
            majorGridLines: const MajorGridLines(color: Colors.transparent)),
        primaryYAxis: NumericAxis(
            axisLine: AxisLine(color: Theme.of(context).primaryColor),
            majorGridLines: const MajorGridLines(
              dashArray: [10],
            )),
        // Chart title
        title: ChartTitle(text: ''),
        // Enable legend

        legend:
            Legend(borderWidth: 6, isVisible: true, borderColor: Colors.red),
        // Enable tooltip

        series: <LineSeries<Evolution, String>>[
          LineSeries<Evolution, String>(
            isVisibleInLegend: false,
            color: Theme.of(context).primaryColor,
            width: 2.5,
            markerSettings: MarkerSettings(
                isVisible: true,
                borderWidth: 2,
                shape: DataMarkerType.circle,
                borderColor: Theme.of(context).primaryColor),
            dataSource: dataList,
            xValueMapper: (Evolution sales, _) => sales.date,
            yValueMapper: (Evolution sales, _) => sales.price,
            // Enable data label
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )
        ]);
  }
}
