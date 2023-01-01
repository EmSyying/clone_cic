import 'dart:convert';

import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/Utils/app_settings/models/slide_model.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/channel.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/channel_detail.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../../core/flavor/flavor_configuration.dart';

class LearningController extends GetxController {
  final postModel = VideoModel().obs;
  List<VideoPost> postList = <VideoPost>[].obs;
  final moreVideo = VideoModel().obs;
  final moreVideoByModule = VideoModel().obs;
  final channel = ChannelModel().obs;
  final saveVideo = VideoModel().obs;
  final channelDetail = ChannelDetail().obs;
  final postByModule = VideoModel().obs;
  final slideList = <SlideModel>[].obs;
  final isLoading = false.obs;
  final isLoadingChannelDetail = false.obs;
  final isLoadingChannel = false.obs;
  final isLoadingPostByModule = false.obs;
  final currentIndex = 0.obs;
  final _cusCon = Get.put(CustomerController());
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final refreshKeyChannel = GlobalKey<RefreshIndicatorState>();
  final isSavingPost = false.obs;

  Future<VideoModel> getVideoList(
      {int? memberId,
      int? postId,
      int? moduleId,
      String? methode,
      String? pageName}) async {
    String url;
    isLoading(true);
    final token = await LocalData.getCurrentUser();

    if (postId != null && memberId != null && pageName == null) {
      url =
          '${FlavorConfig.instance.values!.apiBaseUrl}post?member_id=$memberId&more=true&current=$postId';
    } else if (methode != null && pageName == null) {
      url =
          '${FlavorConfig.instance.values!.apiBaseUrl}post?member_id=$memberId&saved=true';
    } else if (moduleId != null && pageName != null) {
      url =
          '${FlavorConfig.instance.values!.apiBaseUrl}member_id=$memberId&module=$moduleId&more=true&current=$postId';
    } else {
      url =
          '${FlavorConfig.instance.values!.apiBaseUrl}post?member_id=$memberId&recommended=true';
    }
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          if (postId != null && memberId != null) {
            moreVideo.value = VideoModel.fromJson(responseJson);
          } else if (methode != null) {
            saveVideo.value = VideoModel.fromJson(responseJson);
          } else if (moduleId != null &&
              postId != null &&
              memberId != null &&
              pageName != null) {
            moreVideoByModule.value = VideoModel.fromJson(responseJson);
          } else {
            postModel.value = VideoModel.fromJson(responseJson);
          }
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return postModel.value;
  }

  // get channel

  Future<ChannelModel> getChannel({required int memberId}) async {
    String url;
    isLoadingChannel(true);
    final token = await LocalData.getCurrentUser();
    url =
        '${FlavorConfig.instance.values!.apiBaseUrl}channel?member_id=$memberId';

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          channel.value = ChannelModel.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingChannel(false);
    }
    return channel.value;
  }
  // get channel detail

  Future<ChannelDetail> getChannelDetail({required int channelId}) async {
    String url;

    isLoadingChannelDetail(true);

    final token = await LocalData.getCurrentUser();
    url = '${FlavorConfig.instance.values!.apiBaseUrl}channel/$channelId';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          channelDetail.value = ChannelDetail.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingChannelDetail(false);
    }
    return channelDetail.value;
  }

  // get video post bye module

  Future<VideoModel> getVideoPostByModule(
      {required int memberId, required int moduleId}) async {
    String url;
    isLoadingPostByModule(true);
    final token = await LocalData.getCurrentUser();
    url =
        '${FlavorConfig.instance.values!.apiBaseUrl}post?member_id=$memberId&module=$moduleId';

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          postByModule.value = VideoModel.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingPostByModule(false);
    }
    return postByModule.value;
  }

  Future<void> onRefresh() async {
    getChannel(memberId: _cusCon.customer.value.customerId!);
    getVideoList(memberId: _cusCon.customer.value.customerId);
  }

  Future<void> onRefreshChannelDetail(int channelId) async {
    getChannelDetail(channelId: channelId);
  }

  Future<bool> onSavePost({int? postId, int? memberId, String? methode}) async {
    isSavingPost(true);
    final token = await LocalData.getCurrentUser();

    String url = '';
    if (methode != null) {
      url = '${FlavorConfig.instance.values!.apiBaseUrl}unsave-post';
    } else {
      url = '${FlavorConfig.instance.values!.apiBaseUrl}save-post';
    }
    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token'
              },
              body: json.encode({"post_id": postId, "member_id": memberId}))
          .then((response) {
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      });
    } finally {
      isSavingPost(false);
    }
    return false;
  }

  final isLoadingSlide = false.obs;
  Future<List<SlideModel>> fetchSlide() async {
    slideList.clear();
    SlideModel slide = SlideModel();
    isLoadingSlide(true);
    var token = LocalData.getCurrentUser();
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}slide?type=Learning';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        var responseJson = json.decode(response.body)['data'];
        if (response.statusCode == 200) {
          responseJson.map((data) {
            slide = SlideModel.fromJson(data);
            if (!slideList.contains(slide)) {
              slideList.add(slide);
            }
          }).toList();
        } else {}
      });
    } finally {
      isLoadingSlide(false);
    }
    return slideList;
  }
}
