import 'dart:async';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  final button = 'Go to Setting';

  ///
  final cameraLottie = 'assets/images/animation/camera_permission.json';
  final cameraTitle = 'Enable Camera';
  final cameraDescription =
      'This feature require to access to your camera, Please allow permission to continue.';

  ///
  final locationLottie = 'assets/images/animation/location_animation.json';
  final locationTitle = 'Enable Location';
  final locationDescription =
      'This feature require to access to your Location, Please allow permission to continue.';

  void disposeTimer() {
    _timerC?.cancel();
    _timerL?.cancel();
  }

  ///Camera Peramision
  Timer? _timerC;

  final cameraisDenied = false.obs;
  Future<void> checkCameraPermission() async {
    cameraisDenied.value = await Permission.camera.isDenied; //first time check
    if (cameraisDenied.value) {
      _timerC = Timer.periodic(
        const Duration(seconds: 1),
        (timer) async {
          cameraisDenied.value = await Permission.camera.isDenied;

          if (cameraisDenied.value == false) {
            _timerC?.cancel();
          }
        },
      );
    }
  }

  ///Location Peramision
  Timer? _timerL;
  final locationisDenied = false.obs;
  Future<void> checkLocationPermission() async {
    locationisDenied.value = await Permission.location.isDenied; //first check
    if (locationisDenied.value) {
      _timerL = Timer.periodic(
        const Duration(seconds: 1),
        (timer) async {
          locationisDenied.value = await Permission.location.isDenied;
          if (locationisDenied.value == false) {
            _timerL?.cancel();
          }
        },
      );
    }
  }
}
