class StoreModel {
  String? steusTitle;
  String? titleStores;
  String? description;
  String? location;
  String? imageStores;
  int? numberPercentage;
  String? logoCard;
  String? titleServTab;
  String? ourTitle;
  String? titleDes;
  String? descDetail;
  String? descLocation;
  bool isFav;
  StoreModel({
    this.steusTitle,
    this.titleStores,
    this.description,
    this.location,
    this.imageStores,
    this.numberPercentage,
    this.logoCard,
    this.isFav = false,
    this.titleServTab,
    this.ourTitle,
    this.titleDes,
    this.descDetail,
    this.descLocation,
  });
}

class StopModel {
  int? id;
  int? isOpen;
  int? isFavorite;
  String? slogan;
  String? discountBgColor;
  String? shopNameInKhmer;
  String? shopNameInEnglish;
  String? fullAddress;
  String? shopLogo;

  StopModel({
    this.id,
    this.isOpen,
    this.isFavorite,
    this.slogan,
    this.discountBgColor,
    this.shopNameInKhmer,
    this.shopNameInEnglish,
    this.fullAddress,
    this.shopLogo,
  });
}
