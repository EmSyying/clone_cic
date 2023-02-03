import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Utils/function/format_to_k.dart';
import '../../../Utils/helper/format_number.dart';

class CustomWinLoseChart extends StatefulWidget {
  final ValueChanged<dynamic>? onSelected;
  final List? listData;
  const CustomWinLoseChart({
    Key? key,
    this.onSelected,
    this.listData,
  }) : super(key: key);

  @override
  State<CustomWinLoseChart> createState() => _CustomWinLoseChartState();
}

class _CustomWinLoseChartState extends State<CustomWinLoseChart> {
  final List<_ChartData> _chartHighData = [
    _ChartData('Jun 21', 500, 1400),
    _ChartData('Aug 21', 2800, 6300),
    _ChartData('Sep 21', 2350, 1330),
    _ChartData('Oct 21', 14000, 1345),
    _ChartData('Nov 21', 0, 1345),
  ];
  final List<_ChartData> _chartLowData = [
    _ChartData('Jul 21', -3600, 1200),
    _ChartData('Sep 21', -4000, 1330),
    _ChartData('Nov 21', -1000, 2455),
  ];

  double currentPoint = 0.0;

  TooltipBehavior? _toolTip;
  toolTip(BuildContext context) {
    _toolTip = TooltipBehavior(
      header: 'Trading History',

      canShowMarker: true,
      // borderColor: Colors.red,
      borderWidth: 1,
      elevation: 2,
      color: const Color.fromARGB(82, 21, 102, 208),

      animationDuration: 500,
      shouldAlwaysShow: true,

      enable: true,
      // builder: (a, b, c, d, e) {
      //   return Container(
      //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(5),
      //       color: a.y > 0
      //           ? Theme.of(context).primaryColor
      //           : const Color(0xffED1E26),
      //     ),
      //     child: Text(
      //       '${a.y != 0 ? FormatNumber.formatNumberDefualt(a.y).toString().replaceAll('-', '') : '0'} UT',
      //       style: Theme.of(context).textTheme.titleSmall!.copyWith(
      //             fontWeight: FontWeight.w700,
      //             color: Colors.white,
      //             fontSize: 12,
      //           ),
      //     ),
      //   );
      // },
      // builder: (a, b, c, d, e) {
      //   var aa = a as _ChartData;
      //   var bb = b as CartesianChartPoint;
      //   if (widget.onSelected != null) {
      //     widget.onSelected!(a);
      //   }

      //   double currentpoint = bb.markerPoint != null ? bb.markerPoint!.x : 0;
      //   double maxChange = 25;
      //   double minValue = 34;
      //   // double toolTipsMove = 20;
      //   double currentPointPercent = 1 - (currentpoint - minValue) / maxChange;
      //   // debugPrint('Tap ${bb.region}');
      //   // debugPrint('Tap ${bb.open}');

      //   currentPoint = currentpoint < 59 ? -currentPointPercent * 20 : 0;

      //   // debugPrint('Tap Point $currentPoint percent $currentPointPercent %');
      //   // debugPrint('$a $b $c $d $e');

      //   // debugPrint('Tap ${bb.markerPoint!.x}');

      //   return CustomPaint(
      //     painter: ChartToolTipPainter(
      //         moto: currentPoint,
      //         backgroundColor:
      //             aa.y < 0 ? const Color(0xffED1E26).withOpacity(0.14) : null,
      //         strokeColor: aa.y < 0 ? const Color(0xffED1E26) : null),
      //     child: Padding(
      //       padding:
      //           const EdgeInsets.only(bottom: 12, left: 7, right: 7, top: 7),
      //       child: Text(
      //         '${a.y != 0 ? FormatNumber.formatNumberDefualt(a.y).toString().replaceAll('-', '') : '0'} UT',
      //         style: Theme.of(context).textTheme.titleSmall!.copyWith(
      //               fontWeight: FontWeight.w700,
      //               color: aa.y > 0
      //                   ? Theme.of(context).primaryColor
      //                   : const Color(0xffED1E26),
      //               fontSize: 10,
      //             ),
      //       ),
      //     ),
      //   );
      // },
    );
  }

  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    toolTip(context);
    return Container(
      height: 500,
      color: AppColor.backgroundColor,
      padding: const EdgeInsets.only(top: 30),
      child: SfCartesianChart(
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        zoomPanBehavior: ZoomPanBehavior(
          zoomMode: ZoomMode.x,
          enablePanning: true,
        ),

        ///
        primaryXAxis: _primaryXAxis(context),

        primaryYAxis: _primaryYAxis(context),
        onChartTouchInteractionDown: (v) {
          _toolTip!.hide();
        },
        enableMultiSelection: true,

        tooltipBehavior: _toolTip,
        // TooltipBehavior(
        //   header: 'Trading History',
        //   animationDuration: 500,
        //   shouldAlwaysShow: true,
        //   enable: true,
        //   color: Theme.of(context).primaryColor.withOpacity(0.5),

        //   // builder: (a, b, c, d, e) {
        //   //   return Container(
        //   //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //   //     decoration: BoxDecoration(
        //   //       borderRadius: BorderRadius.circular(5),
        //   //       color: a.y > 0
        //   //           ? Theme.of(context).primaryColor
        //   //           : const Color(0xffED1E26),
        //   //     ),
        //   //     child: Text(
        //   //       '${a.y != 0 ? FormatNumber.formatNumberDefualt(a.y).toString().replaceAll('-', '') : '0'} UT',
        //   //       style: Theme.of(context).textTheme.titleSmall!.copyWith(
        //   //             fontWeight: FontWeight.w700,
        //   //             color: Colors.white,
        //   //             fontSize: 12,
        //   //           ),
        //   //     ),
        //   //   );
        //   // },
        // ),

        onTooltipRender: (args) {
          // args.locationY = 1000;

          if (args.text!.contains('-')) {
            color = AppColor.newRedStatus;
          } else {
            color = Theme.of(context).primaryColor;
          }
        },

        ///
        palette: const [Colors.red, Colors.blue],
        selectionGesture: ActivationMode.singleTap,

        series: _getDefaultColumnSeries(),
      ),
    );
  }

  TextStyle _axisLabelStyle() => Theme.of(context)
      .textTheme
      .titleSmall!
      .copyWith(color: AppColor.chartLabelColor, fontSize: 10);

  CategoryAxis _primaryXAxis(BuildContext context) {
    return CategoryAxis(
      majorGridLines:
          const MajorGridLines(width: 0.2, color: Color(0xffB9C1D9)),
      majorTickLines: const MajorTickLines(width: 0, size: 16),
      axisLine: const AxisLine(width: 0),
      visibleMaximum: 4,
      labelStyle: _axisLabelStyle(),
    );
  }

  NumericAxis _primaryYAxis(BuildContext context) {
    return NumericAxis(
      majorGridLines:
          const MajorGridLines(width: 0.2, color: Color(0xffB9C1D9)),
      majorTickLines: const MajorTickLines(width: 0, size: 2),
      axisLine: const AxisLine(width: 0.2, color: Color(0xffB9C1D9)),

      ///
      // maximum: 10000,
      // minimum: -9000,

      axisLabelFormatter: (details) => ChartAxisLabel(
        FormatToK.convertNumber(
          int.tryParse(
                details.text
                    .replaceAll(',', '')
                    .replaceAll('-', '')
                    .replaceAll('UT', ''),
              ) ??
              0,
        ),
        _axisLabelStyle(),
      ),

      numberFormat: NumberFormat('#,###'),
      labelFormat: '{value} UT',
    );
  }

  /// Get the column series
  List<ColumnSeries<_ChartData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<_ChartData, String>>[
      ColumnSeries(
        width: _chartWidth,
        dataSource: _chartHighData,
        enableTooltip: true,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        dataLabelMapper: (data, __) =>
            '${FormatNumber.formatNumberDefualt(data.y).toString().replaceAll('-', '')} UT',
        dataLabelSettings: _chartLabelStyle(),
        gradient: _highColorgradient(),

        borderRadius: _chartBorderRadius(),

        // onCreateRenderer: (ChartSeries<_ChartData, String> series) {
        //   return _CustomColumnSeriesRenderer(series);
        // },

        // selectionBehavior: SelectionBehavior(
        //   enable: true,
        //   toggleSelection: true,
        //   selectedColor: const Color(0xff003C90),
        //   unselectedColor: Colors.grey,
        // ),
      ),

      ///make space between chart
      ColumnSeries(
          width: 0,
          dataSource: [],
          xValueMapper: (_, __) => '',
          yValueMapper: (_, __) => 0),

      ///
      ColumnSeries(
        width: _chartWidth,
        dataSource: _chartLowData,
        enableTooltip: true,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        dataLabelMapper: (data, __) =>
            '${FormatNumber.formatNumberDefualt(data.y).toString().replaceAll('-', '')} UT',
        gradient: _lowColorGradient(),

        dataLabelSettings: _chartLabelStyle(),

        borderRadius: _chartBorderRadius(),

        // onCreateRenderer: (ChartSeries<_ChartData, String> series) {
        //   return _CustomColumnSeriesRenderer(series);
        // },

        // onCreateRenderer: (ChartSeries<_ChartData, num> series) {
        //   return _CustomColumnSeriesRenderer();
        // },
        // selectionBehavior: SelectionBehavior(
        //   enable: true,
        //   toggleSelection: true,
        //   selectedColor: const Color(0xffED1E26),
        //   unselectedColor: Colors.grey,
        // ),
      ),
    ];
  }

  final double _chartWidth = 0.6;

  BorderRadius _chartBorderRadius() => BorderRadius.circular(50);

  DataLabelSettings _chartLabelStyle() {
    return DataLabelSettings(
      textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: AppColor.darkColor, fontSize: 10, fontWeight: FontWeight.w700),
      isVisible: true,
    );
  }

  LinearGradient _lowColorGradient() {
    return const LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color(0xffED1E26),
        Color(0xffFF777F),
      ],
      // stops: [0, 1],
    );
  }

  LinearGradient _highColorgradient() {
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
}

class _ChartData {
  _ChartData(this.x, this.y, this.price);
  final String x;
  final num y;
  final int price;
}

// Custom paint for Future Usage
// class _CustomColumnSeriesRenderer extends ColumnSeriesRenderer {
//   final ChartSeries<_ChartData, String> data;
//   _CustomColumnSeriesRenderer(this.data);

//   @override
//   ChartSegment createSegment() {
//     return _ColumnCustomPainter(data);
//   }
// }

// class _ColumnCustomPainter extends ColumnSegment {
//   final ChartSeries<_ChartData, String> data;
//   _ColumnCustomPainter(this.data);
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
//         x + 15, y + factor, 10, segmentRect.bottom - factor - segmentRect.top);

//     canvas.drawRRect(
//         RRect.fromRectAndRadius(rect, const Radius.circular(15.0)), paint);
//   }
// }
