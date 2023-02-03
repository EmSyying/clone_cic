import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modules/market_place/models/nearest.dart';
import '../../modules/market_place/models/recommend.dart';
// import 'event/popUpDialog.dart';

// ignore: must_be_immutable
class CustomItemDetail extends StatelessWidget {
  final Nearest? neItem;
  final Recommend? reItem;
  final bool? isRecommend;
  const CustomItemDetail({this.reItem, this.isRecommend, this.neItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          isRecommend == true
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          // ignore: deprecated_member_use
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1.0, 0.0),
                                      color: Colors.black12,
                                      blurRadius: 6),
                                ],
                                color: Colors.white70,
                                image: DecorationImage(
                                    image: NetworkImage(reItem!.photoURL!),
                                    fit: BoxFit.cover),
                              ),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white70.withOpacity(0.1),
                                  child: AppBar(
                                    title: const Text(""),
                                    backgroundColor: Colors.transparent,
                                    actions: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10.0,
                                            top: 10.0,
                                            left: 10.0),
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF4A4A4A),
                                            shape: BoxShape.circle),
                                        alignment: Alignment.center,
                                        child: IconButton(
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            onPressed: () {}),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10.0, top: 10.0, right: 15),
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF4A4A4A),
                                            shape: BoxShape.circle),
                                        alignment: Alignment.center,
                                        child: IconButton(
                                            icon: const Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            onPressed: () {
                                              // onShowChoice(context);
                                            }),
                                      ),
                                    ],
                                    leading: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      padding: const EdgeInsets.only(left: 4.0),
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF4A4A4A),
                                          shape: BoxShape.circle),
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          icon: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100.0,
                              left: 15.0,
                              right: 15.0,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: SizedBox(
                                    height: 180.0,
                                    width: 350.0,
                                    child: CachedNetworkImage(
                                      imageUrl: reItem!.photoURL!,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Term & Condition',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    reItem!.bodySmall!,
                                    style: const TextStyle(
                                        color: Color(0xffED1E26),
                                        fontFamily: 'DM Sans',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  reItem!.disPrice != null
                                      ? Text(
                                          '\$${reItem!.price!}',
                                          style: const TextStyle(
                                              color: Color(0xff6D7174),
                                              fontFamily: 'DM Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : Text(
                                          '\$${reItem!.price!}',
                                          style: const TextStyle(
                                            color: Color(0xffED1E26),
                                            fontFamily: 'DM Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  reItem!.disPrice != null
                                      ? Text(
                                          '\$${reItem!.disPrice}',
                                          style: const TextStyle(
                                            color: Color(0xffED1E26),
                                            fontFamily: 'DM Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : const Text(''),
                                ],
                              ),
                              Text(
                                reItem!.shopName!,
                                style: const TextStyle(
                                  color: Color(0xff0A0B09),
                                  fontFamily: 'DM Sans',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                reItem!.status!,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'DM Sans',
                                    color: Color(0xff0A0B09),
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/location.svg',
                                    height: 18,
                                    color: const Color(0xff6D7174),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    reItem!.location!,
                                    style: const TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6D7174),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Open Hour',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.alarm,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    reItem!.openHour!,
                                    style: const TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6D7174),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Description',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ReadMoreText(
                                reItem!.description!,
                                trimLines: 4,
                                trimMode: TrimMode.Line,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'How To Redeem',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(reItem!.redeem!,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text('2. consectetur adipiscing elit. Fix',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(
                                '3. sed do eiusmod tempor incididunt. Fix',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          // ignore: deprecated_member_use

                          children: [
                            Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1.0, 0.0),
                                      color: Colors.black12,
                                      blurRadius: 6),
                                ],
                                color: Colors.white70,
                                image: DecorationImage(
                                    image: NetworkImage(neItem!.photoURL!),
                                    fit: BoxFit.cover),
                              ),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white70.withOpacity(0.1),
                                  child: AppBar(
                                    title: const Text(""),
                                    backgroundColor: Colors.transparent,
                                    actions: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10.0,
                                            top: 10.0,
                                            left: 10.0),
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF4A4A4A),
                                            shape: BoxShape.circle),
                                        alignment: Alignment.center,
                                        child: IconButton(
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            onPressed: () {}),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10.0, top: 10.0, right: 15),
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF4A4A4A),
                                            shape: BoxShape.circle),
                                        alignment: Alignment.center,
                                        child: IconButton(
                                            icon: const Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            onPressed: () {
                                              // onShowChoice(context);
                                            }),
                                      ),
                                    ],
                                    leading: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      padding: const EdgeInsets.only(left: 4.0),
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF4A4A4A),
                                          shape: BoxShape.circle),
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          icon: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100.0,
                              left: 15.0,
                              right: 15.0,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: SizedBox(
                                    height: 180.0,
                                    width: 350.0,
                                    child: CachedNetworkImage(
                                      imageUrl: neItem!.photoURL!,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Term & Condition',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    neItem!.bodySmall!,
                                    style: const TextStyle(
                                        color: Color(0xffED1E26),
                                        fontFamily: 'DM Sans',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  neItem!.disPrice != null
                                      ? Text(
                                          '\$${neItem!.price!}',
                                          style: const TextStyle(
                                              color: Color(0xff6D7174),
                                              fontFamily: 'DM Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : Text(
                                          '\$${neItem!.price!}',
                                          style: const TextStyle(
                                            color: Color(0xffED1E26),
                                            fontFamily: 'DM Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  neItem!.disPrice != null
                                      ? Text(
                                          '\$${neItem!.disPrice}',
                                          style: const TextStyle(
                                            color: Color(0xffED1E26),
                                            fontFamily: 'DM Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : const Text(''),
                                ],
                              ),
                              Text(
                                neItem!.shopName!,
                                style: const TextStyle(
                                  color: Color(0xff0A0B09),
                                  fontFamily: 'DM Sans',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                neItem!.status!,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'DM Sans',
                                    color: Color(0xff0A0B09),
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/location.svg',
                                    height: 18,
                                    color: const Color(0xff6D7174),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    neItem!.location!,
                                    style: const TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6D7174),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Open Hour',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.alarm,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    neItem!.openHour!,
                                    style: const TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6D7174),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Description',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ReadMoreText(
                                neItem!.description!,
                                trimLines: 4,
                                trimMode: TrimMode.Line,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'How To Redeem',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(neItem!.redeem!,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text('2. consectetur adipiscing elit. Fix',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(
                                '3. sed do eiusmod tempor incididunt. Fix',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          Container(
            height: 50.0,
            width: double.infinity,
            margin: const EdgeInsets.only(
                right: 15.0, top: 20.0, bottom: 25.0, left: 15.0),
            child: CustomButton(
              isDisable: false,
              isOutline: false,
              title: 'Join Telegram',
              onPressed: () async {
                await launch('https://t.me/Oeun_Chenda').then((value) {
                  Navigator.pop(context, false);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
