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
