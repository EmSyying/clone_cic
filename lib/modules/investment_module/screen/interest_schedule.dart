import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:flutter/material.dart';
import '../../../widgets/investments/invest_transaction_card.dart';
import '../model/fif_application/schedule/schedule.dart';

class InterestSchedule extends StatelessWidget {
  final List<ScheduleModelList>? scheduleModelList;
  const InterestSchedule({Key? key, this.scheduleModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'All Transactions',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Column(
            children: scheduleModelList!.asMap().entries.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      FormatDate.investmentDateDisplay(e.value.paymentDate!),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  InvestTransactionCard(
                    currency: e.value.interest,
                    dateTime: e.value.time,
                    image: 'assets/images/svgfile/investfif.svg',
                    title: e.value.titel,
                    status: e.value.status,
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
