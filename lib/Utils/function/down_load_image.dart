import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:get/get.dart';

onDownload(String url) async {
  try {
    // Saved with this method.
    var imageId = await ImageDownloader.downloadImage(url);
    if (imageId == null) {
      return;
    }
    Get.snackbar("Save Image", "Image was saved",
        snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.all(20));
  } on PlatformException {
    debugPrint("error");
  }
}
