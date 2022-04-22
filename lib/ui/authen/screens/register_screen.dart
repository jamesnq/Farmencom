import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/ui/authen/screens/role_pick_screen.dart';
import 'package:uet_hackathon_2022/ui/authen/widget/address_field.dart';

import '../../../constants/constants.dart';
import '../widget/confirm_button.dart';
import '../widget/password_field.dart';
import '../widget/phone_number_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: screenSize.height * 0.35,
                  color: Colors.white,
                ),
                Container(
                  height: screenSize.height * 0.65,
                  color: const Color(themeColor),
                ),
              ],
            ),
            Positioned(
              top: screenSize.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(logo),
                ],
              ),
            ),
            Positioned(
              top: screenSize.height * 0.45,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          screenSize.width > 500 ? 480 : screenSize.width * 0.8,
                      minWidth: screenSize.width > 500
                          ? 462.8
                          : screenSize.width * 0.65,
                    ),
                    child: Form(
                      key: _form,
                      child: Column(
                        children: [
                          AddressField(addressController: addressController),
                          PhoneNumberField(
                              phoneNumberController: phoneNumberController),
                          PasswordField(passwordController: passwordController),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          MySubmitElevatedButton(
                            onPressed: () {
                              var route = MaterialPageRoute(
                                  builder: (context) => RolePickScreen(
                                        phoneNumber: phoneNumberController.text,
                                        address: addressController.text,
                                        password: passwordController.text,
                                      ));
                              Navigator.push(context, route);
                            },
                            submitText: 'Tiếp tục',
                            textColor: const Color(themeColor),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
