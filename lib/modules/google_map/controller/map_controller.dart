import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_map/modules/google_map/models/address_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  final addressController = TextEditingController().obs;
  final locationDetailController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  var addressModel = AddressModel().obs;
  var isLoading = false.obs;
//Testing
  String googleApikey = "API_KEY";
  var latitude = 11.5815697.obs;
  var longitude = 104.9017115.obs;
  var latitudePosition = 0.0.obs;
  var longitudePosition = 0.0.obs;
  var address = "".obs;
  var isCheckMaker = false.obs;

  addItem(String addressName, String locationDetail, String desc) {}

  Future<void> getAddressFromLatLng(double lat,double lng) async {
    try {
      await placemarkFromCoordinates(lat, lng)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        
        address.value =
            '${place.street}, ${place.subLocality},${place.administrativeArea}, ${place.country}'
                .toString();

        debugPrint(
            "Full Address:$address ${place.street}, ${place.administrativeArea},${place.name}, ${place.country}");
      });
    } catch (e) {
      debugPrint("Full Address:$e");
    } finally {
      debugPrint("Full ");
    }
  }
 

  convertToAddress(double lat, double long, String apikey) async {
    Dio dio = Dio(); //initilize dio package
    String apiurl =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apikey";

    var response = await dio.get(apiurl); //send get request to API URL

    if (response.statusCode == 200) {
      //if connection is successful
      Map data = response.data; //get response data
      if (data["status"] == "OK") {
        //if status is "OK" returned from REST API
        if (data["results"].length > 0) {
          //if there is atleast one address
          Map firstresult = data["results"][0]; //select the first address

          address = firstresult["formatted_address"];
        }
      } else {
        print(data["error_message"]);
      }
    } else {
      print("error while fetching geoconding data");
    }
  }
}
