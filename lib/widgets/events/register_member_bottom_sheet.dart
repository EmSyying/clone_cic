import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/event_module/models/registered_member.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/modules/member_directory/models/personal_profile_model.dart/personal_profile_model.dart';
import 'package:cicgreenloan/widgets/events/registered_member.dart';
import 'package:cicgreenloan/widgets/member_directory/member_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegisterMember extends StatefulWidget {
  final int? eventID;
  const RegisterMember({Key? key, this.eventID}) : super(key: key);
  @override
  State<RegisterMember> createState() => _RegisterMemberState();
}

class _RegisterMemberState extends State<RegisterMember> {
  final memberController = Get.put(MemberController());
  final customerController = Get.put(CustomerController());
  final registerMemberController = Get.put(EventController());

  // bool isTicked = false;
  Future<List<PersonalProfile>>? memberListFuture;
  Future<List<RegistrationEventData>>? registeredMemberList;
  int page = 1;
  bool isLoadingMore = false;
  String searchFilter = '';
  int searchPage = 1;
  String pageName = 'memberList';

  @override
  void initState() {
    memberController.fetchAllMembers();
    memberController.update();
    registerMemberController.registeredDataList.clear();
    registerMemberController.fetchAllRegisteredMemeber('${widget.eventID}');
    memberController.memberList.clear();
    memberListFuture = memberController.fetchAllMembers();
    memberController.page.value = 0;
    // removeUser('current_user');
    super.initState();
  }

  // Future fetchMore() async {
  //   setState(() {
  //     page++;
  //   });
  //   if (searchFilter.isNotEmpty) {
  //     setState(() {
  //       searchPage++;
  //     });
  //     debugPrint("Fetch all members1: ");

  //     memberController.fetchAllMembers(
  //         filter: searchFilter, pageNumber: searchPage);
  //   } else if (pageName == 'filterPage') {
  //     debugPrint("Fetch all members2: ");
  //     memberController.fetchAllMembers(
  //         filterJson: memberController.mapList.toString(), pageNumber: page);
  //   } else {
  //     memberController.fetchAllMembers(pageNumber: page);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded(
        //   child: FutureBuilder<List<RegistrationEventData>>(
        //     future: registeredMemberList,
        //     builder: (BuildContext context,
        //         AsyncSnapshot<List<RegistrationEventData>> snapshot) {
        //       if (snapshot.hasData &&
        //           registerMemberController.registermemberList.isNotEmpty &&
        //           snapshot.connectionState == ConnectionState.done) {
        //         return NotificationListener<ScrollEndNotification>(
        //           onNotification: (ScrollEndNotification scrollInfo) {
        //             if (scrollInfo.metrics.pixels ==
        //                     scrollInfo.metrics.maxScrollExtent &&
        //                 !registerMemberController
        //                     .isLoadingregisteredMember.value) {
        //               debugPrint("Loading more data: =======");
        //               fetchMore();
        //               // print(
        //               // 'Is scrolling------------------------');
        //             }
        //             return false;
        //           },
        //           child: Obx(
        //             () => (ListView.separated(
        //                 padding: const EdgeInsets.symmetric(vertical: 10),
        //                 itemBuilder: (context, index) {
        //                   return RegisteredMemberCard(
        //                     eventMember: registerMemberController
        //                         .registermemberList[index],
        //                   );
        //                 },
        //                 separatorBuilder: (context, index) {
        //                   return const Divider(
        //                     thickness: 1,
        //                   );
        //                 },
        //                 itemCount: registerMemberController
        //                     .registermemberList.length)),
        //           ),
        //         );
        //       }
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return ListView.builder(
        //           shrinkWrap: true,
        //           padding: const EdgeInsets.only(top: 0),
        //           itemCount: 10,
        //           itemBuilder: (context, index) {
        //             return const MemberShimmer();
        //           },
        //         );
        //       }
        //       if (snapshot.connectionState == ConnectionState.done &&
        //           memberController.memberList.isEmpty) {
        //         return Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             SvgPicture.asset('assets/images/svgfile/noDirectory.svg'),
        //             const SizedBox(
        //               height: 40,
        //             ),
        //             Text(
        //               'No Member Found',
        //               style: TextStyle(
        //                   color: Get.theme.brightness == Brightness.light
        //                       ? Colors.black
        //                       : Colors.white,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 22),
        //             ),
        //           ],
        //         );
        //       }
        //       return Container();
        //     },
        //   ),
        // ),
        Expanded(
          child: Obx(
            () => registerMemberController.isLoadingregisteredMember.value &&
                    registerMemberController.registeredDataList.isEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const MemberShimmer();
                    },
                  )
                : Stack(
                    children: [
                      NotificationListener<ScrollEndNotification>(
                          onNotification: (ScrollEndNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels ==
                                    scrollInfo.metrics.maxScrollExtent &&
                                !registerMemberController
                                    .isLoadingregisteredMember.value) {
                              if (registerMemberController
                                      .registeredModel.value.links!.next !=
                                  null) {
                                registerMemberController.pageNo.value += 1;
                                registerMemberController
                                    .fetchAllRegisteredMemeber(
                                        widget.eventID.toString());
                              }
                            }
                            return false;
                          },
                          child: !registerMemberController
                                      .isLoadingregisteredMember.value &&
                                  registerMemberController
                                      .registeredDataList.isNotEmpty
                              ? (ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  itemBuilder: (context, index) {
                                    return RegisteredMemberCard(
                                      eventMember: registerMemberController
                                          .registeredDataList[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      thickness: 1,
                                    );
                                  },
                                  itemCount: registerMemberController
                                      .registeredDataList.length))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/svgfile/noDirectory.svg'),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      'No Member Registerd',
                                      style: TextStyle(
                                          color: Get.theme.brightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ],
                                )),
                      if (registerMemberController
                          .isLoadingMoreRegisteredMember.value)
                        const Positioned(
                          bottom: 30,
                          right: 0,
                          left: 0,
                          child: CupertinoActivityIndicator(),
                        ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
