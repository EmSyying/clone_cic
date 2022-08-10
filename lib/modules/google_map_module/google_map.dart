import 'dart:async';

import 'package:cicgreenloan/modules/google_map_module/controllers/google_map_controller.dart';
import 'package:cicgreenloan/modules/event_module/models/event_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Utils/helper/custom_appbar.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  final _googleMapCon = Get.put(GoogleMapsController());

  @override
  Widget build(BuildContext context) {
    _googleMapCon.createMarkerImageFromAsset(context);
    final argument = ModalRoute.of(context)!.settings.arguments as EventData;
    _googleMapCon.determinePosition().then((position) {
      _googleMapCon.currentPosition = position;
    });
    _googleMapCon.onGetDirections().then((value) {});
    if (argument.latitude != null && argument.longitude != null) {
      _googleMapCon.addMarker(
          argument.title!, LatLng(argument.latitude!, argument.longitude!));
      Future.delayed(
        const Duration(seconds: 1),
        () {
          _googleMapCon.onAnimateCamera(
              LatLng(argument.latitude!, argument.longitude!), argument);
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
