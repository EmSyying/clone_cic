class ShareSubscriptionByYears {
  int? numberShare;
  int? year;

  ShareSubscriptionByYears({this.numberShare, this.year});

  ShareSubscriptionByYears.fromJson(Map<String, dynamic> json) {
    numberShare = json['number_share'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number_share'] = numberShare;
    data['year'] = year;
    return data;
  }
}
