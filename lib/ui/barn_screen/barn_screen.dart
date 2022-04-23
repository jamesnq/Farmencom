import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';
import 'package:uet_hackathon_2022/ui/barn_screen/screens/orderRequestTab.dart';
import 'package:uet_hackathon_2022/ui/barn_screen/screens/orderWaitingTab.dart';
import 'package:uet_hackathon_2022/ui/barn_screen/screens/producingTab.dart';

import '../../modules/products.dart';

class BarnScreen extends StatefulWidget {
  const BarnScreen({Key? key}) : super(key: key);

  @override
  State<BarnScreen> createState() => _BarnScreenState();
}

class _BarnScreenState extends State<BarnScreen> {
  List<Product> products = allProduct;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nhà kho'),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(themeColor),
          bottom: TabBar(tabs: [
            Tab(
              height: 100,
              icon: Image.asset(orderWaiting, color: Colors.white,),
              child: const Text("Đang đợi đặt hàng", textAlign: TextAlign.center,),
            ),
            Tab(
              height: 100,
              icon: Image.asset(orderRequest, color: Colors.white,),
              child: const Text('Yêu cầu đặt hàng', textAlign: TextAlign.center,),
            ),
            Tab(
              height: 100,
              icon: Image.asset(producing, color: Colors.white,),
              child: const Text('Đang đặt hàng', textAlign: TextAlign.center,),
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            OrderWaitingTab(),
            OrderRequestTab(),
            ProducingTab(),
          ],
        ),
      ),
    );
  }
}
