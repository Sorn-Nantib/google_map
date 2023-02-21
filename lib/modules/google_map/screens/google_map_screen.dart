import 'package:flutter/material.dart';
import 'package:google_map/modules/google_map/screens/custom_google_map/custom_google_map.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomGoogleMap(
        isEnable: true,
        isScrolled: true,
      ),
    );
  }
}
