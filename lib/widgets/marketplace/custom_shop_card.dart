import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../Utils/helper/container_partern.dart';
import '../../modules/market_place/models/shop_menu.dart';

class CustomShopCard extends StatelessWidget {
  final ShopModel? shopModel;
  const CustomShopCard({this.shopModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: color,
                    offset: offSet,
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: shopModel!.photoURL!,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Text(
            shopModel!.shopName!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.grey[500]),
          ),
        ],
      ),
    );
    // return Expanded(
    //   child: Container(
    //     height: 100,
    //     color: Colors.red,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //           width: 60,
    //           height: 60,
    //           margin: EdgeInsets.all(10),
    //           decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(50),
    //               boxShadow: [
    //                 BoxShadow(
    //                   blurRadius: 4,
    //                   color: color,
    //                   offset: offSet,
    //                 )
    //               ]),
    //           child: Center(
    //               child: ClipRRect(
    //             borderRadius: BorderRadius.circular(50),
    //             child: CachedNetworkImage(
    //               imageUrl: '${shopModel!.photoURL!}',
    //               height: 50,
    //               width: 50,
    //             ),
    //           )),
    //         ),
    //         Text(
    //           '${shopModel!.shopName!}',
    //           style: Theme.of(context)
    //               .textTheme
    //               .bodyLarge!
    //               .copyWith(color: Colors.grey[500]),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
