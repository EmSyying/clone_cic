import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/select_address/select_address_controller.dart';

class CustomReviewAddress extends StatefulWidget {
  final bool? isEdit;
  final GestureTapCallback? onTap;
  final String? city;
  final String? village;
  final String? district;
  final String? commune;
  final String? houseNo;
  final String? street;
  final String? permanentCity;
  final String? permanentVillage;
  final String? permanentDistrict;
  final String? permanentCommune;
  final String? titleLabel;
  final String? permanenthouseNo;
  final String? permanentStreet;
  const CustomReviewAddress(
      {Key? key,
      this.onTap,
      this.isEdit,
      this.village,
      this.city,
      this.commune,
      this.district,
      this.houseNo,
      this.street,
      this.permanentCity,
      this.permanentCommune,
      this.permanentDistrict,
      this.permanentStreet,
      this.permanentVillage,
      this.permanenthouseNo,
      this.titleLabel})
      : super(key: key);

  @override
  State<CustomReviewAddress> createState() => _CustomReviewAddressState();
}

class _CustomReviewAddressState extends State<CustomReviewAddress> {
  // final _memberCon = Get.put(MemberController());
  final reqCon = Get.put(RequestLoanController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(
                  0.0,
                  1.0,
                ),
                color: Colors.black12),
          ],
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Text(
                  //   "Address*",
                  //   style: TextStyle(
                  //       fontFamily: 'DMSans',
                  //       fontSize: 16,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w700),
                  // ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Address',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  if (widget.isEdit!)
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(6.0),
                        width: 30,
                        height: 32,
                        child: SvgPicture.asset(
                            'assets/images/svgfile/editedIcon.svg'),
                      ),
                    ),
                ],
              ),
            ),
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              isMultipleLine: true,
              label: 'Current Address:',
              value:
                  "${widget.houseNo != "" ? "${widget.houseNo}, " : ""}${widget.street != "" ? "${widget.street}, " : ""}${widget.village != "" ? "${widget.village}, " : ""}${widget.commune}, ${widget.district}, ${widget.city}",
            ),
            const SizedBox(
              height: 5.0,
            ),
            if (reqCon.selectedAddressOption.value == 1)
              MemberDisplayInfo(
                changeColorText: true,
                isTextAlignRight: true,
                isMultipleLine: true,
                label: 'Permenent Address:',
                value:
                    "${widget.permanenthouseNo != "" ? "${widget.permanenthouseNo}, " : ""}${widget.permanentStreet != "" ? "${widget.permanentStreet}, " : ""}${widget.permanentVillage != "" ? "${widget.permanentVillage}, " : ""}${widget.permanentCommune}, ${widget.permanentDistrict}, ${widget.permanentCity}",
              ),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
