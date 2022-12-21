import 'dart:async';
import 'dart:io';
import 'package:cicgreenloan/Utils/helper/container_partern.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/utils/form_builder/dropdow_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../modules/investment_module/controller/investment_controller.dart';
import 'custom_date_time_picker.dart';

//==
class CICDropdown extends StatefulWidget {
  final String? otherLabel;
  final bool? isFIF;
  final bool? isNoRequired;
  final List<DropDownItem>? item;
  final GestureTapCallback? onTap;
  final String? label;
  final ValueChanged<Map>? onChange;
  final bool? validate;
  final Map? defaultValue;
  final bool? isDateTimePicker;
  final bool? isValidate;
  final bool? isSelectMember;
  final bool? isCompany;
  final bool? isSelectBank;
  final bool? isEnable;
  final bool? isProfile;
  final Function? onCreateCompany;
  final bool isUserAccount;
  final EdgeInsets? isPadding;
  final String? imageUrl;
  final Color? colors;
  final bool? isPayment;
  final EdgeInsets? marginAddNew;
  final bool isIconCalendar;
  final EdgeInsets? paddingSuffixIcon;
  final EdgeInsets? margin;
  final bool? isAppBar;
  final bool? getDateTime;
  final DateTime? currentDate;
  const CICDropdown({
    Key? key,
    this.isNoRequired = false,
    this.isFIF = false,
    this.currentDate,
    this.marginAddNew,
    this.margin,
    this.isAppBar = false,
    this.paddingSuffixIcon,
    this.isEnable = false,
    this.onCreateCompany,
    this.item,
    this.onChange,
    this.isProfile = false,
    required this.label,
    this.validate = false,
    this.isDateTimePicker = false,
    this.defaultValue,
    this.isSelectMember = false,
    this.isCompany = false,
    this.isSelectBank = false,
    this.isUserAccount = false,
    this.isPadding,
    this.imageUrl,
    this.colors,
    this.isValidate,
    this.isPayment = false,
    this.isIconCalendar = true,
    this.getDateTime = false,
    this.otherLabel,
    this.onTap,
  }) : super(key: key);
  @override
  State<CICDropdown> createState() => _CICDropdownState();
}

class _CICDropdownState extends State<CICDropdown> {
  Map? selectData = {};
  Map? copyData = {};
  int? currentIndex;
  String? dateTime;
  final memberController = Get.put(MemberController());
  final debtCon = Get.put(DebtInvestmentController());
  final fifCon = Get.put(PriceController());
  bool isLoading = false;
  Future? memberListFuture;
  int page = 1;
  int searchPage = 1;
  bool isLoadingMore = false;
  String searchFilter = '';
  String pageName = 'memberList';
  bool isFecthMoredata = false;

