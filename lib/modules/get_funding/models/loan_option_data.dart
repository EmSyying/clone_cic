class OptionData {
  List<OptionType>? data;

  OptionData({this.data});

  OptionData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OptionType>[];
      json['data'].forEach((v) {
        data!.add(OptionType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionType {
  num? id;
  String? productName;
  String? productType;
  num? requireCompany;
  Interest? financingAmount;
  Interest? interest;
  Interest? duration;
  Currency? currency;

  OptionType(
      {this.id,
      this.productName,
      this.productType,
      this.requireCompany,
      this.financingAmount,
      this.interest,
      this.duration,
      this.currency});

  OptionType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productType = json['product_type'];
    requireCompany = json['require_company'];
    financingAmount = json['financing_amount'] != null
        ? Interest.fromJson(json['financing_amount'])
        : null;
    interest =
        json['interest'] != null ? Interest.fromJson(json['interest']) : null;
    duration = (json['duration'] != null
        ? Interest.fromJson(json['duration'])
        : null)!;
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['product_type'] = productType;
    data['require_company'] = requireCompany;
    if (financingAmount != null) {
      data['financing_amount'] = financingAmount!.toJson();
    }
    if (interest != null) {
      data['interest'] = interest!.toJson();
    }
    if (duration != null) {
      data['duration'] = duration!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    return data;
  }
}

class Interest {
  num? minimum;
  num? defaults;
  num? maximum;

  Interest({this.minimum, this.defaults, this.maximum});

  Interest.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    defaults = json['default'];
    maximum = json['maximum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minimum'] = minimum;
    data['default'] = defaults;
    data['maximum'] = maximum;
    return data;
  }
}

class Currency {
  num? id;
  String? sign;

  Currency({this.id, this.sign});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sign'] = sign;
    return data;
  }
}
