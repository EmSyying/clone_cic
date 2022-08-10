import 'package:cicgreenloan/modules/ut_trading/models/link.dart';
import 'package:cicgreenloan/modules/ut_trading/models/meta.dart';

class SubscriptionModel {
  List<SubscriptionData>? data;
  Links? links;
  Meta? meta;

  SubscriptionModel({this.data, this.links, this.meta});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SubscriptionData>[];
      json['data'].forEach((v) {
        data!.add(SubscriptionData.fromJson(v));
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

class SubscriptionData {
  int? id;
  int? memberId;
  num? numberOfShare;
  num? price;
  num? total;
  String? tractionDate;

  SubscriptionData(
      {this.id,
      this.memberId,
      this.numberOfShare,
      this.price,
      this.total,
      this.tractionDate});

  SubscriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    numberOfShare = json['number_of_share'];
    price = json['price'];
    total = json['total'];
    tractionDate = json['traction_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['number_of_share'] = numberOfShare;
    data['price'] = price;
    data['total'] = total;
    data['traction_date'] = tractionDate;
    return data;
  }
}
