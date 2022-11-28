import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photo_view/photo_view.dart';

class PrivilegePhotoViews extends StatelessWidget {
  final List<String>? imageUrl;
  final int? index;
  const PrivilegePhotoViews({
    Key? key,
    this.imageUrl,
    this.index,
  }) : super(key: key);

  Future<void> _downloadImage(String url) async {
    try {
      await ImageDownloader.downloadImage(url).then((_) {
        debugPrint('URL : $_');
        customRouterSnackbar(description: 'Image Saved to Gallery.');
      });
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    int ind = index ?? 0;
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
            onPressed: () {
              if (imageUrl != null && imageUrl!.isNotEmpty) {
                _downloadImage(imageUrl![ind]);
              }
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: PageView(
        controller: index != null && index! > 0
            ? PageController(initialPage: index!)
            : null,
        onPageChanged: (_) {
          ind = _;
        },
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
