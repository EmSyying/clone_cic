import 'package:flutter/material.dart';

import 'chart_model.dart';
import 'custom_data_table.dart';
import 'custom_subscription_chart.dart';

class SubscriptionChart extends StatelessWidget {
  const SubscriptionChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // SvgPicture.asset(''),
              Text(
                'Figure in Unit Trust',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xff464646),
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              _buildSqarePoint(Theme.of(context).primaryColor),
              Text(
                'Subscribed UT',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: UTsubscriptionChart(
            onSelected: (details) {
              debugPrint('Point Index = ${details.pointIndex}');
            },
          ),
        ),
        const SizedBox(height: 20),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
          child: CustomDataTable(
            dataTable: tableData,
          ),
        ),
      ],
    );
  }

  Container _buildSqarePoint(Color color) => Container(
        width: 12,
        height: 12,
        margin: const EdgeInsets.only(right: 5),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
      );
}
