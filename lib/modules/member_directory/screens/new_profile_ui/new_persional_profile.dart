import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/member_directory/screens/new_profile_ui/company_profile_tap.dart';
import 'package:cicgreenloan/modules/member_directory/screens/new_profile_ui/personal_profile_tap.dart';
import 'package:cicgreenloan/modules/setting_modules/screens/settings_screen.dart';
import 'package:cicgreenloan/widgets/new_perional_profile/custom_user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/function/upload_file_controller.dart';
import '../../../../utils/helper/firebase_analytics.dart';
import '../../../../widgets/new_perional_profile/simmer_profile.dart';
import '../../controllers/customer_controller.dart';
import '../../controllers/member_controller.dart';
import 'edit_profile_screen.dart';

class NewPeronalProfile extends StatefulWidget {
  final int? id;

  final bool? isDirectory;
  final String? imgUrl;
  const NewPeronalProfile(
      {Key? key, this.id, this.isDirectory = false, this.imgUrl})
      : super(key: key);

  @override
  State<NewPeronalProfile> createState() => _NewPeronalProfileState();
}

class _NewPeronalProfileState extends State<NewPeronalProfile> {
  final customerUser = Get.put(CustomerController());
  final memberCon = Get.put(MemberController());
  final uploadImageCon = Get.put(UploadFileController());
  bool? isInnerBox = false;
  List<Widget> widgets = [
    const PersonalProfileTap(),
    const CompanyProfileTab(),
  ];
  @override
  void initState() {
    memberCon.fetchMemberPersonProfile(id: widget.id);
    widgets = [
      Obx(
        () => memberCon.isLoadingProfile.value
            ? const Center(child: CircularProgressIndicator())
            : PersonalProfileTap(
                description: memberCon.personalProfile.value.about ?? '',
              ),
      ),
      CompanyProfileTab(
        id: widget.id,
        // description:
        //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam ultricies interdum lectus eget facilisis aliquam.',
        // companyName: memberCon.company.value.companyName ?? '',
        // title: 'Beyond Investment Opportunity',
      ),
    ];
    super.initState();
  }

  final PageController _pageViewController = PageController();
  int segmentedControlValue = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('Built Profile');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: widget.isDirectory == true
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    memberCon.onClearCompany();
                  },
                  icon: const Icon(Icons.close))
              : const Text(''),
          backgroundColor: AppColor.mainColor,
          elevation: 0,
          // title: isInnerBox == true
          //     ? Text(
          //         '${customerUser.customer.value.fullName}',
          //         style: Theme.of(context).textTheme.headline4!.copyWith(
          //             fontWeight: FontWeight.w700,
          //             fontSize: 20,
          //             color: Colors.white),
          //       )
          //     : const Text(''),
          centerTitle: true,
          actions: [
            widget.isDirectory == false
                ? GestureDetector(
                    onTap: () {
                      memberCon.onInitialProfileValue();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return EditProfileScreen(
                              titleDone: 'Done',
                              appBarTitle: 'Edit Profile',
                              onTapPhotoProfile: () {
                                uploadImageCon.uploadImage(context);
                              },
                              id: widget.id,
                              onTapDone: () {
                                setState(
                                  () {
                                    memberCon.updatePersonalProfile(context);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                        'assets/images/svgfile/edit_profile.svg'))
                : Container(),
            const SizedBox(
              width: 20,
            ),
            widget.isDirectory == false
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsScreen()));
                      },
                      child: SvgPicture.asset(
                        'assets/images/svgfile/setting_new.svg',
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            isInnerBox = innerBoxIsScrolled;
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  floating: true,
                  snap: true,
                  excludeHeaderSemantics: true,
                  backgroundColor: AppColor.mainColor,
                  leading: const Text(''),
                  expandedHeight: 270,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    background: Obx(
                      () => customerUser.isloading.value
                          ? const SimmmerProfile()
                          : CustomUserProfile(
                              isDirectories: widget.isDirectory,
                              imgUrl: widget.isDirectory == true
                                  ? widget.imgUrl
                                  : customerUser.customer.value.profile,
                              fullName: widget.isDirectory == true
                                  ? memberCon
                                      .personalProfile.value.customerLatinName
                                  : customerUser.customer.value.fullName,
                              position: widget.isDirectory == true
                                  ? memberCon.personalProfile.value.title
                                  : customerUser.customer.value.title ?? '',
                              description:
                                  customerUser.customer.value.companyName,
                            ),
                    ),
                  ),
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          },
          body: Container(
            padding: const EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl(
                      groupValue: segmentedControlValue,
                      backgroundColor: const Color(0xff252552).withOpacity(0.1),
                      children: const <int, Widget>{
                        0: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Personal Profile'),
                        ),
                        1: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Company Profile'),
                        ),
                      },
                      onValueChanged: (int? value) {
                        segmentedControlValue = value!;
                        _pageViewController.animateToPage(segmentedControlValue,
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
                            'Personal Profile');
                      } else {
                        FirebaseAnalyticsHelper.sendAnalyticsEvent(
                            'Company Profile');
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
    );
  }
}
