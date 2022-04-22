import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextInputAction textInputAction;

  const PasswordField(
      {Key? key,
      required this.passwordController,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textInputAction: widget.textInputAction,
      obscureText: !showPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        prefixIcon: Image.asset(
          passwordPrefixIcon,
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: Image.asset(
            showPassword ? hideShowPassword : hideShowPassword,
          ),
        ),
        helperText: '',
        hintText: 'Mật khẩu',
        fillColor: Colors.white,
      ),
      controller: widget.passwordController,
      textInputAction: widget.textInputAction,
    );
  }
}
