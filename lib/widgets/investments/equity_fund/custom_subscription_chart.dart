import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../Utils/function/format_to_k.dart';
import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/format_number.dart';
import 'chart_tooltip_painter.dart';

class UTsubscriptionChart extends StatefulWidget {
  final ValueChanged<ChartPointDetails>? onSelected;
  final List? listData;
  const UTsubscriptionChart({
    Key? key,
    this.onSelected,
    this.listData,
  }) : super(key: key);

  @override
  State<UTsubscriptionChart> createState() => _UTsubscriptionChartState();
}

class _UTsubscriptionChartState extends State<UTsubscriptionChart> {
  final List<_ChartData> _chartData = [
    _ChartData(2018, 5000, 1400),
    _ChartData(2019, 3600, 1200),
    _ChartData(2020, 2800, 6300),
    _ChartData(2021, 2350, 1330),
    _ChartData(2022, 4000, 1345),
    _ChartData(2023, 0000, 2455),
  ];

  double currentPoint = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backgroundColor,
      padding: const EdgeInsets.only(top: 30),
      child: SfCartesianChart(
          // enableAxisAnimation: true,
          onPlotAreaSwipe: (v) {
            debugPrint('Work ==> ${v.index}');
          },
          plotAreaBorderWidth: 0,
          margin: EdgeInsets.zero,
          zoomPanBehavior: ZoomPanBehavior(
            zoomMode: ZoomMode.x,
            enablePanning: true,
          ),
          onChartTouchInteractionMove: (v) {
            if (v.position.direction.isInfinite) {
              debugPrint('====>');
            }
          },

          ///
          primaryXAxis: _primaryXAxis(),

          ///
          primaryYAxis: _primaryYAxis(context),

          ///ToolTip
          tooltipBehavior: TooltipBehavior(
            opacity: 0,
            elevation: 0,
            animationDuration: 500,
            shouldAlwaysShow: true,
            enable: true,
            builder: (a, b, c, d, e) {
              var bb = b as CartesianChartPoint;

              debugPrint('Tap ${bb.labelFillRect}');

              double currentpoint =
                  bb.markerPoint != null ? bb.markerPoint!.x : 0;
              double maxChange = 25;
              double minValue = 34;
              // double toolTipsMove = 20;
              double currentPointPercent =
                  1 - (currentpoint - minValue) / maxChange;
              debugPrint('Tap ${bb.region}');
              debugPrint('Tap ${bb.open}');

              currentPoint = currentpoint < 59 ? -currentPointPercent * 20 : 0;

              debugPrint(
                  'Tap Point $currentPoint percent $currentPointPercent %');
              debugPrint('$a $b $c $d $e');

              // debugPrint('Tap ${bb.markerPoint!.x}');

              return CustomPaint(
                painter: ChartToolTipPainter(
                    moto: currentPoint,
                    atemplateLocation:
                        Offset(bb.markerPoint!.x, bb.markerPoint!.y)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 17, left: 10, right: 10, top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$ ${a.price != 0 ? FormatNumber.formatNumberDefualt(a.price) : '0'}',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                            fontSize: 13),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${a.y != 0 ? FormatNumber.formatNumberDefualt(a.y) : '0'} UT',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.darkColor,
                            fontSize: 11),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          ///
          // selectionGesture: ActivationMode.doubleTap,
          series: _getColumnSeries()),
    );
  }

  TextStyle _axisLabelStyle() => Theme.of(context)
      .textTheme
      .subtitle2!
      .copyWith(color: AppColor.chartLabelColor, fontSize: 10);

  NumericAxis _primaryYAxis(BuildContext context) {
    return NumericAxis(
      axisLabelFormatter: (details) => ChartAxisLabel(
        FormatToK.convertNumber(int.tryParse(details.text.replaceAll(',', ''))),
        _axisLabelStyle(),
      ),
      // numberFormat: NumberFormat('#,## UT'),
      maximum: 6000,
      majorTickLines: const MajorTickLines(color: Colors.transparent),
      axisLine: const AxisLine(width: 0),
    );
  }

  CategoryAxis _primaryXAxis() {
    return CategoryAxis(
      labelStyle: _axisLabelStyle(),
      majorGridLines: const MajorGridLines(width: 0),
      majorTickLines: const MajorTickLines(size: 16, width: 0),
      visibleMaximum: 4,
    );
  }

  /// Get the column series
  List<ColumnSeries<_ChartData, num>> _getColumnSeries() {
    return <ColumnSeries<_ChartData, num>>[
      ColumnSeries<_ChartData, num>(
        dataSource: _chartData,
        enableTooltip: true,

        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,

        ///

        dataLabelMapper: (data, _) =>
            '${FormatNumber.formatNumberDefualt(data.y).toString().replaceAll('-', '')} UT',

        dataLabelSettings: _dataLabelSettings(),
        width: 0.2,

        gradient: _chartGradient(),
        borderRadius: _chartBorderRadius,

        onPointTap: (detail) {
          if (widget.onSelected != null) {
            widget.onSelected!(detail);
          }
        },

        ///
        // onCreateRenderer: (ChartSeries<_ChartData, num> series) {
        //   return _CustomColumnSeriesRenderer();
        // },
        ///
        /*selectionBehavior: SelectionBehavior(
          enable: true,
          toggleSelection: true,
          selectedColor: const Color(0xff003C90),
          unselectedColor: const Color(0xff003C90),
        ),*/
      )
    ];
  }

  final BorderRadius _chartBorderRadius = BorderRadius.circular(50);

  LinearGradient _chartGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        const Color(0xff003C90),
        Colors.blue[700]!,
        // const Color(0xff1455A9),
      ],
    );
  }

  DataLabelSettings _dataLabelSettings() {
    return DataLabelSettings(
      isVisible: true,
      textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
          color: AppColor.darkColor, fontSize: 10, fontWeight: FontWeight.w700),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.price);
  final int x;
  final num y;
  final int price;
}

///Custom paint for Future Usage
// class _CustomColumnSeriesRenderer extends ColumnSeriesRenderer {
//   _CustomColumnSeriesRenderer();

//   @override
//   ChartSegment createSegment() {
//     return _ColumnCustomPainter();
//   }
// }

// class _ColumnCustomPainter extends ColumnSegment {
//   @override
//   void onPaint(Canvas canvas) {
//     double x, y;

//     x = segmentRect.center.dx;
//     y = segmentRect.top;

//     ///
//     final Paint paint = Paint()
//       ..shader = ui.Gradient.linear(
//         const Offset(0, 0),
//         Offset(0, segmentRect.bottom),
//         <Color>[
//           const Color(0xff003C90),
//           Colors.blue[700]!,
//           // const Color(0xff1455A9),
//         ],
//       )
//       ..style = PaintingStyle.fill;

//     final double factor = segmentRect.height * (1 - animationFactor);

//     ///
//     Rect rect = Rect.fromLTWH(
//         x - 5, y + factor, 10, segmentRect.bottom - factor - segmentRect.top);

//     canvas.drawRRect(
//         RRect.fromRectAndRadius(rect, const Radius.circular(15.0)), paint);
//   }
// }
