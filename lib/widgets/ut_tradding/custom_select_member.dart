import 'package:cicgreenloan/modules/member_directory/screens/directory.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:flutter/material.dart';

import '../../modules/member_directory/models/personal_profile_model.dart/personal_profile_model.dart';

class CustomSelectMember extends StatefulWidget {
  final bool? isValidate;
  final String? label;
  final Map? defaultValue;
  final Function? onTap;

  const CustomSelectMember(
      {Key? key, this.isValidate, this.label, this.defaultValue, this.onTap})
      : super(key: key);

  @override
  State<CustomSelectMember> createState() => _CustomSelectMemberState();
}

class _CustomSelectMemberState extends State<CustomSelectMember> {
  Map? selectData = {};
  Map? copyData = {};

  @override
  void initState() {
    super.initState();
    setState(
      () {
        selectData = {'Name': widget.label, 'Code': '02'};

        if (widget.defaultValue != null) {
          copyData = widget.defaultValue!;
        } else {
          copyData = selectData;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onShowCustomCupertinoModalSheet(
            child: Directory(
              isShowCiCTeam: 1,
              isNavigator: true,
              fromPage: 'tradeScreen',
              onTap: (PersonalProfile value) {
                widget.onTap!(value);
                setState(() {
                  copyData = {
                    "Name": value.name,
                    "Code": value.id,
                  };
                });
              },
            ),
            context: context,
            title: 'Members');
      },
      child: SizedBox(
        height: widget.isValidate != null && !widget.isValidate! ? 90 : 60,
        // color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            widget.isValidate != null && !widget.isValidate!
                ? SizedBox(
                    // color: Theme.of(context).cardColor,
                    height: 60,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        const SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: copyData == selectData
                                    ? Colors.grey[100]
                                    : Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red)),
                            child: Row(
                              children: [
                                Text(copyData!['Name'],
                                    style: copyData == selectData
                                        ? Theme.of(context).textTheme.bodyMedium
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: copyData != selectData
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        if (copyData != selectData)
                          Positioned(
                            top: 5,
                            left: 35,
                            child: Container(
                              color: Theme.of(context).cardColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                widget.label!,
                                style: const TextStyle(
                                    fontSize: 9, fontFamily: 'DMSans'),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        const SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: copyData == selectData
                                    ? Colors.grey[100]
                                    : Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                                border: copyData == selectData
                                    ? null
                                    : Border.all(color: Colors.grey)),
                            child: Row(
                              children: [
                                Text(
                                  '${copyData!['Name']}',
                                  style: copyData == selectData
                                      ? Theme.of(context).textTheme.bodyLarge
                                      : Theme.of(context).textTheme.bodyMedium,
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: copyData != selectData
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        if (copyData != selectData)
                          Positioned(
                            top: 5,
                            left: 35,
                            child: Container(
                              color: Theme.of(context).cardColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                widget.label!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
            widget.isValidate != null && !widget.isValidate!
                ? Positioned(
                    left: 20,
                    top: 70,
                    right: 0,
                    bottom: 0,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Please enter select member ',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontFamily: 'DMSans'),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
