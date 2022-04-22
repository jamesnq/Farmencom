import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/ui/authen/screens/register_screen.dart';
import 'package:uet_hackathon_2022/ui/authen/widget/confirm_button.dart';
import 'package:uet_hackathon_2022/ui/authen/widget/password_field.dart';
import 'package:uet_hackathon_2022/ui/authen/widget/phone_number_field.dart';
import 'package:uet_hackathon_2022/ui/home_screen/home_screen.dart';

import '../../../constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                  const Center(
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  ),
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
                          PhoneNumberField(
                              phoneNumberController: phoneNumberController),
                          PasswordField(passwordController: passwordController),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.of(context).pushNamed(SignUpScreen.routeName)
                                  var route = MaterialPageRoute(
                                      builder: (context) => const SignUpScreen());
                                  Navigator.push(context, route);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const InkWell(
                                child: Text('Forgot Password?'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MySubmitElevatedButton(
                            onPressed: () {
                              var route = MaterialPageRoute(
                                  builder: (context) => const HomeScreen());
                              Navigator.push(context, route);
                            },
                            submitText: 'Đăng nhập',
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
