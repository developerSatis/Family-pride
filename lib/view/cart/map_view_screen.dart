import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CartController cartController = Get.put(CartController());
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      // target: LatLng(lat!, long!),
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // _load();
    super.initState();
  }

  double? lat = 37.43296265331129;
  double? long = -122.08832357078792;

  // _load() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   lat = position.latitude;
  //   long = position.longitude;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextSimple(
          text: "Select address",
          fontSize: 15,
        ),
      ),
      body: Obx(
        () => GoogleMap(
          // mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(
                cartController.userLat.value, cartController.userLong.value),
            zoom: 14.4746,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            Marker(
                markerId: const MarkerId(
                  'sourceLocation',
                ),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(
                  cartController.userLat.value,
                  cartController.userLong.value,
                ),
                infoWindow:
                    InfoWindow(title: cartController.realTimeAddress.value)),
          },
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            backgroundColor: whiteColor,
            onPressed: _goToTheLake,
            label: CustomTextRich(
              text: "Address Location",
              color: greenColor,
              fontSize: 15,
              textAlign: TextAlign.center,
              children: [
                TextSpan(
                    text: "\nClick Here",
                    style: TextStyle(fontSize: 13, color: redColor))
              ],
            ),
            icon: Icon(
              Icons.golf_course_rounded,
              color: greenColor,
            ),
          ),
          GestureDetector(
            onTap: () => Get.back(),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: greenColor,
                    ),
                    getwidth(context, 0.020),
                    const CustomTextSimple(
                      text: "Confirm",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    print("this is lat $lat");

    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            // bearing: 192.8334901395799,
            target: LatLng(
                cartController.userLat.value, cartController.userLong.value),
            // target: LatLng(37.43296265331129, -122.08832357078792),
            // tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
  }
}
