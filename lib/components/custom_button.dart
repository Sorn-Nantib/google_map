import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.onPressed,required this.buttonName});

  final VoidCallback? onPressed;
  final String? buttonName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text('$buttonName'),
    );
  }
}
