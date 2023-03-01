import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../widgets/privilege/trtansaction_strore.dart';

class PrivilageStoreScreen extends StatelessWidget {
  const PrivilageStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Align(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 150, left: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff384593),
                      Color(0xff3588e8),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total MVP',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffDBDBDB),
                          ),
                    ),
                    Text(
                      '124,000',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Number of Stores',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                '19',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/svgfile/Sell icon.svg'),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'MVP In',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[300],
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '1000',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(
                              'assets/images/svgfile/linestore.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/svgfile/Sell out icon.svg'),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'MVP Out',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[300],
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '1000',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/images/svgfile/line.svg',
                  width: 200,
                  height: 200,
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        )),
        // const Scaffold(),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Padding(
                padding: EdgeInsets.only(right: 60),
                child: Center(
                  child: Text('Stores'),
                ),
              ),
            ),
            body: NestedScrollView(
              headerSliverBuilder: ((context, innerBoxIsScrolled) {
                return [
                  const SliverAppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    leading: Text(''),
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.none,
                    ),
                  ),
                ];
              }),
              body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200]),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '19 Branches',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              useRootNavigator: true,
                              context: context,
                              elevation: 1,
                              bounce: true,
                              expand: false,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.83,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.close),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 50, top: 23),
                                            child: Text(
                                              '4 Branches',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                          ),
                                          const Text('')
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        width: double.infinity,
                                        height: 1,
                                        color: Colors.grey[350],
                                      ),

                                      ///============transaction================
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 20),
                                        child: TransactionStore(
                                          title:
                                              'LG BrandShop (Phsar Doeumkor)',
                                          content: '100 MVP',
                                          image:
                                              'https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2022/01/add-image-in-flutter-hero.png?fit=2850%2C1801&ssl=1',
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              // title: 'Branches',
                              // child: const Padding(
                              //   padding: EdgeInsets.only(
                              //       top: 20, left: 20, right: 20),
                              //   child: TransactionStore(
                              //     title: 'LG BrandShop (Phsar Doeumkor)',
                              //     content: '100 MVP',
                              //     image:
                              //         'https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2022/01/add-image-in-flutter-hero.png?fit=2850%2C1801&ssl=1',
                              //   ),
                              // ),
                              // icon: IconButton(
                              //   icon: const Icon(Icons.close),
                              //   onPressed: () {
                              //     Navigator.pop(context);
                              //   },
                              // )
                            );
                          },
                          child: Text(
                            'See All',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TransactionStore(
                      title: 'LG BrandShop (Phsar Doeumkor)',
                      content: '100 MVP',
                      image:
                          'https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2022/01/add-image-in-flutter-hero.png?fit=2850%2C1801&ssl=1',
                    ),
                  ],
                ),
              ),
            )
            // Column(
            //   children: [
            //     AppBar(
            //       elevation: 0,
            //     ),
            //   ],
            // ),
            ),
      ],
    );
  }
}
