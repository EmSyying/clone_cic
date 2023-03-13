class DynamicLinkModel {
  DynamicLinkModel({
     this.success,
     this.message,
     this.accountNumber,
     this.accountName,
     this.sortLink,
  });
  late final bool? success;
  late final String? message;
  late final String? accountNumber;
  late final String? accountName;
  late final String? sortLink;

  DynamicLinkModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    message = json['message'] ?? "";
    accountNumber = json['account_number'] ?? "";
    accountName = json['account_name'] ?? "";
    sortLink = json['sort_link'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    data['sort_link'] = sortLink;
    return data;
  }
}
