import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AddressField extends StatefulWidget {
  final TextEditingController addressController;
  final TextInputAction textInputAction;

  const AddressField({
    Key? key,
    required this.addressController,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  State<AddressField> createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      // textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        filled: true,
        prefixIcon: Image.asset(
          addressPrefixIcon,
        ),
        helperText: '',
        hintText: 'Địa chỉ',
        fillColor: Colors.white,
      ),
      controller: widget.addressController,
      textInputAction: widget.textInputAction,
    );
  }
}
