import 'detail_model.dart';

class InquiryModel {
  int? id;
  int? memberId;
  int? marketId;
  num? numberOfShare;
  num? price;
  String? operation;
  String? type;
  String? date;
  String? description;
  String? tradingWith;
  num? targetMember;
  String? time;
  bool? payment;
  Details? details;
  InquiryModel(
      {this.id,
      this.memberId,
      this.marketId,
      this.numberOfShare,
      this.price,
      this.operation,
      this.type,
      this.date,
      this.description,
      this.tradingWith,
      this.targetMember,
      this.time,
      this.payment,
      this.details});

  InquiryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    marketId = json['market_id'];
    numberOfShare = json['number_of_share'];
    price = json['price'];
    operation = json['operation'];
    type = json['type'];
    date = json['date'];
    description = json['description'];
    tradingWith = json['trading_with'];
    targetMember = json['target_member'];
    time = json['time'];
    payment = json['payment'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['market_id'] = marketId;
    data['number_of_share'] = numberOfShare;
    data['price'] = price;
    data['operation'] = operation;
    data['type'] = type;
    data['date'] = date;
    data['description'] = description;
    data['trading_with'] = tradingWith;
    data['target_member'] = targetMember;
    data['time'] = time;
    data['payment'] = payment;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}
