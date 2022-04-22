import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';
import 'package:uet_hackathon_2022/modules/products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  List<Product> products = allProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Nhập nội dung cần tìm',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(themeColor)),
                )),
          ),
        ),
        Expanded(
            child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(products.length, (index) {
            return Container(
              margin: const EdgeInsets.all(10),
              color: Colors.red,
              child: Column(
                children: [
                  Image.asset(products[index].banner, fit: BoxFit.fill,),
                  Text(
                    (products[index].name),
                  ),
                ],
              ),
            );
          }),
        )),
      ],
    ));
  }
}
