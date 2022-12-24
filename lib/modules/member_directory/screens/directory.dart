import 'dart:async';

import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/modules/member_directory/screens/filter.dart';
import 'package:cicgreenloan/modules/member_directory/screens/new_profile_ui/new_persional_profile.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/firebase_analytics.dart';
import '../../../utils/helper/cic/cic_guider.dart';
import '../../../widgets/member_directory/member_card.dart';
import '../../../widgets/member_directory/member_shimmer.dart';
import '../../guilder/guider_controller.dart';

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
  //dependancy
  final memberController = Get.put(MemberController());
  final filterCategories = Get.put(DocumentCategory());
  final _guideController = Get.put(CiCGuidController());
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<List<Member>>? memberListFuture;

  String searchFilter = '';
  String pageName = 'memberList';

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
    memberController.currentPages(1);
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

  final simpleListFilter = <String>[
    'UX/UI',
    'Information Technology',
    'Flutter',
    'Z1 Flexible',
    'CIC Member'
  ];

  _showGuildLine() {
    CiCApp.showOverlays(
      itemCount: _guideController.directoryGuide.length,
      key: (index) => _guideController.directoryGuide[index].key!,
      titleBuilder: (index) => _guideController.directoryGuide[index].title,
      descriptionBuilder: (index) =>
          _guideController.directoryGuide[index].description,
      objectSettingBuilder: (index) => ObjectSetting(
        edgeInsets:
            index == 0 ? const EdgeInsets.only(left: 40) : EdgeInsets.zero,
        paddingSize: index == 0 ? const Size(-80, 0) : const Size(15, 20),
      ),
      context: context,
    );
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: _showAppbar(),
        body: ConnectivityWidgetWrapper(
          stacked: false,
          alignment: Alignment.bottomCenter,
          offlineWidget: Column(
            children: [
              CustomAppBar(
                isLeading: true,
                context: context,
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0.0,
                title: 'Directory',
              ),
              const Expanded(
                child: OfflineWidget(),
              ),
            ],
          ),
          child: Obx(() => NotificationListener(
                onNotification: (ScrollEndNotification notification) {
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    debugPrint('IS next ${memberController.next.value}');
                    memberController.next.value ? onGetMoreData() : null;
                    return true;
                  }
                  return false;
                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      backgroundColor: AppColor.backgroundColor,
                      expandedHeight: 80,
                      floating: true,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.none,
                        stretchModes: const [StretchMode.zoomBackground],
                        background: _showSearchFromDirectory(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: RefreshIndicator(
                        key: _refreshKey,
                        onRefresh: onRefreshFetchMember,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            memberController.fetchAllMemberLoading.value
                                ? _showShimmer()
                                : memberController.listAllMember.isEmpty
                                    ? _showEmptyState()
                                    : ListView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: true,
                                        padding: EdgeInsets.only(
                                            bottom: 20,
                                            top:
                                                widget.fromPage == 'tradeScreen'
                                                    ? 0
                                                    : 5),
                                        children: memberController.listAllMember
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
                                                          widget
                                                              .onTap!(e.value);
                                                          Navigator.pop(
                                                              context);

                                                          // print(item![index].name);
                                                        }
                                                      : () {
                                                          FirebaseAnalyticsHelper
                                                              .sendAnalyticsEvent(
                                                                  'Directory Profile ${e.value.name!}');

                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         NewPeronalProfile(
                                                          //       isDirectory:
                                                          //           true,
                                                          //       id: e.value.id,
                                                          //       imgUrl: e.value
                                                          //           .photo,
                                                          //     ),
                                                          //   ),
                                                          // );
                                                          context.go(
                                                              '/directory/${e.value.id}?isDirectory=true&imgUrl=${e.value.photo}');
                                                        },
                                                  child: Container(
                                                    color: Colors.white,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15,
                                                            bottom: 15),
                                                    child: MemberCard(
                                                      // isSelected: false,
                                                      member: e.value,
                                                    ),
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
                            showLoadingMore()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildFilterChip({String? text, GestureTapCallback? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.14),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text ?? 'Information Technology',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 12, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(
                'assets/images/svgfile/wrong.svg',
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      );

  Widget _showFilter() {
    return GestureDetector(
      key: _guideController.directoryGuide[1].key = GlobalKey(),
      onTap: () {
        FirebaseAnalyticsHelper.sendAnalyticsEvent('Directory Filter');
        memberController.mapList.clear();
        onNavigatorToFilter();
      },
      child: SvgPicture.asset(
        'assets/images/svgfile/new_filter.svg',
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  _showAppbar() {
    return widget.fromPage != 'tradeScreen'
        ? CustomAppBar(
            isLogo: false,
            isLeading: true,
            context: context,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            title: 'Directory',
            action: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    _scrollController
                        .animateTo(0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear)
                        .then((value) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        _showGuildLine();
                      });
                    });
                    // await LocalData.storeAppTou('appTour', true);
                  },
                  child: SvgPicture.asset('assets/images/demo.svg'),
                ),
              ),
            ],
          )
        : null;
  }

  Widget _showSearchFromDirectory() => Obx(
        () => Container(
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: FocusScope(
            child: Focus(
              onFocusChange: (focus) {
                // this code use for user focus on textfield
                Future.delayed(const Duration(seconds: 1), () {
                  _guideController.isFocus.value = focus;
                });
                _guideController.update();
                debugPrint("is Focus:${_guideController.isFocus.value}");
                debugPrint("is Focus1:${_guideController.isFocus.value}");
              },
              child: TextFormField(
                key: _guideController.isFocus.value
                    ? null
                    : _guideController.directoryGuide[0].key =
                        GlobalKey<FormFieldState>(),
                controller: memberController.searchTextFieldController.value,
                onChanged: _onChangeHandler,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: SvgPicture.asset(
                      'assets/images/svgfile/directory_search.svg',
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(minWidth: 35),
                  suffixIconConstraints: const BoxConstraints(minWidth: 46),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 20,
                        width: 1,
                        color: const Color(0xffafafaf).withOpacity(0.25),
                      ),
                      _showFilter(),
                    ],
                  ),

                  hintText: 'Search By First Name , Last Name, . . . ',
                  hintStyle: const TextStyle(color: AppColor.chartLabelColor),
                  border: InputBorder.none,
                  fillColor: const Color(0xffAFAFAF).withOpacity(0.25),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // contentPadding: const EdgeInsets.all(10),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _showShimmer() {
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
            margin:
                const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 10),
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

  Widget _showEmptyState() {
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
