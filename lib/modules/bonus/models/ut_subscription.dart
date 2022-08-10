class UTSubscription {
  int? totalUt;
  int? unpaidUt;
  int? waitingUt;

  UTSubscription({this.totalUt, this.unpaidUt, this.waitingUt});

  UTSubscription.fromJson(Map<String, dynamic> json) {
    totalUt = json['total_ut'];
    unpaidUt = json['unpaid_ut'];
    waitingUt = json['waiting_ut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_ut'] = totalUt;
    data['unpaid_ut'] = unpaidUt;
    data['waiting_ut'] = waitingUt;
    return data;
  }
}
