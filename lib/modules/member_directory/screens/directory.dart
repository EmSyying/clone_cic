import 'dart:async';
import 'dart:io';

import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/modules/member_directory/screens/filter.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/firebase_analytics.dart';
import '../../../Utils/helper/screen_agrument/member_screen_argument.dart';
import '../../../widgets/member_directory/member_card.dart';
import '../../../widgets/member_directory/member_shimmer.dart';
import 'member_detail.dart';

class Directory extends StatefulWidget {
  final bool? isNavigator;
  final int? isShowCiCTeam;
  final String? fromPage;
  final Function? onTap;
  const Directory({
    Key? key,
    this.isNavigator,
    this.fromPage,
    this.onTap,
    this.isShowCiCTeam,
  }) : super(key: key);
  @override
  State<Directory> createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  final memberController = Get.put(MemberController());
  final filterCategories = Get.put(DocumentCategory());
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<List<Member>>? memberListFuture;

  String searchFilter = '';
  String pageName = 'memberList';

  ///Old Code
  // Future<void> onRefresh() async {
  //   if (searchFilter.isEmpty) {
  //     memberController.memberList.clear();
  //     memberController.page.value = 0;
  //     memberController.memberResult.value = 0;
  //     memberController.memberCurrentPage.value = 1;
  //     memberController.memberLastPage.value = 3;
  //     memberController.mapList.clear();
  //     if (widget.isShowCiCTeam != null) {
  //       memberController.fetchAllMembers(isShowCiCTeam: 1);
  //       memberController.onFetchAllMember(page: 1);
  //     } else {
  //       memberController.fetchAllMembers();
  //       memberController.onFetchAllMember(page: 1);
  //     }
  //   }
  // }

  @override
  void dispose() {
    if (widget.fromPage != 'tradeScreen') {
      memberController.searchTextFieldController.value.text = '';
      memberController.textFieldSearch('');
    }
    super.dispose();
  }

  @override
  void initState() {
    ///virak
    memberController.currentPages(1);
    // memberController.searchTextFieldController.value.text =
    //     memberController.textFieldSearch.value;
    if (widget.fromPage == 'tradeScreen') {
      memberController.onFetchAllMember(
          page: 1,
          showCICteam: false,
          hideMe: true,
          filter: memberController.textFieldSearch.value);
    } else {
      memberController.searchTextFieldController.value.text = '';
      memberController.onFetchAllMember(page: 1);
    }
    super.initState();
  }

