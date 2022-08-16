import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/member_controller.dart';

class ViewImageProfle extends StatelessWidget {
  const ViewImageProfle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memberCon = Get.put(MemberController());
    return Column(
      children: [
        AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        const SizedBox(
          height: 50,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 4,
              child: SizedBox(
                width: double.infinity,
                // color: Colors.green,
                // padding: const EdgeInsets.only(bottom: 150, top: 65),
                child: Image.network(
                  memberCon.personalProfilemember.value.profile!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 65,
        ),
      ],
    );
    // Scaffold(
    //   backgroundColor: Colors.black,
    //   appBar: CustomAppBarWhiteColor(
    //     context: context,
    //     elevation: 0,
    //     backgroundColor: Colors.black,
    //     leading: IconButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //       icon: const Icon(
    //         Icons.close,
    //       ),
    //     ),
    //   ),
    //   body: Container(
    //     width: double.infinity,
    //     height: double.infinity,
    //     color: Colors.transparent,
    //     margin: const EdgeInsets.only(bottom: 150, top: 65),
    //     child: Image.network(
    //       memberCon.personalProfilemember.value.profile!,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );
  }
}
