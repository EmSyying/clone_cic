class ShopModel {
  String? shopName;
  String? photoURL;
  ShopModel({this.photoURL, this.shopName});
}

List<ShopModel> shopList = [
  ShopModel(
      shopName: 'Park Cafe',
      photoURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZno6n3fZKuDy3uIztYU4cZ5QDWB3JKAylLw&usqp=CAU'),
  ShopModel(
      shopName: 'Pizza TK',
      photoURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXYiQHCUAO1SxWTj6CcBDSRHKBmVklqsD-vA&usqp=CAU'),
  ShopModel(
      shopName: 'Natural Food',
      photoURL:
          'https://image.freepik.com/free-vector/funny-pizza-company-logo-template_292879-424.jpg'),
  ShopModel(
      shopName: 'Circle K',
      photoURL:
          'http://www.atmindgroup.com/atmindplus/wp-content/uploads/2018/11/the-pizza-company.jpg'),
];
