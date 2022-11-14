import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/widgets/events/register_member_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/helper/color.dart';

class RegisterMemberAmount extends StatelessWidget {
  final List<String>? registerProfile;
  final int registerNumber;
  final int? eventID;
  const RegisterMemberAmount(
      {Key? key,
      this.registerNumber = 0,
      this.registerProfile = const [],
      this.eventID})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return registerProfile!.isNotEmpty
        ? GestureDetector(
            onTap: () {
              onShowCustomCupertinoModalSheet(
                context: context,
                title: "Registered Members",
                trailing: Text(
                  '$registerNumber',
                  style: const TextStyle(color: AppColor.mainColor),
                ),
                child: RegisterMember(
                  eventID: eventID,
                ),
              );
            },
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              margin: const EdgeInsets.only(top: 20.0, left: 15.0),
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      registerProfile!.isNotEmpty
                          ? Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        registerProfile![0].toString()),
                                    fit: BoxFit.cover),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 0.1,
                                      offset: Offset(1.0, 2.0),
                                      spreadRadius: 0.5)
                                ],
                              ),
                            )
                          : const Text(''),
                      registerProfile!.isNotEmpty &&
                              registerProfile!.length != 1
                          ? Positioned(
                              left: 25.0,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          registerProfile![1].toString()),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            )
                          : const Text(''),
                      registerProfile!.isNotEmpty &&
                              registerProfile!.length != 1 &&
                              registerProfile!.length != 2
                          ? Positioned(
                              left: 45.0,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          registerProfile![2].toString()),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            )
                          : const Text(''),
                    ],
                  ),
                  registerProfile!.length == 1
                      ? Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "1 Joined",
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14,
                                color: Get.theme.brightness == Brightness.light
                                    ? AppColor.mainColor
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : registerProfile!.length == 2
                          ? Container(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                "2 Joined",
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14,
                                    color:
                                        Get.theme.brightness == Brightness.light
                                            ? AppColor.mainColor
                                            : Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : registerProfile!.length == 3
                              ? Container(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    "3 Joined",
                                    style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 14,
                                        color: Get.theme.brightness ==
                                                Brightness.light
                                            ? AppColor.mainColor
                                            : Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    "+${registerNumber - 3} Joined",
                                    style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 14,
                                        color: Get.theme.brightness ==
                                                Brightness.light
                                            ? AppColor.mainColor
                                            : Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
