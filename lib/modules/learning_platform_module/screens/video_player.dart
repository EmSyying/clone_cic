import 'dart:io';
import 'dart:typed_data';

import 'package:cicgreenloan/configs/route_configuration/route.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/learning_platform_module/controllers/learning_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:cicgreenloan/widgets/learning/custom_player_bottom_sheet.dart';
import 'package:cicgreenloan/widgets/learning/custom_video_shimmer.dart';
import 'package:cicgreenloan/widgets/learning/more_relate_video.dart';
import 'package:cicgreenloan/widgets/learning/player_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String? pageName;
  final VideoPost? videoModel;
  const VideoPlayer({Key? key, this.videoModel, this.pageName})
      : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  String? video = 'https://www.youtube.com/watch?v=umhl2hakkcY';
  String? videoId;
  YoutubePlayerController? _controller;
  PlayerState? playerState;
  YoutubeMetaData? videoMetaData;
  double? volume = 100;
  bool? muted = false;
  final bool _isPlayerReady = false;

  bool? isSave = false;
  final _learningCon = Get.put(LearningController());

  void listener() {
    if (_isPlayerReady && mounted && _controller!.value.isFullScreen) {
      setState(() {
        playerState = _controller!.value.playerState;
        videoMetaData = _controller!.metadata;
      });
    }
  }

  // final _pickerImage = ImagePicker();
  File? image;
  Uint8List? byte;
  double? aspectRadio = 16 / 9;
  // Todo? _todo;
  bool isDownloaded = false;

  // _onSelectGallery() async {
  //   final _imageFile = await _pickerImage.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (_pickerImage != null) {
  //       image = File(_imageFile!.path);
  //       // byte = image.readAsBytes();
  //       byte = Uint8List.fromList(File(image!.path).readAsBytesSync());
  //       print('Byte: =============$byte');
  //       // imageFile = Todo(
  //       //   title: 'Image 1',
  //       //   thumnail: byte.buffer.asUint8List(),
  //       // );
  //       // todoProvider.insert(imageFile);
  //     }
  //   });
  // }

  void initYoutube() {
    // _learningCon.getVideoList(
    //     memberId: _userCon.customer.value.customerId,
    //     postId: widget.videoModel.id);
    setState(() {
      videoId = YoutubePlayer.convertUrlToId(widget.videoModel!.video!);
    });
    _controller = YoutubePlayerController(
      // initialVideoId: YoutubePlayer.convertUrlToId(widget.videoModel!.video),
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        forceHD: false,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initYoutube();
    // todoProvider.open('image');
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onEnterFullScreen: () {},
      onExitFullScreen: () {},
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: aspectRadio!,
                      child: Stack(
                        children: [
                          YoutubePlayer(
                            controller: _controller!,
                            onReady: () {},
                            onEnded: (value) {
                              Navigator.pop(context);
                              customPlayerBottomSheet(
                                  context: context,
                                  video: _learningCon.moreVideo.value.data![0]);
                            },
                            aspectRatio: aspectRadio!,
                          ),
                          Positioned(
                            top: 25,
                            left: 20,
                            child: GestureDetector(
                              onTap: () {
                                LocalData.userLogin('userLogin', true);
                                if (widget.pageName != null &&
                                    widget.pageName == 'modulePage') {
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black26,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.expand_more_outlined,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PlayerHeader(
                              video: widget.videoModel!,
                            ),
                            const SizedBox(height: 8),
                            // if (widget.videoModel.relatedVideo.length != 0)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'More Video',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            widget.pageName == null
                                ? Obx(
                                    () => _learningCon.isLoading.value
                                        ? const CustomVideoShimmer()
                                        : _learningCon.moreVideo.value.data!
                                                .isNotEmpty
                                            ? MoreRelatedVideo(
                                                videoList: _learningCon
                                                    .moreVideo.value.data!,
                                                onTap: (VideoPost value) async {
                                                  Navigator.pop(context);
                                                  customPlayerBottomSheet(
                                                      context: context,
                                                      video: value);
                                                },
                                              )
                                            : const Center(
                                                child: Text(
                                                  'No Data',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                  )
                                : Obx(
                                    () => _learningCon.isLoading.value
                                        ? const CustomVideoShimmer()
                                        : _learningCon.moreVideoByModule.value
                                                .data!.isNotEmpty
                                            ? MoreRelatedVideo(
                                                videoList: _learningCon
                                                    .moreVideoByModule
                                                    .value
                                                    .data!,
                                                onTap: (VideoPost value) async {
                                                  Navigator.pop(context);
                                                  customPlayerBottomSheet(
                                                      context: context,
                                                      video: value);
                                                },
                                              )
                                            : const Center(
                                                child: Text(
                                                  'No Data',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                  ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Miniplayer(
                //   onDismissed: (va) {},
                //   onDismiss: () {},
                //   minHeight: 20,
                //   maxHeight: MediaQuery.of(context).size.height,
                //   builder: (height, percentage) {
                //     return Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(
                //           height: 210,
                //           color: Colors.red,
                //           width: double.infinity,
                //         ),
                //         Expanded(
                //           child: SingleChildScrollView(
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 PlayerHeader(),
                //                 SizedBox(height: 8),
                //                 Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 20.0),
                //                   child: Text(
                //                     'More Video',
                //                     style: Theme.of(context).textTheme.headline2,
                //                   ),
                //                 ),
                //                 SizedBox(height: 8),
                //                 MoreRelatedVideo(
                //                   videoList: videoList,
                //                   onTap: (value) {},
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                // ),
              ],
            ),
          ),
        );
      },
      player: YoutubePlayer(
        controller: _controller!,
        onReady: () {},
        onEnded: (value) {},
      ),
    );
  }
}
