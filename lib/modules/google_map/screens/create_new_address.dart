import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_map/components/custom_button.dart';
import 'package:google_map/modules/google_map/controller/map_controller.dart';
import 'package:google_map/modules/google_map/screens/custom_google_map/maps.dart';
import 'package:google_map/modules/google_map/screens/google_map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../components/custom_textfield.dart';
import 'custom_google_map/custom_google_map.dart';

class CreateNewAddressScreen extends StatefulWidget {
  const CreateNewAddressScreen({super.key});

  @override
  State<CreateNewAddressScreen> createState() => _CreateNewAddressScreenState();
}

final addressController = Get.put(AddressController());

class _CreateNewAddressScreenState extends State<CreateNewAddressScreen> {
  

  // Future<void> getAddressFromLatLng(LatLng position) async {
  //   try {
  //     await placemarkFromCoordinates(position.latitude, position.longitude)
  //         .then((List<Placemark> placemarks) {
  //       Placemark place = placemarks[0];
  //       setState(() {
  //         stAddress =
  //             '${place.street}, ${place.administrativeArea},${place.name}, ${place.country}'
  //                 .toString();
  //       });
  //       debugPrint("Full Address:$stAddress");
  //     });
  //   } catch (e) {
  //     debugPrint("Error :$e");
  //   } finally {
  //     debugPrint("Error final  :");
  //   }
  // }

 



  // getAddressFromLatLngs() async {
  //   try {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(11.55072, 104.8969216
  //             // _currentPosition!.latitude,
  //             // _currentPosition!.longitude
  //             );

  //     Placemark place = placemarks[0];

  //     setState(() {
  //       _currentAddress =
  //           "${place.locality}, ${place.postalCode}, ${place.country}";
  //     });
  //     debugPrint('nanatib :  ${ _currentAddress}');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

@override
  void initState() {
  
     addressController.getAddressFromLatLng(addressController.latitudePosition.value,addressController.longitudePosition.value);
    super.initState();
  }
  String? _currentAddress;
  String? stAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: CustomGoogleMap(
                      isScrolled: false,
                      isEnable: false,
                      onTab: () {
                        debugPrint('=============');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const GoogleMapScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    textEditingController:
                        addressController.addressController.value,
                    hintText: 'Address Name',
                    obscureText: false,
                    readOnly: false,
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    onTap: () {
                      debugPrint('===Goto GoogleMap Screen===');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const GoogleMapScreen();
                          },
                        ),
                      );
                    },
                    textEditingController:
                        addressController.locationDetailController.value,
                    readOnly: true,
                    hintText: addressController.address.value,
                    labelText:'Location',
                    obscureText: false,
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    textEditingController:
                        addressController.descriptionController.value,
                    hintText: 'description',
                    readOnly: false,
                    obscureText: false,
                  ),
                  Wrap(
                      children:
                          List.generate(3, (index) => const CircleAvatar())),
                  const Spacer(),
                  CustomButton(
                      onPressed: () {
                       
                       //addressController.getAddressFromLatLng(addressController.latitudePosition .value,addressController.longitudePosition.value);
                        debugPrint('Hello kon haha ');
                      },
                      buttonName: 'Save Address'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
