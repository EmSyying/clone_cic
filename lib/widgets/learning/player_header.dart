import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/controllers/learning_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:cicgreenloan/widgets/learning/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class PlayerHeader extends StatefulWidget {
  final VideoPost? video;
  const PlayerHeader({Key? key, this.video}) : super(key: key);

  @override
  State<PlayerHeader> createState() => _PlayerHeaderState();
}

class _PlayerHeaderState extends State<PlayerHeader> {
  final _learningCon = Get.put(LearningController());
  final _cusCon = Get.put(CustomerController());
  bool isDownload = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            widget.video!.module!.title!,
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            widget.video!.title!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Trainer: ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                widget.video!.trainer!,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Row(
          //   children: [
          //     CustomMenu(
          //       title: 'Download',
          //       onTap: () {
          //         print('download');
          //       },
          //       icon: SvgPicture.asset(
          //           'assets/images/learningPlatform/download.svg'),
          //     ),
          //     SizedBox(width: 20),
          //     CustomMenu(
          //       title: 'Save',
          //       onTap: () {
          //         print('download');
          //       },
          //       icon: video.saved != null && video.saved
          //           ? Icon(
          //               Icons.bookmark_outline,
          //               color: Theme.of(context).primaryColor,
          //             )
          //           : Icon(
          //               Icons.bookmark,
          //               color: Theme.of(context).primaryColor,
          //             ),
          //     ),
          //   ],
          // ),
          CustomMenu(
            title: 'Save',
            onTap: () async {
              setState(() {
                widget.video!.saved = !widget.video!.saved;
                if (widget.video!.saved) {
                  _learningCon
                      .onSavePost(
                          postId: widget.video!.id,
                          memberId: _cusCon.customer.value.customerId)
                      .then((value) {
                    if (value) {}
                  });
                } else {
                  _learningCon
                      .onSavePost(
                          postId: widget.video!.id,
                          memberId: _cusCon.customer.value.customerId,
                          methode: 'Unsave')
                      .then((value) {
                    if (value) {}
                  });
                }
              });
            },
            icon: !widget.video!.saved
                ? Icon(
                    Icons.bookmark_outline,
                    color: Theme.of(context).primaryColor,
                  )
                : Icon(
                    Icons.bookmark,
                    color: Theme.of(context).primaryColor,
                  ),
          ),
          const SizedBox(height: 10),
          Text(
            'About this course',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 8),
          ReadMoreText(
            widget.video!.description!,
            trimLines: 4,
            trimMode: TrimMode.Line,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
