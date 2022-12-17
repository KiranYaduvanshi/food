import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapImplementController extends GetxController {
  List<Marker> markers = <Marker>[].obs;
  // Rx<dynamic> markers = {}.obs;
  // Set<Rx<Marker>> markers = {};
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Rx<Position> currentPosition = Position(
    longitude: 30.71111,
    latitude: -76.8087150156498,
  ).obs;
  GoogleMapController? mapController;
  RxString currentAddress = "".obs;
  String myAddress = "";

  RxInt value = (-1).obs;
  RxBool selectStatus = false.obs;

  Future<Position> currentLocation() async {
    currentPosition.value = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
              currentPosition.value.latitude,
              currentPosition.value.longitude,
            ),
            zoom: 14.47),
      ),
    );
    return currentPosition.value;
  }

  Future<String> getAddressFromLatLng(Position currrentPosition) async {
    List<Placemark> p = await geolocator.placemarkFromCoordinates(
      currentPosition.value.latitude,
      currentPosition.value.longitude,
    );

    Placemark place = p[0];

    currentAddress.value =
        "${place.subLocality},${place.postalCode},${place.country} ";

    myAddress = "${place.locality}";
    return currentAddress.value;
  }

  @override
  void onInit() {
    super.onInit();
    getMap();
  }

  getMap() async {
    await currentLocation().then((value) {
      currentPosition.value = value;
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(
                value.latitude,
                value.longitude,
              ),
              zoom: 17.47),
        ),
      );
    });

    currentAddress.value = await getAddressFromLatLng(currentPosition.value);
  }
}
