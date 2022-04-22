import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';
import 'package:uet_hackathon_2022/ui/category_screen/category_screen.dart';
import 'package:uet_hackathon_2022/ui/weather_screen/weather_screen.dart';


import '../ui/account_screen/account_screen.dart';
import '../ui/bag_screen/bag_screen.dart';
import '../ui/home_screen/home_screen.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final screen = [
    const HomeScreen(),
    const CategoryScreen(),
    const BagScreen(),
    const WeatherScreen(),
    const AccountScreen(),
  ];
  int _selectedIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: const Color(themeColor),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(farmerHome),
              label: "Trang chủ",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(farmerCategory),
              label: "Phân loại",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(farmerBarn),
              label: "Nhà kho",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(farmerWeather),
              label: "Thời tiết",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(farmerAccount),
              label: "Tài khoản",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTapItem,
        ),
      ),
    );
  }
}
