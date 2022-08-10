import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomCircleChart extends StatefulWidget {
  final int? numberPage;
  final bool isDebtInvestment;
  final bool? isFIF;
  const CustomCircleChart(
      {Key? key,
      this.numberPage,
      this.isDebtInvestment = false,
      this.isFIF = false})
      : super(key: key);

  @override
  State<CustomCircleChart> createState() => _CustomCircleChartState();
}

class _CustomCircleChartState extends State<CustomCircleChart> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 35,
      width: 35,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
            interval: 2,
            startAngle: -90,
            endAngle: 270,
            showTicks: false,
            showLabels: false,
            axisLineStyle: const AxisLineStyle(
              thickness: 3.5,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                  value: widget.isDebtInvestment
                      ? widget.numberPage! / 4 * 100
                      : widget.isFIF!
                          ? widget.numberPage! / 2 * 100
                          : widget.numberPage! / 3 * 100,
                  width: 3.5,
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
                          '${widget.numberPage}/ ${widget.isDebtInvestment ? "4" : widget.isFIF! ? "2" : "3"}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  angle: 360,
                  positionFactor: 0.12)
            ])
      ]),
    ));
  }
}
