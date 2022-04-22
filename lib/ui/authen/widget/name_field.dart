import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class NameField extends StatefulWidget {
  final TextEditingController nameController;
  final TextInputAction textInputAction;

  const NameField(
      {Key? key,
      required this.nameController,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
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
          namePrefixIcon,
        ),
        helperText: '',
        hintText: 'Tên',
        fillColor: Colors.white,
      ),
      controller: widget.nameController,
      textInputAction: widget.textInputAction,
    );
  }
}
