import 'package:cicgreenloan/widgets/marketplace/custom_shop_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/market_place/models/shop_menu.dart';

class CustomShopList extends StatelessWidget {
  final List<ShopModel>? shopList;
  final Function? onTap;
  const CustomShopList({this.onTap, this.shopList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: shopList!.map((e) => const CustomShopCard()).toList(),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    //   child: GridView.builder(
    //     itemCount: shopList!.length,
    //     shrinkWrap: true,
    //     physics: NeverScrollableScrollPhysics(),
    //     scrollDirection: Axis.vertical,
    //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 4, childAspectRatio: 0.80),
    //     itemBuilder: (context, index) {
    //       ShopModel currentShop = shopList![index];
    //       return GestureDetector(
    //         child: CustomShopCard(
    //           shopModel: currentShop,
    //         ),
    //         onTap: () => onTap!(currentShop),
    //       );
    //     },
    //   ),
    // );
  }
}
