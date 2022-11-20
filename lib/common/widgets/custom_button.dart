import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback pressed;
  const CustomButton({Key? key, required this.text, required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50)),
      child: Text(text),
    );
  }
}
