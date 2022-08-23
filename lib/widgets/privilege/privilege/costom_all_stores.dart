import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';

import '../../../modules/privilege_program/model/stores_model/privilege_shop_model.dart';
import '../custom_fovarite.dart';

class CustomCardAllStores extends StatelessWidget {
  final PrivilegeShopModel? privilegeShopList;
  final bool? isFav;
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
          margin: const EdgeInsets.only(
            top: 12.0,
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
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        privilegeShopList!.shopLogo ?? '',
                      ),
                    )),
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
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: 10,
                                    color: privilegeShopList!.status == "Closed"
                                        ? AppColor.statusColor['late']
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
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        privilegeShopList!.slogan ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
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
                          Expanded(
                            child: Text(
                              privilegeShopList!.fullAddress ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
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
                width: 50,
                height: 22,
                color: AppColor.statusColor['pending'],
                child: Center(
                  child: Text(
                    privilegeShopList!.discountRate ?? '',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 15,
          top: 28,
          child: GestureDetector(
            onTap: onTapFav,
            child: CustomFovarite(
              isFav: isFav,
              isPrivilege: true,
            ),
          ),
        ),
      ],
    );
  }
}
