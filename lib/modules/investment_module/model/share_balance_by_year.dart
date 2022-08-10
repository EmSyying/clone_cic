class ShareBalanceByYears {
  int? numberShare;
  int? year;

  ShareBalanceByYears({this.numberShare, this.year});

  ShareBalanceByYears.fromJson(Map<String, dynamic> json) {
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
