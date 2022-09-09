import 'dart:async';

import 'package:cicgreenloan/modules/google_map_module/controllers/google_map_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Utils/helper/custom_appbar.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key, this.latitude, this.longtitude, this.title})
      : super(key: key);
  final double? latitude;
  final double? longtitude;
  final String? title;

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  final _googleMapCon = Get.put(GoogleMapsController());

  @override
  Widget build(BuildContext context) {
    _googleMapCon.createMarkerImageFromAsset(context);

    // _googleMapCon.determinePosition().then((position) {
    //   _googleMapCon.currentPosition = position;
    // });
    _googleMapCon.onGetDirections().then((value) {});
    if (widget.latitude != null && widget.longtitude != null) {
      debugPrint("Hello WOrld");
      _googleMapCon.addMarker(
          widget.title!, LatLng(widget.latitude!, widget.longtitude!));
      Future.delayed(
        const Duration(seconds: 1),
        () {
          _googleMapCon
              .onAnimateCamera(LatLng(widget.latitude!, widget.longtitude!));
        },
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Google Maps',
        isLeading: true,
      ),
      body: GetBuilder(
        builder: (controller) {
          return Stack(
            children: [
              GoogleMap(
                  initialCameraPosition: const CameraPosition(
                      target: GoogleMapsController.kMapCenter, zoom: 12),
                  compassEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: _googleMapCon.onMapCreate,
                  markers: Set<Marker>.of(_googleMapCon.markers.values)),
              // Positioned(
              //   bottom: 30,
              //   right: 10,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       FloatingActionButton(
              //         heroTag: 'myLocation',
              //         elevation: 2,
              //         backgroundColor: Colors.white,
              //         onPressed: () => _googleMapCon.onAnimateCamera(
              //             LatLng(_googleMapCon.currentPosition!.latitude,
              //                 _googleMapCon.currentPosition!.longitude),
              //             _argument),
              //         child: Icon(
              //           Icons.my_location,
              //           color: Colors.black54,
              //         ),
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       FloatingActionButton(
              //         heroTag: 'direction',
              //         elevation: 2,
              //         onPressed: () => _googleMapCon.onAnimateCamera(
              //             LatLng(
              //                 _googleMapCon.latitute, _googleMapCon.longtitute),
              //             _argument),
              //         child: Icon(
              //           Icons.directions,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
        init: _googleMapCon,
      ),
    );
  }
}
