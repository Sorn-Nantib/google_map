import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoding/geocoding.dart';

class MyGoogleMapScreen extends StatefulWidget {
  const MyGoogleMapScreen({super.key});

  @override
  State<MyGoogleMapScreen> createState() => _MyGoogleMapScreenState();
}

class _MyGoogleMapScreenState extends State<MyGoogleMapScreen> {
    String stAddress = '';
  String stADD = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text('MY GOOGLE MAP'),),body:Column(
        children: [
          Text(stAddress),
          Text(stADD),

          ElevatedButton(
                    onPressed: () async {
                      List<Location> locations = await locationFromAddress(
                          "Gronausestraat 710, Enschede");

                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(11.5815697,104.9017115);
                      setState(() {
                        stAddress = locations.last.longitude.toString() +
                            "" +
                            locations.last.longitude.toString();

                            stADD = placemarks.reversed.last.country.toString() + "" +placemarks.reversed.last.street .toString();
                      });
                    },
                    child: const Text('Set Address'),
                  )
        ],
      ) ,
      );
  }
}