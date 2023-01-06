import 'package:cicgreenloan/modules/privilege_program/screen/privilege_point/point_emptystate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/firebase_analytics.dart';
import 'loyalty_point_screen.dart';

class PrivilegePointScreen extends StatefulWidget {
  const PrivilegePointScreen({super.key});

  @override
  State<PrivilegePointScreen> createState() => _PrivilegePointScreenState();
}

class _PrivilegePointScreenState extends State<PrivilegePointScreen> {
  bool? innerBoxIsScrolled;

  int segmentedControlValue = 0;

  final PageController _pageViewController = PageController();

  List<Widget> widgets = [
    const LoyaltyPointScreen(),
    const PiointEmptyState(
      title: 'No transaction yet!',
      description:
          'Lorem ipsum dolor sit amet consecteture cuis mollis turbime.',
    ),
    // const RecentPointScreen()
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6!;

    return CupertinoScaffold(
      body: Builder(builder: (context) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   // title: const Text('My Point'),
          // ),
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          body: NestedScrollView(
            headerSliverBuilder: (((context, innerBoxIsScrolled) => [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      title: const Text('My Point'),
                      expandedHeight: 180,
                      centerTitle: true,
                      floating: false,
                      pinned: true,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      forceElevated: true,
                      scrolledUnderElevation: 0,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        systemNavigationBarColor: Colors.amber,
                        statusBarColor: Colors.red,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.none,
                        background: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xff384593),
                                Color(0xff3588E8),
                              ],
                            ),
                          ),
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 20,
                                left: 285,
                                child: SvgPicture.asset(
                                  'assets/images/svgfile/union_point.svg',
                                  color: Colors.black12,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 120, left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Current Points',
                                          style: textStyle.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '0',
                                          style: textStyle.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'As of 23 December 2022',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xfff2f2f2)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Color(0xff384593),
                      Color(0xff3588E8),
                    ]
                    // stops: const []
                    // colors: <Color>[Color(0xff0685cf), Color(0xff0f50a4)],
                    ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(14.0),
                  topLeft: Radius.circular(14.0),
                ),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 120),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14.0),
                      topLeft: Radius.circular(14.0),
                    ),
                    color: Color(0xffFAFAFA),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[400]),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        width: double.infinity,
                        child: CupertinoSlidingSegmentedControl(
                            groupValue: segmentedControlValue,
                            backgroundColor:
                                const Color(0xff252552).withOpacity(0.1),
                            children: const <int, Widget>{
                              0: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Loyalty reward point'),
                              ),
                              1: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Recent activities'),
                              ),
                            },
                            onValueChanged: (int? value) {
                              segmentedControlValue = value!;
                              _pageViewController.animateToPage(
                                  segmentedControlValue,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.fastOutSlowIn);
                              setState(() {});
                            }),
                      ),
                      Expanded(
                        child: PageView(
                          controller: _pageViewController,
                          onPageChanged: (value) {
                            // debugPrint('heloo${_pageViewController.initialPage}');
                            if (_pageViewController.page == 0) {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  'Loyalty reward point');
                            } else {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  'Recent activities');
                            }

                            segmentedControlValue = value;
                            setState(() {});
                          },
                          children: widgets,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
