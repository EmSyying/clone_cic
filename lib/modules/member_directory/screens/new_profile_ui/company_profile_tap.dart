import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/new_perional_profile/custom_company_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProfileTab extends StatefulWidget {
  final int? id;
  const CompanyProfileTab({Key? key, this.id}) : super(key: key);

  @override
  State<CompanyProfileTab> createState() => _CompanyProfileTabState();
}

class _CompanyProfileTabState extends State<CompanyProfileTab> {
  final memberCon = Get.put(MemberController());
  // final companyCon = Get.put(NewProfileController());
  bool isHideAddress = false;
  int page = 1;

  Future onRefresh() async {
    page = 1;
  }

  onGetMore() {
    setState(() {
      page++;
    });
  }
  // onGetMoreData() {
  //   memberCon.profilePage.value += 1;
  //   memberCon.fetchCompanyMember(id: widget.id);
  // }

  // Future<void> onRefresh() async {
  //   if (widget.isEdiable == true) {
  //     memberCon.fetchCompanyMember();
  //     setState(() {
  //       isHideAddress = widget.isHidenAddress!;
  //     });
  //   } else {
  //     memberCon.fetchCompanyMemberDetail(widget.id!);
  //     setState(() {
  //       isHideAddress = widget.isHidenAddress!;
  //     });
  //   }
  //   setState(() {
  //     isHideAddress = widget.isHidenAddress!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      memberCon.fetchCompanyMember(id: widget.id);
    }

    return GetBuilder(
        init: MemberController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: memberCon.companyDataList.isEmpty
                ? const CustomEmptyState()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        memberCon.companyDataList.asMap().entries.map((e) {
                      return CustomCompanyTap(
                        imageProfile: e.value.companyLogo,
                        companyName: e.value.companyName,
                        title: 'heloo',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam ultricies interdum lectus eget facilisis aliquam.',
                        image:
                            'https://www.khmertimeskh.com/wp-content/uploads/2019/11/Youk-Chamroeunrith-Chairman-of-Forte-Life-Assurance-Cambodia-L-and-Kuy-Vat-Siv-Channa-1.jpg',
                        phone: e.value.phoneNumber ?? '',
                        email: e.value.email ?? '',
                        address: e.value.address ?? '',
                        website: e.value.website ?? '',
                      );
                    }).toList(),
                  ),
            //   ),
            // ),
          );
        });
  }
}
