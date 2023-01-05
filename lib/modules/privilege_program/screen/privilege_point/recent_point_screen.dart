import 'package:flutter/material.dart';

import '../../../../widgets/privilege/privilege_point/custom_recent_card.dart';

class RecentPointScreen extends StatelessWidget {
  const RecentPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: recentCardList.asMap().entries.map((e) {
        return CustomRecentCard(
          title: e.value.title,
          datetime: e.value.datetime,
          price: e.value.price,
          action: e.value.action,
          minusPoint: e.value.minusPoint,
          image: e.value.image,
        );
      }).toList()),
    );
  }
}

class RecentCardModel {
  final String? title, datetime, action, image;
  final int? price, minusPoint;

  RecentCardModel(
      {this.title,
      this.datetime,
      this.action,
      this.price,
      this.minusPoint,
      this.image});
}

List<RecentCardModel> recentCardList = [
  RecentCardModel(
    title: 'Champei SpaLorem Ipsum Cham ...',
    datetime: '23 December 2022',
    price: 540,
    minusPoint: 500,
    action: 'APGQ',
    image:
        'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
  ),
  RecentCardModel(
    title: 'Champei SpaLorem Ipsum Cham ...',
    datetime: '23 December 2022',
    price: 540,
    minusPoint: 500,
    action: 'APGQ',
    image:
        'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
  ),
  RecentCardModel(
    title: 'Champei SpaLorem Ipsum Cham ...',
    datetime: '23 December 2022',
    price: 540,
    minusPoint: 500,
    action: 'APGQ',
    image:
        'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
  ),
];
