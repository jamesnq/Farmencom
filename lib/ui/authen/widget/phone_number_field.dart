import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final TextInputAction textInputAction;

  const PhoneNumberField(
      {Key? key,
      required this.phoneNumberController,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      // textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        filled: true,
        prefixIcon: Image.asset(
          phonecallPrefixIcon,
        ),
        helperText: '',
        hintText: 'Số điện thoại',
        fillColor: Colors.white,
      ),
      controller: widget.phoneNumberController,
      textInputAction: widget.textInputAction,
    );
  }
}
