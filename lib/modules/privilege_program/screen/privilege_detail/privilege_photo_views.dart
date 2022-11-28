import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PrivilegePhotoViews extends StatelessWidget {
  final List<String>? imageUrl;
  final int? index;
  const PrivilegePhotoViews({
    Key? key,
    this.imageUrl,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.download_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: PageView(
        controller: index != null && index! > 0
            ? PageController(initialPage: index!)
            : null,
        children: imageUrl
                ?.map(
                  (e) => Center(
                    child: PhotoView(
                      disableGestures: true,
                      imageProvider: NetworkImage(e),
                    ),
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
