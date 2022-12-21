import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCompanyTap extends StatelessWidget {
  final String? companyName;
  final String? slogan;
  final String? imageProfile;
  final String? description;

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
  final String? productService;

  final bool? isEdiable;
  final bool? isHidenAddress;
  final int? id;
  final List<String>? image;
  final bool? isDirectories;
  const CustomCompanyTap(
      {Key? key,
      this.isDirectories = false,
      this.companyName,
      this.slogan,
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
      this.onTapEdit,
      this.productService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final pageController = SwiperController();
    // final companyCon = Get.put(NewProfileController());
    // int currentIndex = 0;
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
                    Padding(
                      padding: slogan == null || slogan == ''
                          ? const EdgeInsets.only(top: 20)
                          : EdgeInsets.zero,
                      child: Text(
                        '$companyName',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      '$slogan',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              if (phone != '' &&
                      email != '' &&
                      address != '' &&
                      website != '' ||
                  isDirectories == false)
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
                    if (isDirectories == false)
                      const PopupMenuDivider(height: 0),
                    if (editCompany != null &&
                        editCompany != '' &&
                        isDirectories == false)
                      PopupMenuItem(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: GestureDetector(
                          onTap: () {
                            // if (memberCon.company.value.companyLogo == '') {
                            //   uploadImageCon.imageFile.value = File('');
                            // },
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
                                  color: Theme.of(context).primaryColor,
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
                                          color: Theme.of(context).primaryColor,
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
        if (description != '' && description != null)
          const SizedBox(
            height: 20,
          ),
        if (description != '' && description != null)
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
          padding: description != '' && description != null
              ? const EdgeInsets.only(right: 20, top: 10, bottom: 20, left: 20)
              : EdgeInsets.zero,
          child: Text(
            '$description',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        if (productService != '' && productService != null)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Product and Service',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        Padding(
          padding: productService != '' && productService != null
              ? const EdgeInsets.only(right: 20, top: 10, bottom: 20, left: 20)
              : EdgeInsets.zero,
          child: Text(
            '$productService',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: Colors.transparent),
        //   margin: const EdgeInsets.only(right: 20, bottom: 20, left: 20),
        //   child: Stack(
        //     alignment: Alignment.bottomCenter,
        //     children: [
        //       AspectRatio(
        //         aspectRatio: 5 / 2.3,
        //         child: Swiper(
        //           scale: 0.9,
        //           controller: pageController,
        //           itemCount: 3,
        //           // autoplay: true,
        //           onIndexChanged: (index) {
        //             companyCon.indexSlide.value = index;
        //           },
        //           itemBuilder: (context, index) {
        //             currentIndex = index;
        //             return ClipRRect(
        //               borderRadius: BorderRadius.circular(10),
        //               child: Image.network(
        //                 image![index],
        //                 fit: BoxFit.cover,
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //       Obx(() => Positioned(
        //             bottom: 10,
        //             child: SmoothIndicator(
        //               offset: companyCon.indexSlide.value.toDouble(),
        //               count: image!.length,
        //               effect: const ExpandingDotsEffect(
        //                   dotColor: Colors.white54,
        //                   activeDotColor: Colors.white,
        //                   dotHeight: 8,
        //                   dotWidth: 8),
        //             ),
        //           )),
        //     ],
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Divider(
            thickness: 1.2,
            color: Colors.grey[200],
          ),
        )
      ],
    );
  }
}
