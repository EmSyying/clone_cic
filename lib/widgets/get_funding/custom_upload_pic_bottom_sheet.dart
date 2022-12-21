import 'package:flutter/material.dart';

onShowBottomSheetUploadPic(
    BuildContext context, Function openCamera, Function openGallery) {
  return
      //  Platform.isAndroid
      //     ?
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: const Color(0xFF737373),
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF737373),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              //   color: Colors.red,
              //   margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.transparent,
                  )),
                  GestureDetector(
                    onTap: () {
                      openGallery();
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 20),
                      child: const Center(
                        child: Text(
                          "Photo Gallery",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff007AFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      openCamera();
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 20),
                      child: const Center(
                        child: Text(
                          "Camera",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff007AFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 20),
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff007AFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    color: const Color(0xFF737373),
                    height: 10,
                  )
                ],
              ),
            );
          });
  // : showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) {
  //       return CupertinoActionSheet(
  //         actions: [
  //           CupertinoActionSheetAction(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text(
  //               "Share this event",
  //               style: TextStyle(
  //                 fontFamily: 'DMSans',
  //                 fontSize: 16,
  //                 color: Theme.of(context).primaryColor,
  //               ),
  //             ),
  //           ),
  //           CupertinoActionSheetAction(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text(
  //               "Add to calendar",
  //               style: TextStyle(
  //                 fontFamily: 'DMSans',
  //                 fontSize: 16,
  //                 color: Theme.of(context).primaryColor,
  //               ),
  //             ),
  //           ),
  //           CupertinoActionSheetAction(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text(
  //               "Contact to organiser",
  //               style: TextStyle(
  //                 fontFamily: 'DMSans',
  //                 fontSize: 16,
  //                 color: Theme.of(context).primaryColor,
  //               ),
  //             ),
  //           ),
  //         ],
  //         cancelButton: CupertinoActionSheetAction(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: Text(
  //             "Cancel",
  //             style: TextStyle(
  //               fontFamily: 'DMSans',
  //               fontSize: 16,
  //               color: Theme.of(context).primaryColor,
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
}
