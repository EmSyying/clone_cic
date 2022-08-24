import 'package:cicgreenloan/utils/helper/format_Number.dart';
import 'package:cicgreenloan/widgets/investments/equity_fund/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDataTable extends StatelessWidget {
  final List<TableModel>? dataTable;
  const CustomDataTable({
    Key? key,
    required this.dataTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _buildRowData(context, isTitle: true),
          const Divider(height: 0),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            itemCount: dataTable!.length,
            itemBuilder: (_, __) => ColoredBox(
              color: Colors.transparent,
              child: _buildRowData(
                context,
                date: dataTable![__].date,
                ut: FormatNumber.formatNumberDefualt(
                  int.parse(dataTable![__].utAmount!),
                ),
                price: dataTable![__].unitPrice,
                total: '\$${FormatNumber.formatNumberDefualt(
                  int.parse(dataTable![__].totalPrice!),
                )}',
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 0),
          ),
        ],
      );

  Widget _buildRowData(
    BuildContext context, {
    String? date,
    String? ut,
    String? price,
    String? total,
    bool isTitle = false,
  }) {
    TextStyle titleStyle = Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(fontWeight: FontWeight.w700);
    TextStyle normalStyle =
        Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12);
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              date ?? 'Data',
              style: isTitle ? titleStyle : normalStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              ut ?? 'UT',
              style: isTitle ? titleStyle : normalStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              price ?? 'Price',
              style: isTitle ? titleStyle : normalStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                total ?? 'Total Price',
                style: isTitle ? titleStyle : normalStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
