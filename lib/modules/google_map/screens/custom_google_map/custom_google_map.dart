// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  final bool? isEnable;
  final bool? isScrolled;
  final VoidCallback? onTab;
  const CustomGoogleMap({
    Key? key,
    this.onTab,
    this.isScrolled = false,
    this.isEnable = false,
  }) : super(key: key);

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final myCurrnetLoacation =
      const LatLng(11.588000535464978, 104.89708251231646);

  Set<Marker> markers = {};

  Future<Position> _determinePosition() async {
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
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void setMarker() async {
    final position = await _determinePosition();
    debugPrint('LatLong: ${position.latitude}, ${position.longitude}');
    markers.add(
      Marker(
        position: LatLng(position.latitude, position.longitude),
        markerId: const MarkerId('MyCurrentLocation'),
      ),
    );
    setState(() {});
  }

  void onMovedCamera() async {
    final position = await _determinePosition();
    _googleMapController!.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude), 14));
  }

  @override
  void initState() {
    setMarker();
    onMovedCamera();
    super.initState();
  }

  GoogleMapController? _googleMapController;
  final newLatlng = LatLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            scrollGesturesEnabled: widget.isScrolled!,
            onMapCreated: (controller) {
              _googleMapController = controller;
            },
            onTap: (v) {
              debugPrint('========getLatLng: $v');
              v;
            },
            onCameraMove: (value) {
              debugPrint(
                  '===Latlng on Moved: ${value.target.latitude}, ${value.target.longitude}');
            },
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            markers: markers,
            initialCameraPosition: CameraPosition(
              target: myCurrnetLoacation,
              zoom: 13,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 120,
            right: 120,
            child: widget.isEnable!
                ? ElevatedButton(
                    onPressed: () {},
                    child: const Text('Set Address'),
                  )
                : const SizedBox(),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/icons/pin_icon.png',
              scale: 10.5,
            ),
          ),
        ],
      ),
      floatingActionButton: widget.isEnable!
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                onMovedCamera();
              },
              child: const Icon(
                Icons.my_location,
                color: Colors.black,
              ),
            )
          : const SizedBox(),
    );
  }
}
