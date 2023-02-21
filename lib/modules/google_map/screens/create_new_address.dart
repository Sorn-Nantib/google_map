import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/components/custom_button.dart';
import 'package:google_map/modules/google_map/controller/map_controller.dart';
import 'package:google_map/modules/google_map/screens/google_map_screen.dart';

import '../../../components/custom_textfield.dart';
import 'custom_google_map/custom_google_map.dart';

class CreateNewAddressScreen extends StatefulWidget {
  const CreateNewAddressScreen({super.key});

  @override
  State<CreateNewAddressScreen> createState() => _CreateNewAddressScreenState();
}

final addressController = Get.put(AddressController());

class _CreateNewAddressScreenState extends State<CreateNewAddressScreen> {
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
                    hintText: 'Location Detail',
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
                  CustomButton(onPressed: () {}, buttonName: 'Save Address'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