  ///on this not happanded in Trading Screen
  Future<void> onNavigatorToFilter() async {
    memberController.mapList.clear();
    memberController.memberList.clear();
    memberController.memberResult.value = 0;
    setState(() {
      pageName = 'filterPage';
    });
    var result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => const Filter(),
      ),
    );
    debugPrint('Result : ${memberController.mapList}');

    if (result!) {
      if (memberController.memberList.isEmpty) {
        setState(() {
          pageName = 'memberList';
        });
      }
      if (widget.isShowCiCTeam != null) {
        memberController.fetchAllMembers(isShowCiCTeam: 1);
      } else {
        memberController.fetchAllMembers();
      }
    }
  }

  // tola code
  Timer? searchOnStoppedTyping;

  _onChangeHandler(value) {
    memberController.textFieldSearch.value = value;
    const duration = Duration(
        milliseconds:
            800); // set the duration that you want call search() after that.
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel()); // clear timer
    }
    setState(
        () => searchOnStoppedTyping = Timer(duration, () => onSearch(value)));
  }

  onSearch(String textEntered) {
    if (textEntered.isNotEmpty) {
      if (widget.fromPage == 'tradeScreen') {
        memberController.onFetchAllMember(
            page: 1, showCICteam: false, hideMe: true, filter: textEntered);
      } else {
        memberController.onFetchAllMember(page: 1, filter: textEntered);
      }
      // memberController.onFetchAllMember(page: 1, filter: textEntered);
    } else {
      if (widget.fromPage == 'tradeScreen') {
        memberController.onFetchAllMember(
            page: 1, showCICteam: false, hideMe: true);
      } else {
        memberController.onFetchAllMember(page: 1);
      }
    }
  }

  File? imageFiles;

  String? search;

  ///virak code
  onGetMoreData() {
    debugPrint("onGetMoreData()  ${memberController.currentPages.value}");
    memberController.currentPages.value += 1;
    if (widget.fromPage == 'tradeScreen') {
      memberController.onFetchAllMember(
          page: memberController.currentPages.value,
          showCICteam: false,
          hideMe: true);
    } else {
      memberController.onFetchAllMember(
          page: memberController.currentPages.value);
    }
  }

  Future onRefreshFetchMember() async {
    // memberController.searchTextFieldController.value.text = '';
    memberController.currentPages(1);
    if (widget.fromPage == 'tradeScreen') {
      memberController
          .onFetchAllMember(page: 1, showCICteam: false, hideMe: true)
          .then((value) {
        memberController.textFieldSearch('');
        memberController.searchTextFieldController.value.text = '';
      });
    } else {
      memberController.onFetchAllMember(page: 1).then((value) {
        memberController.textFieldSearch('');
        memberController.searchTextFieldController.value.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: WillPopScope(
        onWillPop: () async =>
            widget.isNavigator != null && widget.isNavigator! ? true : false,
        child: Scaffold(
          body: ConnectivityWidgetWrapper(
            stacked: false,
            alignment: Alignment.bottomCenter,
            offlineWidget: Column(
              children: [
                CustomAppBar(
                    isLeading: true,
                    context: context,
                    backgroundColor: Theme.of(context).backgroundColor,
                    elevation: 0.0,
                    title: 'Directory'),
                const Expanded(child: OfflineWidget()),
              ],
            ),
            child: Obx(
              () => Stack(
                children: [
                  const SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                  ),

                  ///
                  showSearchFromDirectory(),
                  showSearchFromTradeScreen(),

                  ///show left filter icon
                  widget.fromPage != 'tradeScreen'
                      ? Positioned(
                          top: 89,
                          left: 15,
                          child: SizedBox(
                            height: 50.0,
                            child: SvgPicture.asset(
                              'assets/images/svgfile/filterIcon.svg',
                              height: 25,
                            ),
                          ),
                        )
                      : const SizedBox(),

                  ///show filter
                  showFilter(),

                  Positioned(
                    top: widget.fromPage != 'tradeScreen' ? 155 : 80,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: RefreshIndicator(
                        key: _refreshKey,
                        onRefresh: onRefreshFetchMember,
                        child: Column(
                          children: [
                            Expanded(
                              child: memberController
                                      .fetchAllMemberLoading.value
                                  ? showShimmer()
                                  : memberController.listAllMember.isEmpty
                                      ? showEmptyState()
                                      : NotificationListener<
                                          ScrollEndNotification>(
                                          onNotification: (notification) {
                                            if (notification.metrics.pixels ==
                                                notification
                                                    .metrics.maxScrollExtent) {
                                              debugPrint(
                                                  'IS next ${memberController.next.value}');
                                              memberController.next.value
                                                  ? onGetMoreData()
                                                  : null;
                                              return true;
                                            }
                                            return false;
                                          },
                                          child: ListView(
                                            padding: EdgeInsets.only(
                                                bottom: 20,
                                                top: widget.fromPage ==
                                                        'tradeScreen'
                                                    ? 0
                                                    : 5),
                                            children: memberController
                                                .listAllMember
                                                .asMap()
                                                .entries
                                                .map(
                                              (e) {
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: widget.fromPage ==
                                                              'tradeScreen'
                                                          ? () {
                                                              FirebaseAnalyticsHelper
                                                                  .sendAnalyticsEvent(
                                                                      'Trading ${e.value.name!}');
                                                              widget.onTap!(
                                                                  e.value);
                                                              Navigator.pop(
                                                                  context);

                                                              // print(item![index].name);
                                                            }
                                                          : () {
                                                              FirebaseAnalyticsHelper
                                                                  .sendAnalyticsEvent(
                                                                      'Directory Profile ${e.value.name!}');

                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MemberDetail(
                                                                    memberDetailAgrument:
                                                                        MemberDetailAgrument(
                                                                      pageName:
                                                                          'memberList',
                                                                      isNavigator:
                                                                          true,
                                                                      id: e
                                                                          .value
                                                                          .id,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                      child: MemberCard(
                                                        // isSelected: false,
                                                        member: e.value,
                                                      ),
                                                    ),

                                                    ///Divider
                                                    e.key !=
                                                            memberController
                                                                    .listAllMember
                                                                    .length -
                                                                1
                                                        ? const Divider(
                                                            height: 0,
                                                            thickness: 1,
                                                          )
                                                        : const SizedBox()
                                                  ],
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ),
                            ),
                            showLoadingMore()
                          ],
                        ),
                      ),
                    ),
                  ),
                  showAppbar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showFilter() {
    return widget.fromPage != 'tradeScreen'
        ? Positioned(
            top: 89,
            right: 15,
            child: GestureDetector(
              onTap: () {
                FirebaseAnalyticsHelper.sendAnalyticsEvent('Directory Filter');
                memberController.mapList.clear();
                onNavigatorToFilter();
              },
              child: SizedBox(
                height: 50.0,
                child: SvgPicture.asset(
                  'assets/images/svgfile/Icon-Filter.svg',
                  height: 35,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget showAppbar() {
    return widget.fromPage != 'tradeScreen'
        ? Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: CustomAppBar(
                isLogo: false,
                isLeading: true,
                context: context,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: 'Directory'),
          )
        : const SizedBox();
  }

  Widget showSearchFromTradeScreen() {
    return widget.fromPage == 'tradeScreen'
        ? Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: const Color(0xffAFAFAF).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/searchicon.svg',
                    height: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller:
                          memberController.searchTextFieldController.value,
                      onChanged: _onChangeHandler,
                      decoration: InputDecoration(
                          hintText: 'Search By First Name , Last Name, . . . ',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

  Widget showSearchFromDirectory() {
    return widget.fromPage != 'tradeScreen'
        ? Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 155,
              width: double.infinity,
              color: context.theme.backgroundColor,
              child: Container(
                margin: const EdgeInsets.only(left: 55, right: 55, top: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 62,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/svgfile/search.svg',
                            height: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: memberController
                                  .searchTextFieldController.value,
                              onChanged: _onChangeHandler,
                              decoration: InputDecoration(
                                  hintText:
                                      'Search By First Name , Last Name, . . . ',
                                  hintStyle:
                                      const TextStyle(color: Colors.white54),
                                  border: InputBorder.none,
                                  fillColor: Colors.grey[300],
                                  contentPadding: const EdgeInsets.all(10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  Widget showShimmer() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const MemberShimmer();
      },
    );
  }

  Widget showLoadingMore() {
    return memberController.fetchMoreMemberLoading.value
        ? Container(
            margin: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Loading more Data',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  width: 10,
                ),
                const CupertinoActivityIndicator(),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget showLoading() {
    return memberController.isloadingMore.value || memberController.isEmty.value
        ? Container(
            margin: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Loading more Data',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  width: 10,
                ),
                const CupertinoActivityIndicator(),
              ],
            ),
          )
        : Container();
  }

  Widget showEmptyState() {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/svgfile/noDirectory.svg'),
            const SizedBox(
              height: 40,
            ),
            Text(
              'No Directory Found',
              style: TextStyle(
                  color: Get.theme.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Here’s where you’ll find the newest',
              style: TextStyle(
                color: Get.theme.brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            Text(
              'update of member profile',
              style: TextStyle(
                color: Get.theme.brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}