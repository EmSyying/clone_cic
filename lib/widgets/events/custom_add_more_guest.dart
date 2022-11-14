import 'package:cicgreenloan/Utils/form_builder/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/form_builder/custom_textformfield.dart';
import '../../modules/event_module/controller/event_controller.dart';
import '../../modules/member_directory/controllers/customer_controller.dart';
import '../../utils/form_builder/dropdow_item.dart';

class CustomAddMoreGuest extends StatelessWidget {
  final GestureTapCallback? onTapDelete;
  final int? addGuest;
  final int? index;
  const CustomAddMoreGuest({
    Key? key,
    this.onTapDelete,
    this.addGuest,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isValidatedCompanyName;
    bool? isValidatedPhoneNubmer;

    final customerController = Get.put(CustomerController());
    final registerMemberController = Get.put(EventController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 20, bottom: 10, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Guest $addGuest',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              // if (addMoreGuest.indexWhere((element) => false) != 1)
              GestureDetector(
                  onTap: onTapDelete,
                  child: SvgPicture.asset(
                    'assets/images/svgfile/deleteIcon.svg',
                    width: 18,
                    height: 18,
                  ))
            ],
          ),
        ),
        CustomTextFieldNew(
          // key: companyNameKey,
          isValidate: isValidatedCompanyName,
          hintText: "Full Name",
          labelText: "Full Name",
          isRequired: true,
          initialValue: '',
          onChange: (value) {
            if (value == "") {
              isValidatedCompanyName = false;
            } else {
              customerController.customer.value.company = value;
              isValidatedCompanyName = true;
            }
          },
        ),
        CustomTextFieldNew(
          // key: phoneNumberKey,
          isValidate: isValidatedPhoneNubmer,
          hintText: "Phone Number",
          labelText: "Phone Number",
          isRequired: true,
          initialValue: '',
          onChange: (value) {
            if (value == "") {
              isValidatedPhoneNubmer = false;
            } else {
              customerController.customer.value.phone = value;
              isValidatedPhoneNubmer = true;
            }
          },
          onSave: (value) {
            if (value == '') {
              customerController.customer.value.phone!;
            } else {
              customerController.customer.value.phone = value;
            }
          },
        ),
        const CICDropdown(
          label: 'Relationship',
          colors: Colors.white,
          isPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          isCompany: false,
          item: [
            DropDownItem(itemList: {
              "Name": 'hello1',
              "Code": "1",
            })
          ],
        ),
      ],
    );
  }
}
