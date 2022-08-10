import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class CustomMember extends StatelessWidget {
  final List<String>? memberList;
  final int? registerNumber;
  const CustomMember({Key? key, this.memberList, this.registerNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: memberList!.isNotEmpty
          ? Stack(
              alignment: Alignment.center,
              // ignore: deprecated_member_use

              children: [
                memberList!.isNotEmpty
                    ? Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(memberList![0].toString()),
                                fit: BoxFit.cover),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 0.1,
                                  offset: Offset(1.0, 2.0),
                                  spreadRadius: 0.5)
                            ]),
                      )
                    : const Text(''),
                memberList!.isNotEmpty && memberList!.length != 1
                    ? Positioned(
                        left: 15.0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(memberList![1].toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    : const Text(''),
                memberList!.isNotEmpty &&
                        memberList!.length != 1 &&
                        memberList!.length != 2
                    ? Positioned(
                        left: 25.0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(memberList![2].toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    : const Text(''),
                if (registerNumber! > 3)
                  Positioned(
                    left: 35.0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).cardColor,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 0.3,
                                offset: Offset(1.0, 2.0),
                                spreadRadius: 0.5)
                          ]),
                      child: Center(
                        child: Text(
                          '+ ${registerNumber! - 3}',
                          style: const TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 9,
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
              ],
            )
          : Container(),
    );
  }
}
