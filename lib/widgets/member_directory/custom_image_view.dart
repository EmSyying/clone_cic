import 'package:cicgreenloan/Utils/image_view/image_view_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageView extends StatelessWidget {
  final String? label;
  final String? imageNewtork;
  const CustomImageView({Key? key, this.label, this.imageNewtork})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageViewerFile(
              heroTag: label,
              imageUrl: imageNewtork,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label!,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: Get.height / 4,
              width: Get.width / 2.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        imageNewtork != null ? imageNewtork! : "",
                      ),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
