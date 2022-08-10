import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircleUTChart extends StatefulWidget {
  final double? shareRequestPrice;
  final double? shareTrade;
  final bool? isUnmatch;
  const CircleUTChart(
      {Key? key, this.shareRequestPrice, this.shareTrade, this.isUnmatch})
      : super(key: key);

  @override
  State<CircleUTChart> createState() => _CircleUTChartState();
}

class _CircleUTChartState extends State<CircleUTChart> {
  double? remainDurationpercent;
  double? feeOutstandig = 0;
  double? completeDurationPercent;
  num? amountPaidAble;

  double? duration;
  double? remainDucation;

  double? value;
  @override
  void initState() {
    super.initState();
    setState(() {
      value = (widget.shareTrade! * 100) / widget.shareRequestPrice!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 100,
      width: 100,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
            interval: 10,
            startAngle: 0,
            endAngle: 360,
            showTicks: false,
            showLabels: false,
            axisLineStyle: AxisLineStyle(
                thickness: 10,
                color: widget.isUnmatch == true
                    ? const Color(0xffE28112).withOpacity(0.7)
                    : null),
            pointers: <GaugePointer>[
              RangePointer(
                  value: value!,
                  width: 10,
                  color: Theme.of(context).primaryColor,
                  enableAnimation: true,
                  cornerStyle: CornerStyle.bothFlat)
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          '${FormatNumber.formatPercentage(value!)}%',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        'Matched',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  angle: 270,
                  positionFactor: 0.1)
            ])
      ]),
    ));
  }
}
