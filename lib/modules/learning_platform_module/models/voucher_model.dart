class VoucherModel {
  String? imageUrl;
  String? title;
  String? expiredDate;
  String? shopImageUrl;
  bool? isActive;
  String? couponCode;
  String? description;
  String? howtoUse;
  List<String>? termAndConditon;
  VoucherModel(
      {this.imageUrl,
      this.title,
      this.expiredDate,
      this.shopImageUrl,
      this.isActive = true,
      this.couponCode,
      this.description,
      this.howtoUse,
      this.termAndConditon});

  VoucherModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    title = json['title'];
    expiredDate = json['expired_date'];
    shopImageUrl = json['shop_image_url'];
    isActive = json['is_active'];
    couponCode = json['coupon_code'];
    description = json['description'];
    howtoUse = json['howto_use'];
    termAndConditon = json['term_and_conditon'];
  }
}