  @override
  void initState() {
    setState(
      () {
        selectData = {'Name': widget.label, 'Code': '02'};
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.defaultValue != null) {
      copyData = widget.defaultValue!;
    } else {
      copyData = selectData;
    }
    return GestureDetector(
      onTap: widget.isDateTimePicker != null && widget.isDateTimePicker!
          ? widget.isEnable == true
              ? widget.onTap
              : () {
                  FocusScope.of(context).unfocus();
                  openDateTimePicker(
                    currentDate: widget.currentDate,
                    getDateTimeFormat: widget.getDateTime,
                    context: context,
                    onSelectDone: (dateTime) {
                      setState(() {
                        copyData = {
                          'Name': dateTime,
                          'Code': '01',
                        };
                      });
                      widget.onChange!({
                        'Name': dateTime,
                        'Code': '01',
                      });
                    },
                    onChange: (value) {
                      //if onchange == ""; when click done => current date
                      // final dateTime = DateTime.parse(value);

                      setState(() {
                        copyData = {
                          'Name': value,
                          'Code': '01',
                        };
                      });
                      widget.onChange!({
                        'Name': value,
                        'Code': '01',
                      });
                    },
                    selectedDate: widget.defaultValue != null
                        ? DateFormat("dd-MM-yyyy") //"yyyy-MM-dd"
                            .parse(widget.defaultValue!['Name'])
                        : DateTime.now(),
                  );
                }
          : widget.isEnable == true
              ? () {}
              : () {
                  FocusScope.of(context).unfocus();
                  showModalBottomSheet(
                    backgroundColor: widget.colors ?? Colors.transparent,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRaduis)),
                    builder: (context) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Container(
                          margin: widget.margin ??
                              const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 30),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor),
                          child: Stack(
                            children: [
                              // Container(
                              //   margin: EdgeInsets.only(top: 10),
                              //   height: 5,
                              //   width: 30,
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       color: Colors.grey[300]),
                              // ),
                              widget.isAppBar!
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.close),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30),
                                            child: Text(
                                              '${widget.label}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      // padding: const EdgeInsets.symmetric(
                                      //   horizontal: 20,
                                      //   vertical: 20,
                                      // ),
                                      child: Text(
                                        '${widget.label}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                              Positioned(
                                top: 50,
                                left: 0,
                                right: 0,
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.grey[300],
                                ),
                              ),
                              Positioned(
                                top: 65,
                                left: 0,
                                right: 0,
                                bottom: 40,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      // indent: 35,
                                      thickness: 1,
                                      color: Colors.grey[300],
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        widget.onChange!(
                                            widget.item![index].itemList!);
                                        setState(() {
                                          currentIndex = index;
                                          fifCon.isCreateNewDate.value = "";
                                          copyData = {
                                            'Name': widget
                                                .item![index].itemList!['Name'],
                                            'Code': widget
                                                .item![index].itemList!['Code'],
                                          };
                                        });
                                      },
                                      child: DropDownItem(
                                        isPayment: widget.isPayment,
                                        imageUrl: '${widget.imageUrl}',
                                        isPadding: widget.isPadding,
                                        isUserAccount: widget.isUserAccount,
                                        profile: widget.isProfile,
                                        isSelect: currentIndex == index,
                                        paddingSuffixIcon:
                                            widget.paddingSuffixIcon,
                                        itemList: {
                                          'Name': widget
                                              .item![index].itemList!['Name'],
                                          'Code': widget
                                              .item![index].itemList!['Code'],
                                          'accountName': widget.item![index]
                                              .itemList!['accountName'],
                                          'accountNumber': widget.item![index]
                                              .itemList!['accountNumber'],
                                          'picture': widget.item![index]
                                              .itemList!['picture'],
                                          'datePayment': widget.item![index]
                                              .itemList!['datePayment'],
                                        },
                                      ),
                                    );
                                  },
                                  itemCount: widget.item!.length,
                                ),
                              ),
                              if (widget.isCompany == true)
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                      bottom: kIsWeb
                                          ? 10
                                          : Platform.isAndroid
                                              //? 10
                                              ? 0
                                              : 20,
                                    ),
                                    child: Column(
                                      children: [
                                        // const Divider(
                                        //   thickness: 1,
                                        //   color: Colors.pink,
                                        // ),
                                        GestureDetector(
                                          onTap: widget.onCreateCompany != null
                                              ? () {
                                                  widget.onCreateCompany!();
                                                }
                                              : () {},
                                          child: Container(
                                            color: Colors.white,
                                            padding: widget.marginAddNew ??
                                                const EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add_circle_outline,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 15),
                                                Text(
                                                  widget.isSelectBank == true
                                                      ? widget.isFIF == true
                                                          ? "Add new date"
                                                          : "Add new account"
                                                      : widget.otherLabel !=
                                                              null
                                                          ? widget.otherLabel!
                                                          : 'Create new company',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
      child: SizedBox(
        height: widget.isValidate != null && !widget.isValidate! ? 90 : 60,
        // color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            widget.isValidate != null && !widget.isValidate!
                ? SizedBox(
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
                                        ? Theme.of(context).textTheme.subtitle1
                                        : Theme.of(context).textTheme.subtitle1,
                                    overflow: TextOverflow.ellipsis),
                                if (widget.defaultValue == null) const Spacer(),
                                widget.isDateTimePicker != null &&
                                        widget.isDateTimePicker!
                                    ? widget.isIconCalendar
                                        ? SvgPicture.asset(
                                            "assets/images/svgfile/Calendar.svg",
                                            color: copyData != selectData
                                                ? Theme.of(context).primaryColor
                                                : null,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_down_rounded,
                                            color: copyData != selectData
                                                ? Theme.of(context).primaryColor
                                                : Colors.black,
                                          )
                                    : Icon(
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
                                '${widget.label}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700),
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
                                widget.defaultValue != null
                                    ? Expanded(
                                        child: Text('${copyData!['Name']}',
                                            style: copyData == selectData
                                                ? Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                : Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    : Text('${copyData!['Name']}',
                                        style: copyData == selectData
                                            ? Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                            : Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                        overflow: TextOverflow.ellipsis),
                                if (copyData == selectData)
                                  widget.isNoRequired == false
                                      ? const Text(
                                          " *",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : const Text(''),
                                if (widget.defaultValue == null) const Spacer(),
                                widget.isDateTimePicker != null &&
                                        widget.isDateTimePicker!
                                    ? widget.isIconCalendar
                                        ? SvgPicture.asset(
                                            "assets/images/svgfile/Calendar.svg",
                                            color: copyData != selectData
                                                ? Theme.of(context).primaryColor
                                                : null,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_down_rounded,
                                            color: copyData != selectData
                                                ? Theme.of(context).primaryColor
                                                : Colors.black,
                                          )
                                    : Icon(
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
                              child: RichText(
                                text: TextSpan(
                                    text: '${widget.label}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: 'DMSans',
                                    ),
                                    children: const [
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ))
                                    ]),
                              ),
                              // Text(
                              //   widget.label!,
                              //   style: const TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 12,
                              //     fontWeight: FontWeight.w100,
                              //     fontFamily: 'DMSans',
                              //   ),
                              // ),
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
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Please Select Your ${widget.label}',
                          style: const TextStyle(
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
