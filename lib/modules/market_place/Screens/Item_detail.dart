import 'package:cicgreenloan/modules/market_place/models/nearest.dart';
import 'package:cicgreenloan/modules/market_place/models/recommend.dart';
import 'package:cicgreenloan/widgets/marketplace/custom_item_detail.dart';
import 'package:flutter/material.dart';

class ItemDatail extends StatelessWidget {
  final Recommend? recommendItem;
  final Nearest? nearestItem;
  final bool? isRecommend;
  const ItemDatail(
      {this.isRecommend, this.recommendItem, this.nearestItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isRecommend == true
          ? CustomItemDetail(
              isRecommend: true,
              reItem: recommendItem,
            )
          : CustomItemDetail(
              isRecommend: false,
              neItem: nearestItem,
            ),
    );
  }
}
