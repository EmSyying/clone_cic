import 'dart:async';

import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/member_directory/member_card.dart';
import 'package:cicgreenloan/widgets/member_directory/member_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomInviteMember extends StatefulWidget {
  final int? eventID;
  const CustomInviteMember({Key? key, this.eventID}) : super(key: key);
  @override
  State<CustomInviteMember> createState() => _CustomInviteMemberState();
}

class _CustomInviteMemberState extends State<CustomInviteMember> {
  final memberController = Get.put(MemberController());
  final eventController = Get.put(EventController());

  Future<List<Member>>? memberListFuture;

  int page = 1;
  bool isLoadingMore = false;
  String searchFilter = '';
  Future fetchMore() async {
    setState(() {
      page++;
    });
    if (searchFilter.isNotEmpty) {
      setState(() {
        page = 1;
      });
      if (memberController.isEmty.value) {
        memberController.fetchAllMembers(
            filter: searchFilter, pageNumber: page, eventId: widget.eventID);
      }
    } else {
      memberController.fetchAllMembers(
          pageNumber: page, eventId: widget.eventID);
    }
  }

  Timer? searchOnStoppedTyping;

  _onChangeHandler(value) {
    const duration = Duration(
        milliseconds:
            800); // set the duration that you want call search() after that.
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel()); // clear timer
    }
    setState(
        () => searchOnStoppedTyping = Timer(duration, () => searchText(value)));
  }

  searchText(textSearch) async {
    if (textSearch.isNotEmpty) {
      setState(() {
        searchFilter = textSearch;
      });
      memberController.memberList.clear();

      memberListFuture = memberController.fetchAllMembers(
          filter: textSearch, eventId: widget.eventID);
    }
    if (textSearch.isEmpty) {
      setState(() {});
      memberController.memberList.clear();
      memberController.page.value = 0;
      memberController.memberResult.value = 0;
      memberController.memberCurrentPage.value = 1;
      memberController.memberLastPage.value = 3;
      memberController.mapList.clear();
      searchFilter = '';
      memberListFuture = memberController.fetchAllMembers(
          filter: null, eventId: widget.eventID);
    }
  }

  @override
  void initState() {
    memberController.invitedMemberList.canUpdate;
    memberController.memberList.clear();
    memberListFuture =
        memberController.fetchAllMembers(eventId: widget.eventID);
    memberController.page.value = 0;
    // removeUser('current_user');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: memberController.isLoadingInvite.value == true
            ? Center(
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1.0, 0.0),
                              blurRadius: 6,
                              color: Colors.black12)
                        ]),
                    padding: const EdgeInsets.all(30),
                    child: const CircularProgressIndicator()),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      onChanged: _onChangeHandler,
                      decoration: InputDecoration(
                          //  prefixIcon: SvgPicture.asset(
                          //    'assets/images/svgfile/search.svg',
                          //  ),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none,
                          fillColor: Colors.red,
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Text(
                      'Add a note to your invitation...',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  if (memberController.invitedMemberList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Selected",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: memberController.invitedMemberList
                            .asMap()
                            .entries
                            .map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, right: 10),
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundImage: NetworkImage(
                                            e.value.photo.toString()),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 0,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 10,
                                          child: GestureDetector(
                                            onTap: () {
                                              /////remove invite member
                                              setState(() {
                                                memberController
                                                    .invitedMemberList
                                                    .remove(e.value);
                                                e.value.isTicked = false;
                                                // memberController
                                                //     .onClearInvitedMember(
                                                //         member: e.value);
                                              });
                                            },
                                            child: const Icon(Icons.close,
                                                size: 15, color: Colors.black),
                                          )),
                                    ),
                                  ],
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width: 80,
                                    child: Text(
                                      e.value.name.toString(),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                    ))
                              ],
                            ),
                          );
                        }).toList()),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "Suggested",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder<List<Member>>(
                    future: memberListFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Member>> snapshot) {
                      if (snapshot.hasData &&
                          memberController.memberList.isNotEmpty &&
                          snapshot.connectionState == ConnectionState.done) {
                        return NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification scrollInfo) {
                              if (scrollInfo.metrics.pixels ==
                                      scrollInfo.metrics.maxScrollExtent &&
                                  !memberController.isLoading.value) {
                                fetchMore();
                              }
                              return false;
                            },
                            child: Container(
                              color: Colors.white,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  // physics: rNeverScrollableScrollPhysics(),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  itemBuilder: (context, index) {
                                    memberController.member.value =
                                        memberController.memberList[index];
                                    Member member =
                                        memberController.memberList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        memberController.onSelected(
                                            index: index, member: member);
                                      },
                                      child: MemberCard(
                                        isInvite: true,
                                        isTick: memberController
                                            .memberList[index].isTicked!,
                                        member:
                                            memberController.memberList[index],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      thickness: 1,
                                      color: Colors.grey[200],
                                    );
                                  },
                                  itemCount:
                                      memberController.memberList.length),
                            ));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 0),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const MemberShimmer();
                          },
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done &&
                          memberController.memberList.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/svgfile/noDirectory.svg'),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                'No Directory Found',
                                style: TextStyle(
                                    color:
                                        Get.theme.brightness == Brightness.light
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
                                  color:
                                      Get.theme.brightness == Brightness.light
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                              Text(
                                'update of member profile',
                                style: TextStyle(
                                  color:
                                      Get.theme.brightness == Brightness.light
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  )),
                  Container(
                    // height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: BorderDirectional(
                        top: BorderSide(
                            color: Colors.grey,
                            width: 0.2,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          right: 15.0, top: 20.0, bottom: 30.0, left: 15.0),
                      child: CustomButton(
                          title: "Invite Member",
                          isOutline: false,
                          isDisable:
                              memberController.invitedMemberList.isNotEmpty
                                  ? false
                                  : true,
                          onPressed: memberController
                                  .invitedMemberList.isNotEmpty
                              ? () async {
                                  await memberController.onInvitedEventMember(
                                      context: context,
                                      eventID:
                                          eventController.eventDetail.value.id);
                                  Future.delayed(const Duration(seconds: 3),
                                      () {
                                    Navigator.pop(context);
                                  });
                                }
                              : null),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
