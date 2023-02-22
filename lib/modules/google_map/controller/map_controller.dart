import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/modules/google_map/models/address_model.dart';

class AddressController extends GetxController {
  final addressController = TextEditingController().obs;
  final locationDetailController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  var addressModel = AddressModel().obs;
  var isLoading = false.obs;
//Testing
  String googleApikey = "API_KEY";
  double latitude = 11.5815697; 
  double longitude = 104.9017115;

  String address = "";

  addItem(String addressName, String locationDetail, String desc) {
    
  }



  convertToAddress(double lat, double long, String apikey) async {
      Dio dio = Dio();  //initilize dio package
      String apiurl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apikey";
    
      var response = await dio.get(apiurl); //send get request to API URL

      if(response.statusCode == 200){ //if connection is successful
          Map data = response.data; //get response data
          if(data["status"] == "OK"){ //if status is "OK" returned from REST API
              if(data["results"].length > 0){ //if there is atleast one address
                 Map firstresult = data["results"][0]; //select the first address

                 address = firstresult["formatted_address"]; 

                
                 
                 
              }
          }else{
             print(data["error_message"]);
          }
      }else{
         print("error while fetching geoconding data");
      }  
  }
}
