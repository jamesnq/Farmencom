import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';
import 'package:uet_hackathon_2022/ui/authen/screens/register_screen.dart';
import 'package:uet_hackathon_2022/ui/authen/screens/sign_in.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                height: screenSize.height * 0.4,
                color: Color(themeColor),
              ),
            ],
          ),
          Positioned(
            top: screenSize.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(logo),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height * 0.5,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Farmencom',
                    style: TextStyle(
                      color: Color(themeColor),
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: screenSize.width * 0.8,
                    ),
                    child: const Text(
                      'Ứng dụng kết nối nông dân và doanh nghiệp',
                      style: TextStyle(
                        color: Color(themeColor),
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth:
                        screenSize.width > 500 ? 480 : screenSize.width * 0.8,
                    minWidth: screenSize.width > 500
                        ? 462.8
                        : screenSize.width * 0.65,
                  ),
                  // width: screenSize.width * 0.65,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            var route = MaterialPageRoute(
                                builder: (context) => const LoginScreen());
                            Navigator.push(context, route);
                          },
                          child: const Text('Đăng nhập'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            primary: const Color(themeColor),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.zero,
                                  bottomRight: Radius.zero,
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            var route = MaterialPageRoute(
                                builder: (context) => const SignUpScreen());
                            Navigator.push(context, route);
                          },
                          child: const Text('Đăng kí'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            primary: const Color(lightThemeColor),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.zero),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
