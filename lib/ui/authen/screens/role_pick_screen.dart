import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/api/api_services.dart';
import 'package:uet_hackathon_2022/ui/authen/screens/sign_in.dart';
import 'package:uet_hackathon_2022/ui/authen/widget/confirm_button.dart';
import 'package:uet_hackathon_2022/ui/authen/widget/name_field.dart';
import 'package:uet_hackathon_2022/ui/home_screen/screens/home_screen.dart';

import '../../../constants/constants.dart';
import '../widget/password_field.dart';
import '../widget/phone_number_field.dart';
import '../widget/role_picker.dart';

class RolePickScreen extends StatefulWidget {
  String _phoneNumber;
  String _password;
  String _address;

  RolePickScreen({
    Key? key,
    required String phoneNumber,
    required String password,
    required String address,
  })  : _phoneNumber = phoneNumber,
        _password = password,
        _address = address,
        super(key: key);

  get phoneNumber => _phoneNumber;
  get password => _password;
  get address => _address;

  @override
  State<RolePickScreen> createState() => _RolePickScreenState();
}

class _RolePickScreenState extends State<RolePickScreen> {
  final _form = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
                  Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          screenSize.width > 500 ? 480 : screenSize.width * 0.8,
                      minWidth: screenSize.width > 500
                          ? 462.8
                          : screenSize.width * 0.65,
                    ),
                    child: NameField(nameController: nameController),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const RolePicker(
                      prefixIcon: companyIcon, text: 'Doanh nghiệp'),
                  const SizedBox(
                    height: 20,
                  ),
                  const RolePicker(prefixIcon: farmerIcon, text: 'Nông dân'),
                  const SizedBox(
                    height: 20,
                  ),
                  MySubmitElevatedButton(
                    onPressed: () async {
                      // TODO: Validate
                      var value = await ApiServices().postSignUp(
                          nameController.text,
                          widget.phoneNumber,
                          widget.password,
                          widget.address,
                          'farmer'); // TODO: Làm hộ đi :)) chưa nghiên cứu
                      final error = value.error;
                      if (error != null) {
                        // TODO: Waiting for popup design
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                      var route = MaterialPageRoute(
                          builder: (context) => const LoginScreen());
                      Navigator.push(context, route);
                    },
                    submitText: 'Hoàn thành',
                    textColor: const Color(themeColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
