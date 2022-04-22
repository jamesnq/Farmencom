import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';

class RolePicker extends StatefulWidget {
  final String prefixIcon;
  final String text;

  const RolePicker({Key? key, required this.prefixIcon, required this.text})
      : super(key: key);

  @override
  State<RolePicker> createState() => _RolePickerState();
}

class _RolePickerState extends State<RolePicker> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ElevatedButton.icon(
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
        primary: Colors.white,
      ),
      onPressed: () {

      },
      icon: Image.asset(widget.prefixIcon),
      label: Text(
        widget.text,
        style: const TextStyle(
          color: Color(themeColor),
        ),
      ),
    );
  }
}
