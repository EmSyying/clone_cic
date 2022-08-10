import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/controllers/learning_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:cicgreenloan/modules/learning_platform_module/screens/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final _learningCon = Get.put(LearningController());
final _userCon = Get.put(CustomerController());
customPlayerBottomSheet(
    {BuildContext? context,
    VideoPost? video,
    String? pageName,
    int? moduleId}) {
  if (pageName != null) {
    _learningCon.getVideoList(
        memberId: _userCon.customer.value.customerId,
        postId: video!.id,
        moduleId: moduleId,
        pageName: pageName);
  } else {
    _learningCon.getVideoList(
        memberId: _userCon.customer.value.customerId, postId: video!.id!);
  }
  showMaterialModalBottomSheet(
    context: context!,
    builder: (context) {
      if (pageName == null) {
        return VideoPlayer(
          videoModel: video,
          pageName: pageName,
        );
      } else {
        return VideoPlayer(videoModel: video);
      }
    },
  );
}
