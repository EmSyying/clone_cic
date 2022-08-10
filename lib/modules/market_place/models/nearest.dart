class Nearest {
  String? caption;
  String? name;
  String? type;
  double? price;
  double? disPrice;
  String? photoURL;
  String? shopName;
  String? location;
  String? openHour;
  String? description;
  String? redeem;
  String? status;
  Nearest(
      {this.name,
      this.caption,
      this.type,
      this.price,
      this.disPrice,
      this.photoURL,
      this.description,
      this.location,
      this.openHour,
      this.redeem,
      this.status,
      this.shopName});
}

List<Nearest> nearest = [
  Nearest(
    name: 'Pizza',
    disPrice: 30.99,
    price: 35.99,
    type: 'Healthy & Delicouse',
    caption: 'New',
    photoURL:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz-eJmvQnM5YyC8UwvvIr56hMyQr0Wa6vppA&usqp=CAU',
    shopName: 'Park Cafe Toul Kork',
    status: 'Big Sale Today',
    location: 'St 153, Khan Toul Kork, Phnom Penh',
    openHour: '6:00AM - 8:00AM',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    redeem: 'Lorem ipsum dolor sit amet, consectetur ',
  ),
  Nearest(
    caption: 'Promotion',
    name: 'Burger',
    disPrice: 5.99,
    price: 8.99,
    type: 'Healthy & Delicouse',
    photoURL:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXiB8gtOaT-mq78f9X_QT29SSQZXV8R3RsbQ&usqp=CAU',
    shopName: 'Park Cafe Toul Kork',
    location: 'St 153, Khan Toul Kork, Phnom Penh',
    openHour: '6:00AM - 8:00AM',
    description:
        'Lorem ipsum dolor dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    redeem: 'Lorem ipsum dolor sit amet, consectetur ',
    status: 'Promotion For 2 Days',
  ),
  Nearest(
    status: 'Promotion For 2 Days',
    caption: 'New Product',
    name: 'Seafood',
    disPrice: 12.99,
    price: 23.99,
    type: 'Healthy & Delicouse',
    photoURL:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz2gLCYVc31ZICM5zwh79vq4niRW4pQQh9Kw&usqp=CAU',
    shopName: 'Park Cafe Toul Kork',
    location: 'St 153, Khan Toul Kork, Phnom Penh',
    openHour: '6:00AM - 8:00AM',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    redeem: 'Lorem ipsum dolor sit amet, consectetur ',
  ),
  Nearest(
      shopName: 'Park Cafe Toul Kork',
      status: 'Big Sale Today',
      location: 'St 153, Khan Toul Kork, Phnom Penh',
      openHour: '6:00AM - 8:00AM',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      redeem: 'Lorem ipsum dolor sit amet, consectetur ',
      caption: 'Comming Soon',
      name: 'Seafood',
      disPrice: 10.99,
      price: 15.99,
      type: 'Healthy & Delicouse',
      photoURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOCffv7Eb8mlPadgXu1-gr4cpwBodpX-B-0w&usqp=CAU'),
  Nearest(
      shopName: 'Park Cafe Toul Kork',
      status: 'Big Sale Today',
      location: 'St 153, Khan Toul Kork, Phnom Penh',
      openHour: '6:00AM - 8:00AM',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      redeem: 'Lorem ipsum dolor sit amet, consectetur ',
      caption: '50% off',
      name: 'Soup',
      disPrice: 10.99,
      price: 15.99,
      type: 'Healthy & Delicouse',
      photoURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWNQqyAQCgwlMf2lOGui3ADOXJaWwbHDejIw&usqp=CAU'),
  Nearest(
      shopName: 'Park Cafe Toul Kork',
      status: 'Big Sale Today',
      location: 'St 153, Khan Toul Kork, Phnom Penh',
      openHour: '6:00AM - 8:00AM',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      redeem: 'Lorem ipsum dolor sit amet, consectetur ',
      caption: 'Comming soon',
      name: 'Noodle',
      disPrice: 10.99,
      price: 15.99,
      type: 'Healthy & Delicouse',
      photoURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIYyMn8LpSt9JRHiG5XDZxpe2UMmLOmYUaKw&usqp=CAU'),
  Nearest(
      shopName: 'Park Cafe Toul Kork',
      status: 'Big Sale Today',
      location: 'St 153, Khan Toul Kork, Phnom Penh',
      openHour: '6:00AM - 8:00AM',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      redeem: 'Lorem ipsum dolor sit amet, consectetur ',
      caption: 'New Promotion',
      name: 'Pizza',
      disPrice: 10.99,
      price: 15.99,
      type: 'Healthy & Delicouse',
      photoURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz-eJmvQnM5YyC8UwvvIr56hMyQr0Wa6vppA&usqp=CAU'),
  Nearest(
      shopName: 'Park Cafe Toul Kork',
      status: 'Big Sale Today',
      location: 'St 153, Khan Toul Kork, Phnom Penh',
      openHour: '6:00AM - 8:00AM',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      redeem: 'Lorem ipsum dolor sit amet, consectetur ',
      caption: 'Promotion',
      name: 'Burger',
      disPrice: 5.99,
      price: 8.99,
      type: 'Healthy & Delicouse',
      photoURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXiB8gtOaT-mq78f9X_QT29SSQZXV8R3RsbQ&usqp=CAU'),
];
