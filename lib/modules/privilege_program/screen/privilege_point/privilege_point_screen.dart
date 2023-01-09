import 'package:cicgreenloan/modules/privilege_program/screen/privilege_point/point_emptystate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        return Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                centerTitle: true,
                title: const Text('My Point'),
                titleTextStyle: textStyle,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topRight,
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
                child: SvgPicture.asset(
                  'assets/images/svgfile/union_point.svg',
                  color: Colors.black12,
                  // fit: BoxFit.fill,
                ),
              ),
            ),

            ///experiment
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topLeft,
                child: Container(
                  height: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Points',
                        style: textStyle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '1,000',
                        style: textStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'As of 23 December 2022',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xfff2f2f2)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                // title: const Text('My Point'),
              ),
              body: NestedScrollView(
                headerSliverBuilder: (context, _) => [
                  SliverPersistentHeader(
                    delegate: CustomSliver(height: 140),
                  )
                ],
                body: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14.0),
                      topLeft: Radius.circular(14.0),
                    ),
                    color: Color(0xffFAFAFA),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          'Transactions',
                          style: textStyle.copyWith(
                              color: Colors.black, fontSize: 16),
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
          ],
        );
      }),
    );
  }
}

class CustomSliver extends SliverPersistentHeaderDelegate {
  final double? height;
  CustomSliver({this.height});

  @override
  double get maxExtent => height ?? 0;

  @override
  double get minExtent => height ?? 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const SizedBox.shrink();
  }
}
