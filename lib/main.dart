import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/ui/intro_screen/intro_screen.dart';
import 'package:uet_hackathon_2022/ui/authen/screens/sign_in.dart';
import 'package:uet_hackathon_2022/screens/tab_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroScreen(),
    );
  }
}


