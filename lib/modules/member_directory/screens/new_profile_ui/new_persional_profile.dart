import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/member_directory/screens/new_profile_ui/company_profile_tap.dart';
import 'package:cicgreenloan/modules/member_directory/screens/new_profile_ui/personal_profile_tap.dart';
import 'package:cicgreenloan/modules/setting_modules/screens/settings_screen.dart';
import 'package:cicgreenloan/widgets/new_perional_profile/custom_user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/helper/firebase_analytics.dart';
import '../../../../widgets/new_perional_profile/simmer_profile.dart';
import '../../controllers/member_controller.dart';
import 'edit_profile_screen.dart';

class NewPeronalProfile extends StatefulWidget {
  final String? userName;
  final String? position;
  final String? description;
  final int? id;
  const NewPeronalProfile(
      {Key? key, this.userName, this.position, this.description, this.id})
      : super(key: key);

  @override
  State<NewPeronalProfile> createState() => _NewPeronalProfileState();
}

class _NewPeronalProfileState extends State<NewPeronalProfile> {
  final memberCon = Get.put(MemberController());
  bool? isInnerBox = false;
  List<Widget> widgets = [
    const PersonalProfileTap(),
    const CompanyProfileTab(),
  ];
  @override
  void initState() {
    widgets = [
      PersonalProfileTap(
        description: memberCon.personalProfile.value.about ?? '',
      ),
      CompanyProfileTab(
        id: widget.id,
        // description:
        //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam ultricies interdum lectus eget facilisis aliquam.',
        // companyName: memberCon.company.value.companyName ?? '',
        // title: 'Beyond Investment Opportunity',
      ),
    ];
    if (widget.id != null) {
      memberCon.getUserDetail(widget.id!);
    }
    super.initState();
  }

  final PageController _pageViewController = PageController();
  int segmentedControlValue = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: const Text(''),
          backgroundColor: AppColor.mainColor,
          elevation: 0,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const EditProfileScreen();
                      },
                    ),
                  );
                },
                child:
                    SvgPicture.asset('assets/images/svgfile/edit_profile.svg')),
            const SizedBox(
              width: 20,
            ),
            Padding(
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
            ),
          ],
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
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
                  expandedHeight: 280.0,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    background: Obx(
                      () => memberCon.isLoadingQRCode.value
                          ? const SimmmerProfile()
                          : CustomUserProfile(
                              fullName: memberCon
                                      .personalProfilemember.value.fullName ??
                                  '',
                              position: 'Flutter dev',
                              description: 'Z1 Flexible',
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
