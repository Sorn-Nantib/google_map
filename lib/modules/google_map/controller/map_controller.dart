import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/modules/google_map/models/address_model.dart';

class AddressController extends GetxController {
  final addressController = TextEditingController().obs;
  final locationDetailController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  var addressModel = AddressModel().obs;

  addItem(String addressName, String locationDetail, String desc) {
    
  }
}
