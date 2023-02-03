import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/controllers/learning_controller.dart';
import 'package:cicgreenloan/Utils/custom_video_card.dart';
import 'package:cicgreenloan/widgets/learning/custom_player_bottom_sheet.dart';
import 'package:cicgreenloan/widgets/learning/custom_video_shimmer.dart';
import 'package:cicgreenloan/widgets/member_directory/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';

class VideoListByModule extends StatefulWidget {
  final int? moudleId;
  final String? pageName;
  const VideoListByModule({Key? key, this.moudleId, this.pageName})
      : super(key: key);

  @override
  State<VideoListByModule> createState() => _VideoListByModuleState();
}

class _VideoListByModuleState extends State<VideoListByModule> {
  final _learingCon = Get.put(LearningController());
  final _cusCon = Get.put(CustomerController());
  @override
  void initState() {
    super.initState();
    if (widget.pageName != null) {
      _learingCon.getVideoList(
          memberId: _cusCon.customer.value.customerId, methode: 'save');
    } else {
      _learingCon.getVideoPostByModule(
          memberId: _cusCon.customer.value.customerId!,
          moduleId: widget.moudleId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          context: context, title: 'Online Learning', isLeading: true),
      body: widget.pageName != null
          ? Obx(
              () => _learingCon.isLoading.value
                  ? const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: CustomVideoShimmer(),
                    )
                  : _learingCon.saveVideo.value.data!.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemCount: _learingCon.saveVideo.value.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: VideoCard(
                                vidoeURL: _learingCon
                                    .saveVideo.value.data![index].video!,
                                pitching: _learingCon.saveVideo.value
                                    .data![index].module!.title!,
                                thumnail: _learingCon
                                    .saveVideo.value.data![index].image!,
                                title: _learingCon
                                    .saveVideo.value.data![index].title!,
                                trainerName: _learingCon
                                    .saveVideo.value.data![index].trainer!,
                                videoDuration: _learingCon
                                    .saveVideo.value.data![index].duration!,
                              ),
                              onTap: () {
                                customPlayerBottomSheet(
                                    context: context,
                                    video: _learingCon
                                        .saveVideo.value.data![index]);
                              },
                            );
                          })
                      : Center(
                          child: EmptyStateProfile(
                            bodySmall: '',
                            isEditable: false,
                            title: 'No Video',
                            iconUrl: 'assets/images/emptyState.png',
                            onTap: () {},
                          ),
                        ),
            )
          : Obx(
              () => _learingCon.isLoadingPostByModule.value
                  ? const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: CustomVideoShimmer(),
                    )
                  : _learingCon.postByModule.value.data!.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemCount:
                              _learingCon.postByModule.value.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: VideoCard(
                                vidoeURL: _learingCon
                                    .postByModule.value.data![index].video!,
                                pitching: _learingCon.postByModule.value
                                    .data![index].module!.title!,
                                thumnail: _learingCon
                                    .postByModule.value.data![index].image!,
                                title: _learingCon
                                    .postByModule.value.data![index].title!,
                                trainerName: _learingCon
                                    .postByModule.value.data![index].trainer!,
                                videoDuration: _learingCon
                                    .postByModule.value.data![index].duration!,
                              ),
                              onTap: () {
                                customPlayerBottomSheet(
                                    context: context,
                                    video: _learingCon
                                        .postByModule.value.data![index],
                                    pageName: 'modulePage');
                              },
                            );
                          },
                        )
                      : Center(
                          child: EmptyStateProfile(
                            bodySmall: '',
                            isEditable: false,
                            title: 'No Video',
                            iconUrl: 'assets/images/emptyState.png',
                            onTap: () {},
                          ),
                        ),
            ),
    );
  }
}
