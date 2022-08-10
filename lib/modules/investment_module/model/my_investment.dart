import 'package:cicgreenloan/modules/investment_module/model/share_balance_by_year.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_subcription_by_price.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_subscription_by_year.dart';

class ShareSubcriptionHistoriesData {
  List<ShareSubscriptionByYears>? shareSubscriptionByYears;
  List<ShareSubscriptionByPrices>? shareSubscriptionByPrices;
  List<ShareBalanceByYears>? shareSubscriptionBalanceByYear;

  ShareSubcriptionHistoriesData(
      {this.shareSubscriptionByYears,
      this.shareSubscriptionByPrices,
      this.shareSubscriptionBalanceByYear});

  ShareSubcriptionHistoriesData.fromJson(Map<String, dynamic> json) {
    if (json['share_subscription_by_years'] != null) {
      shareSubscriptionByYears = <ShareSubscriptionByYears>[];
      json['share_subscription_by_years'].forEach((v) {
        shareSubscriptionByYears!.add(ShareSubscriptionByYears.fromJson(v));
      });
    }
    if (json['share_subscription_by_prices'] != null) {
      shareSubscriptionByPrices = <ShareSubscriptionByPrices>[];
      json['share_subscription_by_prices'].forEach((v) {
        shareSubscriptionByPrices!.add(ShareSubscriptionByPrices.fromJson(v));
      });
    }
    if (json['share_balance_by_years'] != null) {
      shareSubscriptionBalanceByYear = <ShareBalanceByYears>[];
      json['share_balance_by_years'].forEach((v) {
        shareSubscriptionBalanceByYear!.add(ShareBalanceByYears.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shareSubscriptionByYears != null) {
      data['share_subscription_by_years'] =
          shareSubscriptionByYears!.map((v) => v.toJson()).toList();
    }
    if (shareSubscriptionByPrices != null) {
      data['share_subscription_by_prices'] =
          shareSubscriptionByPrices!.map((v) => v.toJson()).toList();
    }
    if (shareSubscriptionBalanceByYear != null) {
      data['share_balance_by_years'] =
          shareSubscriptionBalanceByYear!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
