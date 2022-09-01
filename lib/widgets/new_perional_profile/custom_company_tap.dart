import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../modules/member_directory/controllers/new_personal_profile/new_profile_controller.dart';

class CustomCompanyTap extends StatelessWidget {
  final String? companyName;
  final String? title;
  final String? imageProfile;
  final String? description;
  final String? image;
  final String? phone;
  final String? email;
  final String? address;
  final String? website;
  final String? editCompany;
  final GestureTapCallback? onTapEdit;
  final GestureTapCallback? onTapPhone;
  final GestureTapCallback? onTapEmail;
  final GestureTapCallback? onTapAddress;
  final GestureTapCallback? onTapAssociate;

  final bool? isEdiable;
  final bool? isHidenAddress;
  final int? id;
  const CustomCompanyTap(
      {Key? key,
      this.companyName,
      this.title,
      this.imageProfile,
      this.description,
      this.image,
      this.isEdiable,
      this.isHidenAddress,
      this.id,
      this.phone,
      this.email,
      this.address,
      this.website,
      this.onTapPhone,
      this.onTapEmail,
      this.onTapAddress,
      this.onTapAssociate,
      this.editCompany,
      this.onTapEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isHideAddress = false;
    final pageController = SwiperController();
    //  final memberCon = Get.put(MemberController());
    final companyCon = Get.put(NewProfileController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[200]!),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        '$imageProfile',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$companyName',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$title',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                color: Colors.white,
                offset: const Offset(0, 35),
                padding: EdgeInsets.zero,
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                icon: const Icon(
                  Icons.more_vert,
                  size: 22,
                  color: Colors.black,
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  if (phone != null && phone != '')
                    PopupMenuItem(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onTapPhone!();
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 49,
                          child: Row(
                            children: [
                              const SizedBox(width: 18.0),
                              SvgPicture.asset(
                                  'assets/images/svgfile/phone_border.svg'),
                              const SizedBox(width: 15.0),
                              Expanded(
                                child: Text(
                                  "$phone",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.darkColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const PopupMenuDivider(height: 0),
                  if (email != null && email != '')
                    PopupMenuItem(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onTapEmail!();
                        },
                        child: Container(
                          height: 49,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              const SizedBox(width: 18.0),
                              SvgPicture.asset(
                                  'assets/images/svgfile/message_border.svg'),
                              const SizedBox(width: 15.0),
                              Expanded(
                                child: Text(
                                  "$email",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.darkColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  const PopupMenuDivider(height: 0),
                  if (address != null && address != '')
                    PopupMenuItem(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onTapAddress!();
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 49,
                          child: Row(
                            children: [
                              const SizedBox(width: 18.0),
                              SvgPicture.asset(
                                  'assets/images/svgfile/location_border.svg'),
                              const SizedBox(width: 15.0),
                              Expanded(
                                child: Text(
                                  "$address",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.darkColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const PopupMenuDivider(height: 0),
                  if (website != null && website != '')
                    PopupMenuItem(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onTapAssociate!();
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 49,
                          child: Row(
                            children: [
                              const SizedBox(width: 18.0),
                              SvgPicture.asset(
                                  'assets/images/svgfile/web_border.svg'),
                              const SizedBox(width: 15.0),
                              Expanded(
                                child: Text(
                                  "$website",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.darkColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const PopupMenuDivider(height: 0),
                  if (editCompany != null && editCompany != '')
                    PopupMenuItem(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onTapEdit!();
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 49,
                          child: Row(
                            children: [
                              const SizedBox(width: 18.0),
                              SvgPicture.asset(
                                'assets/images/svgfile/edit_profile.svg',
                                color: AppColor.mainColor,
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(width: 15.0),
                              Expanded(
                                child: Text(
                                  "$editCompany",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.mainColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'About',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 20, top: 10, bottom: 20, left: 20),
          child: Text(
            '$description',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent),
          margin: const EdgeInsets.only(right: 20, bottom: 20, left: 20),
          child: AspectRatio(
            aspectRatio: 5 / 2.3,
            child: Swiper(
              scale: 0.9,
              controller: pageController,
              itemCount: 3,
              // autoplay: true,
              onIndexChanged: (index) {
                companyCon.indexSlide.value = index;
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '$image',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
        Divider(
          thickness: 1.2,
          color: Colors.grey[200],
        )
      ],
    );
  }
}
