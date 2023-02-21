import 'package:flutter/material.dart';
import 'package:google_map/components/custom_button.dart';

import 'create_new_address.dart';

class MyLocationAddress extends StatefulWidget {
  const MyLocationAddress({super.key});

  @override
  State<MyLocationAddress> createState() => _MyLocationAddressState();
}

class _MyLocationAddressState extends State<MyLocationAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: 1,
                itemBuilder: (context, index) {
              
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(),
                        const SizedBox(width: 15.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [Text('Title'), Text('Subtitle')],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CreateNewAddressScreen();
                      },
                    ),
                  );
                },
                buttonName: 'Add new Address',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
