import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../Utils/helper/container_partern.dart';
import '../../modules/market_place/models/nearest.dart';
import '../../modules/market_place/models/recommend.dart';

// ignore: must_be_immutable
class CustomItemCard extends StatelessWidget {
  Recommend? recommendItem;
  Nearest? nearest;
  final bool? isRecommendCard;
  CustomItemCard(
      {this.nearest, this.recommendItem, this.isRecommendCard, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isRecommendCard!
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: containerCiCPartern,
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.58,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(borderRaduis),
                            topRight: Radius.circular(borderRaduis)),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: nearest!.photoURL!,
                              fit: BoxFit.cover,
                              height: constraints.maxHeight * 0.58,
                              width: constraints.maxWidth,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffED1E26),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(borderRaduis),
                                  bottomRight: Radius.circular(borderRaduis),
                                )),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              nearest!.bodySmall!.toUpperCase(),
                              style: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 13, left: 15, right: 15, bottom: 13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            nearest!.name!,
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            nearest!.type!,
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'DM Sans',
                                color: Color(0xff6D7174),
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              nearest!.disPrice != null
                                  ? const Text(
                                      '\$price',
                                      style: TextStyle(
                                          color: Color(0xff6D7174),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  : Text(
                                      '\$${nearest!.price!}',
                                      style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffED1E26),
                                        fontSize: 12,
                                      ),
                                    ),
                              const SizedBox(
                                width: 10,
                              ),
                              nearest!.disPrice != null
                                  ? Text('\$${nearest!.disPrice}',
                                      style: const TextStyle(
                                          fontFamily: 'DM Sans',
                                          color: Color(0xffED1E26),
                                          fontSize: 12))
                                  : const Text(''),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height:
                    constraints.maxHeight, //MediaQuery.of(context).size.height,
                width: constraints.maxHeight / 0.99,
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                decoration: containerCiCPartern,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.60,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(borderRaduis),
                          topRight: Radius.circular(borderRaduis),
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: recommendItem!.photoURL!,
                              fit: BoxFit.cover,
                              height: constraints.maxHeight * 0.60,
                              width: constraints.maxWidth,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffED1E26),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(borderRaduis),
                                  bottomRight: Radius.circular(borderRaduis),
                                )),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              recommendItem!.bodySmall!.toUpperCase(),
                              style: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            recommendItem!.name!,
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            recommendItem!.type!,
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'DM Sans',
                                color: Color(0xff6D7174),
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              recommendItem!.disPrice != null
                                  ? Text(
                                      '\$${recommendItem!.disPrice}',
                                      style: const TextStyle(
                                          color: Color(0xff6D7174),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  : Text(
                                      '\$${recommendItem!.price}',
                                      style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffED1E26),
                                        fontSize: 12,
                                      ),
                                    ),
                              const SizedBox(
                                width: 10,
                              ),
                              recommendItem!.disPrice != null
                                  ? Text('\$${recommendItem!.disPrice}',
                                      style: const TextStyle(
                                          fontFamily: 'DM Sans',
                                          color: Color(0xffED1E26),
                                          fontSize: 12))
                                  : const Text(''),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
