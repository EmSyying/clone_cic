import 'package:cicgreenloan/modules/investment_module/model/share_price_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CiCLineChart extends StatelessWidget {
  final List<Evolution> dataList;
  final List<Evolution> dataAfterSplit;
  CiCLineChart(
      {Key? key, this.dataList = const [], this.dataAfterSplit = const []})
      : super(key: key);
  bool _isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    // var testList = <Evolution>[
    //   Evolution(date: "2018", price: 1.5),
    //   Evolution(date: "2019", price: 2.25),
    //   Evolution(date: "2020", price: 2.95),
    //   Evolution(date: "2021", price: 3.25),
    //   Evolution(date: "2022", price: 5.89),
    //   Evolution(date: "2023", price: 1.79),
    // ];
    // dataList.clear();
    // dataList.addAll(testList);
    // var year = [];
    // var splitIndex = 0;
    // var y = 0;
    // var splitIndexList = [];

    // dataList.asMap().entries.map((e) {
    //   // debugPrint("${e.key},,,${e.value.date},");
    //   if (year.contains(e.value.date)) {
    //     splitIndex = e.key - 1;
    //     splitIndexList.add(e.key);
    //     debugPrint("${e.key - 1},,,${e.value.date},");
    //   } else {
    //     year.add(e.value.date);
    //   }
    // }).toList();
    // var noDuplicateValueList = <Evolution>[];
    // if (dataAfterSplit.isNotEmpty) {
    //   dataList.asMap().entries.map((e) {
    //     if (dataAfterSplit[0].price != e.value.price) {
    //       noDuplicateValueList.add(e.value);
    //     }
    //   }).toList();
    // }
    // if (dataAfterSplit.isNotEmpty) {
    //   noDuplicateValueList.asMap().entries.map((e) {
    //     if (dataAfterSplit[0].date == e.value.date) {
    //       splitIndex = e.key;
    //       debugPrint("e.key==$splitIndex");
    //     }
    //   }).toList();
    // }
    var year = [];
    var splitIndex = 0;
    var tapIndex = 0;
    for (var i = 0; i < dataList.length; i++) {
      if (year.contains(dataList[i].date)) {
        tapIndex = i;
        debugPrint('tapIndex=$tapIndex');
      } else {
        year.add(dataList[i].date);
      }
    }
    debugPrint('$year');
    for (var i = 0; i < year.length; i++) {
      debugPrint('$i ${year[i]} ${dataAfterSplit[0].date}');
      if (year[i] == dataAfterSplit[0].date) {
        debugPrint('year${year[i]}');
        splitIndex = i;
      }
    }

    ChartSeriesController? seriesController;
    debugPrint("");
    return SfCartesianChart(
        selectionGesture: ActivationMode.singleTap,
        enableMultiSelection: false,

        // onSelectionChanged: (selectionArgs) {
        //   debugPrint("selectionArgs${selectionArgs.pointIndex}");
        // },
        // onChartTouchInteractionDown: (ChartTouchInteractionArgs args) {
        //   print("x${args.position.dx}");
        //   print("y${args.position.dy}");
        // },
        onTrackballPositionChanging: (TrackballArgs args) {
          // args.chartPointInfo.label = 'Custom Text';
          debugPrint(
              "${year[splitIndex] == args.chartPointInfo.chartDataPoint!.x}${args.chartPointInfo.chartDataPoint!.x}");
          if (year[splitIndex]
                  .toString()
                  .contains(args.chartPointInfo.chartDataPoint!.x.toString()) &&
              _isDialogShowing != true) {
            debugPrint("args${args.chartPointInfo.chartDataPoint!.x}");
            _isDialogShowing = true;
            showDialogSplit(context);
          }
        },
        onSelectionChanged: (SelectionArgs args) {
          debugPrint(
              " dataList[args.pointIndex].date;${dataList[args.pointIndex].date}");
          // args.selectedColor = Colors.red;
          // args.unselectedColor = Colors.lightGreen;
        },
        trackballBehavior: TrackballBehavior(
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
            // tooltipAlignment: ChartAlignment.near,
            enable: true,
            activationMode: ActivationMode.singleTap,
            lineWidth: 5,
            tooltipSettings: const InteractiveTooltip(
              enable: false,
            ),
            lineColor: Colors.transparent),
        // selectionType: SelectionType.point,
        primaryXAxis: CategoryAxis(
          axisLine: AxisLine(color: Theme.of(context).primaryColor),
          majorGridLines: const MajorGridLines(
            dashArray: [10],
          ),
          plotBands: [
            PlotBand(
              text: "Share Split 9-1",
              textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                  ),
              textAngle: 0,
              // sizeType: DateTimeIntervalType.years,
              verticalTextAlignment: TextAnchor.start,
              horizontalTextPadding: "-16%",
              // dashArray: const [2, 6],
              isVisible: true,

              start: splitIndex,
              end: splitIndex,

              // associatedAxisStart: DateTime.utc(2022),

              // associatedAxisEnd: DateTime.utc(2022),
              borderWidth: 2,
              borderColor: Theme.of(context).primaryColor,
            )
          ],
        ),
        // primaryXAxis: NumericAxis(
        //   // numberFormat: NumberFormat.decimalPattern(),

        //   axisLine: AxisLine(color: Theme.of(context).primaryColor),
        //   // plotOffset: 2,
        //   // associatedAxisName: "primaryXAxis",
        //   majorGridLines: const MajorGridLines(color: Colors.transparent),
        //   plotBands: [
        //     PlotBand(
        //       text: "Share Split 9-1",
        //       textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
        //             color: Theme.of(context).primaryColor,
        //             fontSize: 12,
        //           ),
        //       textAngle: 0,
        //       // sizeType: DateTimeIntervalType.years,
        //       verticalTextAlignment: TextAnchor.start,
        //       horizontalTextPadding: "-16%",
        //       // dashArray: const [2, 6],
        //       isVisible: true,

        //       start: 2022,
        //       end: 2022,

        //       // associatedAxisStart: DateTime.utc(2022),

        //       // associatedAxisEnd: DateTime.utc(2022),
        //       borderWidth: 2,
        //       borderColor: Theme.of(context).primaryColor,
        //     )
        //   ],
        // ),
        primaryYAxis: NumericAxis(
          axisLine: AxisLine(color: Theme.of(context).primaryColor),
          majorGridLines: const MajorGridLines(
            dashArray: [10],
          ),
        ),
        // Chart title
        title: ChartTitle(text: ''),
        // Enable legend

        legend: Legend(
            borderWidth: 6,
            isVisible: true,
            borderColor: Theme.of(context).primaryColor),
        series: <ChartSeries<Evolution, int>>[
          LineSeries<Evolution, int>(
            // selectionBehavior: SelectionBehavior(enable: true),
            enableTooltip: true,
            isVisibleInLegend: false,
            color: Theme.of(context).primaryColor,
            width: 2.5,

            // selectionBehavior: SelectionBehavior(
            //     enable: true,
            //     toggleSelection: false,
            //     selectedColor: Colors.red,
            //     selectedBorderColor: Colors.black,
            //     selectedBorderWidth: 2.5,
            //     unselectedBorderColor: Theme.of(context).primaryColor,
            //     unselectedBorderWidth: 2.5,
            //     unselectedColor: Theme.of(context).primaryColor),
            markerSettings: MarkerSettings(
                isVisible: true,
                borderWidth: 2,
                shape: DataMarkerType.circle,
                borderColor: Theme.of(context).primaryColor),
            dataSource: dataList,
            onRendererCreated: (controller) {
              seriesController = controller;
            },

            xValueMapper: (Evolution sales, _) => int.parse(sales.date!),
            yValueMapper: (Evolution sales, _) => sales.price,

            // Enable data label
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              // margin: const EdgeInsets.only(top: 20),

              alignment: ChartAlignment.near,
              angle: 0,
              builder: (data, point, series, pointIndex, seriesIndex) {
                CartesianChartPoint<dynamic> chartPoint =
                    CartesianChartPoint<dynamic>(
                  point.x,
                  point.y,
                );
                debugPrint("${point.y}");
                debugPrint("${point.x}");
                Offset? pointLocation =
                    seriesController?.pointToPixel(chartPoint);
                debugPrint("x====${point.x}");
                debugPrint("");
                if (pointIndex == splitIndex) {
                  debugPrint("x====${pointLocation?.dx}");
                  debugPrint("y====${pointLocation?.dy}");
                }
                return Text(
                  "${data.price}",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                );
              },
            ),
          ),
          // ColumnSeries<Evolution, String>(
          //   dataSource: dataList,
          //   color: Colors.transparent,
          //   isVisibleInLegend: false,
          //   yAxisName: "asdasdsa",
          //   xValueMapper: (Evolution sales, _) => sales.date,
          //   yValueMapper: (Evolution sales, _) =>
          //       sales.price == 1.48 ? 19 : sales.price,
          //   onPointTap: (pointInteractionDetails) {
          //     if (pointInteractionDetails.pointIndex == splitIndex) {
          //       Future.delayed(Duration.zero, () {
          //         showDialogSplit(context);
          //       });
          //       debugPrint(
          //           "pointInteractionDetails${pointInteractionDetails.pointIndex}");
          //     }
          //   },
          // ),
        ]);
  }

  void showDialogSplit(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextss) {
        // return getExperimentOne();
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.05,
                  left: 20,
                  right: 20),
              child: Container(
                height: 158,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Share split',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Theme.of(context).primaryColor)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'There was a Nine-for-One (9-for-1) split of CiC PLC’s Share at the end of December 2022.',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: const Color(0xff0A0B09),
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            _isDialogShowing = false;

                            Navigator.pop(contextss);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(6)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Done',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.white),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class CustomPlotBand extends PlotBand {}
