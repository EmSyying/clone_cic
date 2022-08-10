import 'package:cicgreenloan/modules/ut_trading/models/link.dart';
import 'package:cicgreenloan/modules/ut_trading/models/meta.dart';

class History {
  List<HistoryData>? data;
  Links? links;
  Meta? meta;

  History({this.data, this.links, this.meta});

  History.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HistoryData>[];
      json['data'].forEach((v) {
        data!.add(HistoryData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class HistoryData {
  String? date;
  List<Histories>? histories;

  HistoryData({this.date, this.histories});

  HistoryData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['histories'] != null) {
      histories = <Histories>[];
      json['histories'].forEach((v) {
        histories!.add(Histories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (histories != null) {
      data['histories'] = histories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Histories {
  num? referalId;
  String? remark;
  num? utAmount;
  String? type;
  num? amount;
  String? label;
  String? date;
  String? time;
  String? status;
  View? view;
  String? invoice;
  String? bankName;
  String? accountName;
  String? accountNumber;

  Histories(
      {this.referalId,
      this.remark,
      this.utAmount,
      this.type,
      this.amount,
      this.label,
      this.date,
      this.time,
      this.status,
      this.view,
      this.invoice,
      this.bankName,
      this.accountName,
      this.accountNumber});

  Histories.fromJson(Map<String, dynamic> json) {
    referalId = json['referal_id'];
    remark = json['remark'];
    utAmount = json['ut_amount'];
    type = json['type'];
    amount = json['amount'];
    label = json['label'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    view = json['view'] != null ? View.fromJson(json['view']) : null;
    invoice = json['invoice'];
    bankName = json['bank_name'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['referal_id'] = referalId;
    data['remark'] = remark;
    data['ut_amount'] = utAmount;
    data['type'] = type;
    data['amount'] = amount;
    data['label'] = label;
    data['date'] = date;
    data['time'] = time;
    data['status'] = status;
    if (view != null) {
      data['view'] = view!.toJson();
    }
    data['invoice'] = invoice;
    data['bank_name'] = bankName;
    data['account_name'] = accountName;
    data['account_number'] = accountNumber;
    return data;
  }
}

class View {
  int? transactionId;
  String? paymentStatus;
  String? paymentType;
  num? utAmount;
  num? bonusPerUt;
  String? transactionDate;
  num? amount;
  String? bankName;
  String? from;
  String? toAccount;
  String? investorId;
  String? investorName;
  String? subscriptionStatus;
  num? pricePerUt;
  num? utToSubscribe;
  num? totalSubscriptionCost;
  num? unpaidAmount;
  num? payable;
  num? accumulatedPayment;
  String? lastDateOfPayment;
  int? subscriptionId;

  View(
      {this.transactionId,
      this.paymentStatus,
      this.paymentType,
      this.utAmount,
      this.bonusPerUt,
      this.transactionDate,
      this.amount,
      this.bankName,
      this.from,
      this.toAccount,
      this.investorId,
      this.investorName,
      this.subscriptionStatus,
      this.pricePerUt,
      this.utToSubscribe,
      this.totalSubscriptionCost,
      this.unpaidAmount,
      this.payable,
      this.accumulatedPayment,
      this.lastDateOfPayment,
      this.subscriptionId});

  View.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    paymentStatus = json['payment_status'];
    paymentType = json['payment_type'];
    utAmount = json['ut_amount'];
    bonusPerUt = json['bonus_per_ut'];
    transactionDate = json['transaction_date'];
    amount = json['amount'];
    bankName = json['bank_name'];
    from = json['from'];
    toAccount = json['to_account'];
    investorId = json['investor_id'];
    investorName = json['investor_name'];
    subscriptionStatus = json['subscription_status'];
    pricePerUt = json['price_per_ut'];
    utToSubscribe = json['ut_to_subscribe'];
    totalSubscriptionCost = json['total_subscription_cost'];
    unpaidAmount = json['unpaid_amount'];
    payable = json['payable'];
    accumulatedPayment = json['accumulated_payment'];
    lastDateOfPayment = json['last_date_of_payment'];
    subscriptionId = json['subscription_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transactionId;
    data['payment_status'] = paymentStatus;
    data['payment_type'] = paymentType;
    data['ut_amount'] = utAmount;
    data['bonus_per_ut'] = bonusPerUt;
    data['transaction_date'] = transactionDate;
    data['amount'] = amount;
    data['bank_name'] = bankName;
    data['from'] = from;
    data['to_account'] = toAccount;
    data['investor_id'] = investorId;
    data['investor_name'] = investorName;
    data['subscription_status'] = subscriptionStatus;
    data['price_per_ut'] = pricePerUt;
    data['ut_to_subscribe'] = utToSubscribe;
    data['total_subscription_cost'] = totalSubscriptionCost;
    data['unpaid_amount'] = unpaidAmount;
    data['payable'] = payable;
    data['accumulated_payment'] = accumulatedPayment;
    data['last_date_of_payment'] = lastDateOfPayment;
    data['subscription_id'] = subscriptionId;
    return data;
  }
}
