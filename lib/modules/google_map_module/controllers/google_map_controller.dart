import 'dart:async';
import 'dart:convert';
import 'package:cicgreenloan/modules/google_map_module/models/direction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class GoogleMapsController extends GetxController {
  static const LatLng kMapCenter = LatLng(11.55847700573664, 104.8778156455111);
  BitmapDescriptor? _markerIcon;
  double latitute = 11.587542;
  double longtitute = 104.897149;
  GoogleMapController? googleMapcontroller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  Position? currentPosition;
  int markerIdCounter = 1;
  DirectionModel? directionModel;
  double currentLat = 0.0;
  double currentLng = 0.0;
  final currentLatStore = ''.obs;
  final currentLngStore = ''.obs;

  static const CameraPosition initailCameraPosition = CameraPosition(
    target: LatLng(11.561167876074935, 104.8826221638736),
    zoom: 14.4746,
  );

  onMapCreate(GoogleMapController controller) {
    googleMapcontroller = controller;
  }

  onAnimateCamera(LatLng latlng) {
    googleMapcontroller!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 270.0,
          target: latlng,
          zoom: 12.0,
        ),
      ),
    );
  }

  void onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      final MarkerId? previousMarkerId = selectedMarker;
      if (previousMarkerId != null && markers.containsKey(previousMarkerId)) {
        final Marker resetOld = markers[previousMarkerId]!
            .copyWith(iconParam: BitmapDescriptor.defaultMarker);
        markers[previousMarkerId] = resetOld;
      }
      selectedMarker = markerId;
      final Marker newMarker = tappedMarker.copyWith(
        iconParam: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ),
      );
      markers[markerId] = newMarker;
      update();
    }
  }

  onOpenLocationSetting() async {
    return showCupertinoDialog<void>(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('"CiC App" need to access your current location'),
        content: const Text(
            'Please allow location permission to access your current location. Your current location will displayed on the map and use for directions'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Close'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              await Geolocator.openLocationSettings().then((value) {
                Navigator.pop(context);
              });
            },
            child: const Text('Go to setting'),
          )
        ],
      ),
    );
  }

  Marker createMarker() {
    if (_markerIcon != null) {
      return Marker(
          markerId: const MarkerId("marker_1"),
          position: kMapCenter,
          icon: _markerIcon!,
          onTap: () {});
    } else {
      return const Marker(
        markerId: MarkerId("marker_1"),
        position: kMapCenter,
      );
    }
  }

  void addMarker(String title, LatLng latlng) {
    final int markerCount = markers.length;
    markers = <MarkerId, Marker>{};
    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'marker_id_$markerIdCounter';
    markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: latlng,
      infoWindow: InfoWindow(title: title, snippet: '*'),
      onTap: () {
        onMarkerTapped(markerId);
      },
      onDragEnd: (LatLng position) {
        // onMarkerDragEnd(markerId, position);
      },
    );

    markers[markerId] = marker;
    update();
  }

  Future<void> createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: const Size.square(48));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/google_marker.png',
              mipmaps: true)
          .then(updateBitmap);
    }
  }

  void updateBitmap(BitmapDescriptor bitmap) {
    _markerIcon = bitmap;
    update();
  }

  void onMapCreated(GoogleMapController controllerParam) {
    googleMapcontroller = controllerParam;
    update();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        onOpenLocationSetting();

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      onOpenLocationSetting();

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position currentLocation = await Geolocator.getCurrentPosition();
    currentLatStore.value = currentLocation.latitude.toString();
    currentLngStore.value = currentLocation.longitude.toString();
    latitute = currentLocation.latitude;
    longtitute = currentLocation.longitude;
    update();
    return currentLocation;
  }

  bool? isLoading = false;
  onGetPlaceMark() {}
  Future<DirectionModel> onGetDirections() async {
    isLoading = true;
    update();
    const String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=11.571650122647663, 104.89711736819251&destination=11.573079583465509, 104.92475484976875&key=AIzaSyCxFsYMZ51BZXTf7G4e9n78FUYT8fQHQj8';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          directionModel = DirectionModel.fromJson(responseJson);
          update();
        }
      });
    } finally {
      isLoading = false;
      update();
    }
    return directionModel!;
  }
}
