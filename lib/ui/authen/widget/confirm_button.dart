import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';

class MySubmitElevatedButton extends StatelessWidget {
  final String submitText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  const MySubmitElevatedButton({
    Key? key,
    required this.onPressed,
    required this.submitText,
    this.buttonColor = Colors.white,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: Size(
          screenSize.width > 500 ? 480 : screenSize.width * 0.8,
          60,
        ),
        minimumSize: Size(
          screenSize.width > 500 ? 462.8 : screenSize.width * 0.65,
          60,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        primary: buttonColor,
      ),
      child: Text(
        submitText,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
