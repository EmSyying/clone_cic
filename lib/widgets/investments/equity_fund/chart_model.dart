class TableModel {
  final String? date;
  final String? totalPrice;
  final String? unitPrice;
  final String? utAmount;
  TableModel({
    this.date,
    this.totalPrice,
    this.unitPrice,
    this.utAmount,
  });
}

// class ChartModel {
//   final String? date;
//   final String? totalPrice;
//   final String? unitPrice;
//   final String? utAmount;
// }

final subChartData = <TableModel>[
  TableModel(
    date: '2016',
    utAmount: '2500',
    totalPrice: '10000',
  ),
  TableModel(
    date: '2017',
    utAmount: '2800',
    totalPrice: '10000',
  ),
];

final List<TableModel> tableData = <TableModel>[
  TableModel(
    date: '12 Jan 22',
    utAmount: '500',
    unitPrice: '8.5',
    totalPrice: '4025',
  ),
  TableModel(
    date: '12 Feb 22',
    utAmount: '500',
    unitPrice: '6.5',
    totalPrice: '3025',
  ),
  TableModel(
    date: '12 Jun 22',
    utAmount: '1000',
    unitPrice: '9.00',
    totalPrice: '5025',
  ),
  TableModel(
    date: '12 Nov 22',
    utAmount: '2000',
    unitPrice: '10.00',
    totalPrice: '6025',
  ),
  TableModel(
    date: '12 Jan 22',
    utAmount: '500',
    unitPrice: '8.5',
    totalPrice: '4025',
  ),
  TableModel(
    date: '12 Feb 22',
    utAmount: '500',
    unitPrice: '6.5',
    totalPrice: '3025',
  ),
  TableModel(
    date: '12 Jun 22',
    utAmount: '1000',
    unitPrice: '9.00',
    totalPrice: '5025',
  ),
  TableModel(
    date: '12 Nov 22',
    utAmount: '2000',
    unitPrice: '10.00',
    totalPrice: '6025',
  ),
];
