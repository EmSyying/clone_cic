class StoreHomeDataModel {
  late String totalMvp;
  late int numberOfShop;
  late String mvpIn;
  late String mvpOut;

  StoreHomeDataModel(
      {this.totalMvp = "",
      this.numberOfShop = 0,
      this.mvpIn = "",
      this.mvpOut = ""});

  StoreHomeDataModel.fromJson(Map<String, dynamic> json) {
    totalMvp = json['total_mvp'] ?? "";
    numberOfShop = json['number_of_shop'] ?? 0;
    mvpIn = json['mvp_in'] ?? "";
    mvpOut = json['mvp_out'] ?? ""; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_mvp'] = totalMvp;
    data['number_of_shop'] = numberOfShop;
    data['mvp_in'] = mvpIn;
    data['mvp_out'] = mvpOut;
    return data;
  }
}
