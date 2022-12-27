// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:cicgreenloan/Utils/form_builder/custom_drop_down.dart';

import '../../Utils/form_builder/custom_textformfield.dart';
import '../../Utils/option_controller/option_controller.dart';
import '../../modules/event_module/controller/event_controller.dart';
import '../../modules/member_directory/controllers/customer_controller.dart';
import '../../utils/form_builder/dropdow_item.dart';
import '../get_funding/custom_add_other_label.dart';

class CustomAddMoreGuest extends StatefulWidget {
  final GestureTapCallback? onTapDelete;
  final int? addGuest;
  final int? index;
  final int? relationship;
  String? relationshipDisplay;
  final String? name;
  final String? phone;
  final String? svgDelete;
  final Function(String)? onchangeName;
  final Function(String)? onchangePhone;
  final Function(Map<dynamic, dynamic>)? onchangeRelationship;

  final TextEditingController? textEditing;
  CustomAddMoreGuest({
    Key? key,
    this.onTapDelete,
    this.addGuest,
    this.index,
    required this.relationship,
    required this.name,
    required this.phone,
    this.onchangeName,
    this.onchangePhone,
    this.onchangeRelationship,
    this.relationshipDisplay,
    this.textEditing,
    this.svgDelete,
  }) : super(key: key);

  @override
  State<CustomAddMoreGuest> createState() => _CustomAddMoreGuestState();
}

class _CustomAddMoreGuestState extends State<CustomAddMoreGuest> {
  bool? isValidatedCompanyName;
  bool? isValidatedPhoneNubmer;
  final optionController = Get.put(DocumentCategory());
  final customerController = Get.put(CustomerController());
  final eventCon = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController()..text = widget.name ?? '';
    final phoneController = TextEditingController()..text = widget.phone ?? '';

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Guest',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: widget.onTapDelete,
                  child: SvgPicture.asset(
                    '${widget.svgDelete}',
                    width: 18,
                    height: 18,
                  ),
                )
              ],
            ),
          ),
          CustomTextFieldNew(
            controller: nameController,
            hintText: "Full Name",
            labelText: "Full Name",
            initialValue: widget.name,
            onChange: (value) {
              // if (value.isEmpty) {
              //   widget.name.text = '';
              //   isValidatedCompanyName = false;
              // } else {
              //   widget.name.text = value;
              //   isValidatedCompanyName = true;
              // }

              widget.onchangeName!(value);
            },
          ),
          CustomTextFieldNew(
            controller: phoneController,
            // key: phoneNumberKey,
            hintText: "Phone Number",
            labelText: "Phone Number",
            keyboardType: TextInputType.number,
            initialValue: widget.phone,
            onChange: (value) {
              // if (value.isEmpty) {
              //   widget.phone = '';
              //   isValidatedPhoneNubmer = false;
              // } else {
              //   widget.phone = value;
              //   isValidatedPhoneNubmer = true;
              // }

              widget.onchangePhone!(value);
            },
          ),
          CICDropdown(
              label: 'Relationshiprrr',
              isCompany: false,
              isEnable: true,
              otherLabel: "Add Other",
              colors: Colors.white,
              isPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              isNoRequired: true,
              onChange: (value) {
                // if (value.isEmpty) {
                //   widget.relationship = '';
                // } else {
                //   widget.relationship = value["Name"];
                // }
                setState(() {
                  debugPrint("relationship ${widget.relationship}");
                });
                widget.onchangeRelationship!(value);
              },
              defaultValue: widget.relationship != null
                  ? {
                      "Code": widget.relationship,
                      "Name": widget.relationshipDisplay,
                    }
                  : eventCon.addNewOtherRelationShip.text != ''
                      ? {
                          "Code": '',
                          "Name": eventCon.addNewOtherRelationShip.text,
                        }
                      : null,
              item: optionController.relationShip.asMap().entries.map((e) {
                return DropDownItem(itemList: {
                  "Name": e.value.display,
                  "Code": e.value.id,
                });
              }).toList(),
              onCreateCompany: () {
                eventCon.addNewOtherRelationShip.text = '';
                onShowAddOtherLabel(
                  title: "Add Other",
                  onBack: () {
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                  onSave: eventCon.isLoadingMoreRelationship.value == true
                      ? null
                      : () {
                          eventCon
                              .onAddMoreRelationship(context)
                              .then((value) => Navigator.pop(context));
                        },
                  context: context,
                  textFieldHere: CustomTextFieldNew(
                    autoFocus: true,
                    controller: eventCon.addNewOtherRelationShip,
                    hintText: 'Relation Ship',
                    labelText: 'Relation Ship',
                    // onChange: (e) {
                    //   if (widget.relationshipDisplay == '') {
                    //     widget.relationshipDisplay = '';
                    //   } else {
                    //     widget.relationshipDisplay = e;
                    //   }
                    // },
                  ),
                );
              }),
        ],
      ),
    );
  }
}

List<int> textList = [1, 2, 3, 4, 5];
