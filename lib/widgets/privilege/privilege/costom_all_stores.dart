import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/function/convert_fromhex_color.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../modules/privilege_program/model/stores_model/privilege_shop_model.dart';

class CustomCardAllStores extends StatelessWidget {
  final PrivilegeShopModel? privilegeShopList;
  final bool isFav;
  final GestureTapCallback? onTapFav;

  const CustomCardAllStores({
    Key? key,
    this.isFav = false,
    this.onTapFav,
    this.privilegeShopList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 10.0,
            bottom: 10.0,
          ),
          width: double.infinity,
          height: 104,
          decoration: BoxDecoration(
            color: AppColor.arrowforwardColor['dark'],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[600]!.withOpacity(0.1),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: 84,
                height: 84,
                padding: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  // image: DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: NetworkImage(
                  //     privilegeShopList!.shopLogo ?? '',
                  //   ),
                  // ),
                ),
                child: CachedNetworkImage(
                  imageUrl: privilegeShopList!.shopLogo ?? '',
                  errorWidget: (context, url, error) => Container(
                    width: 84,
                    height: 84,
                    color: const Color(0xfff4f0f0).withOpacity(0.4),
                    child: const Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          privilegeShopList!.status ?? '',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 10,
                                    color: privilegeShopList!.status == "Closed"
                                        ? AppColor.statusColor['late']
                                        : privilegeShopList!.status ==
                                                "Permanently Closed"
                                            ? AppColor.statusColor['warning']
                                            : AppColor.statusColor['green'],
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        privilegeShopList!.shopNameInEnglish ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        privilegeShopList!.slogan ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff848F92),
                                ),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.room_rounded,
                            color: Colors.grey,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          privilegeShopList!.pointAccepted == true
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  child: Text(
                                    privilegeShopList!.fullAddress ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: const Color(0xff464646),
                                          letterSpacing: 0.2,
                                        ),
                                  ),
                                )
                              : Expanded(
                                  child: Text(
                                    privilegeShopList!.fullAddress ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: const Color(0xff464646),
                                          letterSpacing: 0.2,
                                        ),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                // width: 44,
                height: 20,
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.centerLeft, colors: [
                    fromHex(privilegeShopList!.discountBgColor ?? ''),
                    fromHex(privilegeShopList!.discountBgColorEnd ?? ''),
                    // Color.fromRGBO(255, 200, 55, 1),
                    // Color.fromRGBO(255, 128, 8, 1),
                  ]),
                ),
                //color: fromHex(privilegeShopList!.discountBgColor ?? ''),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Text(
                      privilegeShopList!.discountRate ?? '',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        privilegeShopList!.pointAccepted == true
            ? Positioned(
                right: 0,
                bottom: 8,
                child: Container(
                  // height: 20,
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(234, 63, 78, 163),
                        Color.fromARGB(234, 53, 137, 232),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.0),
                    child: Text(
                      'MVP Approved',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: const Offset(0.0, 1),
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Positioned(
          left: 14,
          top: 16,
          child: GestureDetector(
            onTap: onTapFav,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              width: 22,
              height: 22,
              child: isFav
                  ? SvgPicture.asset(
                      'assets/images/privilege/favorite.svg',
                    )
                  : SvgPicture.asset(
                      'assets/images/privilege/heart.svg',
                      color: Colors.red,
                      height: 12,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
