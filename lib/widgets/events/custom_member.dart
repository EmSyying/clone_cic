import 'package:flutter/material.dart';

class CustomMember extends StatelessWidget {
  final List<String>? memberList;
  final int? registerNumber;
  const CustomMember({Key? key, this.memberList, this.registerNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return memberList!.isNotEmpty && memberList!.length == 1
        ? Container(
            width: 30,
            height: 30,
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
        : memberList!.isNotEmpty && memberList!.length == 2
            ? Stack(
                children: [
                  Container(
                    width: 30,
                    height: 30,
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
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(memberList![1].toString()),
                          fit: BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 0.1,
                            offset: Offset(1.0, 2.0),
                            spreadRadius: 0.5)
                      ],
                    ),
                  ),
                ],
              )
            : registerNumber! >= 3
                ? Stack(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
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
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 18),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(memberList![1].toString()),
                              fit: BoxFit.cover),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 0.1,
                                offset: Offset(1.0, 2.0),
                                spreadRadius: 0.5)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 45, top: 8),
                        child: Text(
                          '+ ${registerNumber! - 2}',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 10, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  )
                : Container();
    // memberList!.isNotEmpty

    //     ? Stack(
    //         alignment: Alignment.center,
    //         // ignore: deprecated_member_use

    //         children: [
    //           memberList!.isNotEmpty
    //               ? Container(
    //                   height: 30,
    //                   width: 30,
    //                   decoration: BoxDecoration(
    //                       border: Border.all(color: Colors.white, width: 2),
    //                       shape: BoxShape.circle,
    //                       image: DecorationImage(
    //                           image: NetworkImage(memberList![0].toString()),
    //                           fit: BoxFit.cover),
    //                       boxShadow: const [
    //                         BoxShadow(
    //                             color: Colors.black12,
    //                             blurRadius: 0.1,
    //                             offset: Offset(1.0, 2.0),
    //                             spreadRadius: 0.5)
    //                       ]),
    //                 )
    //               : const Text(''),
    //           memberList!.isNotEmpty && memberList!.length != 1
    //               ? Container(
    //                   margin: const EdgeInsets.only(left: 30),
    //                   height: 30,
    //                   width: 30,
    //                   decoration: BoxDecoration(
    //                     border: Border.all(color: Colors.white, width: 2),
    //                     shape: BoxShape.circle,
    //                     image: DecorationImage(
    //                         image: NetworkImage(memberList![1].toString()),
    //                         fit: BoxFit.cover),
    //                   ),
    //                 )
    //               : const Text(''),
    //           memberList!.isNotEmpty &&
    //                   memberList!.length != 1 &&
    //                   memberList!.length != 2
    //               ? Positioned(
    //                   left: 25.0,
    //                   child: Container(
    //                     height: 30,
    //                     width: 30,
    //                     decoration: BoxDecoration(
    //                       border: Border.all(color: Colors.white, width: 2),
    //                       shape: BoxShape.circle,
    //                       image: DecorationImage(
    //                           image: NetworkImage(memberList![2].toString()),
    //                           fit: BoxFit.cover),
    //                     ),
    //                   ),
    //                 )
    //               : const Text(''),
    //           if (registerNumber! >= 3)
    //             Container(
    //               margin: const EdgeInsets.only(left: 40),
    //               height: 30,
    //               width: 30,
    //               decoration: const BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: Colors.pink,
    //                   // color: Theme.of(context).cardColor,
    //                   boxShadow: [
    //                     BoxShadow(
    //                         color: Colors.black12,
    //                         blurRadius: 0.3,
    //                         offset: Offset(1.0, 2.0),
    //                         spreadRadius: 0.5),
    //                   ]),
    //               child: Center(
    //                 child: Text(
    //                   '+ ${registerNumber! - 2}',
    //                   style: const TextStyle(
    //                       fontFamily: 'DMSans',
    //                       fontSize: 9,
    //                       color: Theme.of(context).primaryColor,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             )
    //         ],
    //       )
    //     : Container(),
  }
}
