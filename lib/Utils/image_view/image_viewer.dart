import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final String? imageUrl;
  const ImageViewer({Key? key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'invoice',
            child: PhotoView(
              imageProvider: AssetImage(imageUrl!),
            ),
          ),
          Positioned(
            top: 50,
            left: 10.0,
            child: IconButton(
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
