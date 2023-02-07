import 'package:cicgreenloan/modules/investment_module/model/share_price_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CiCLineChart extends StatelessWidget {
  final List<Evolution> dataList;
  final List<Evolution> dataAfterSplit;
  const CiCLineChart(
      {Key? key, this.dataList = const [], this.dataAfterSplit = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var testList = <Evolution>[
    //   Evolution(date: "2014", price: 1.5),
    //   Evolution(date: "2015", price: 2.25),
    //   Evolution(date: "2016", price: 2.95),
    //   Evolution(date: "2017", price: 3.25),
    //   Evolution(date: "2018", price: 3.89),
    //   Evolution(date: "2019", price: 4.79),
    //   Evolution(date: "2020", price: 5.16),
    //   Evolution(date: "2021", price: 9.37),
    //   Evolution(date: "2021", price: 1.37),
    //   Evolution(date: "2022", price: 3.48),
    // ];
    // dataList.clear();
    // dataList.addAll(testList);
    var year = [];
    var splitIndex = 0;
    var splitIndexList = [];

    dataList.asMap().entries.map((e) {
      // debugPrint("${e.key},,,${e.value.date},");
      if (year.contains(e.value.date)) {
        splitIndex = e.key - 1;
        splitIndexList.add(e.key);
        debugPrint("${e.key - 1},,,${e.value.date},");
      } else {
        year.add(e.value.date);
      }
    }).toList();

    return SfCartesianChart(
        selectionGesture: ActivationMode.singleTap,
        plotAreaBorderColor: Colors.transparent,
        primaryXAxis: CategoryAxis(
          axisLine: AxisLine(color: Theme.of(context).primaryColor),
          majorGridLines: const MajorGridLines(color: Colors.transparent),
          plotBands: [
            PlotBand(
              text: "Share Split 9-1",
              textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                  ),
              textAngle: 0,
              verticalTextAlignment: TextAnchor.start,
              horizontalTextPadding: "-16%",
              dashArray: const [2, 6],
              isVisible: true,
              start: splitIndex - 1,
              end: splitIndex - 1,
              borderWidth: 2,
              borderColor: Theme.of(context).primaryColor,
            )
          ],
        ),
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
        series: <ChartSeries<Evolution, String>>[
          LineSeries<Evolution, String>(
            enableTooltip: true,
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
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
          ),
          ColumnSeries<Evolution, String>(
            dataSource: dataList,
            color: Colors.transparent,
            isVisibleInLegend: false,
            xValueMapper: (Evolution sales, _) => sales.date,
            yValueMapper: (Evolution sales, _) => sales.price,
            onPointTap: (pointInteractionDetails) {
              if (pointInteractionDetails.pointIndex == splitIndex) {
                Future.delayed(Duration.zero, () {
                  showDialogSplit(context);
                });
                debugPrint(
                    "pointInteractionDetails${pointInteractionDetails.pointIndex}");
              }
            },
          ),
        ]);
  }
}

void showDialogSplit(BuildContext context) {
  showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
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
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: const Color(0xff0A0B09),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
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
