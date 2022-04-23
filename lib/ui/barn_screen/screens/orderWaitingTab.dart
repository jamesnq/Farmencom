import 'package:flutter/material.dart';

import '../../../modules/products.dart';

class OrderWaitingTab extends StatefulWidget {
  const OrderWaitingTab({Key? key}) : super(key: key);

  @override
  State<OrderWaitingTab> createState() => _OrderWaitingTabState();
}

class _OrderWaitingTabState extends State<OrderWaitingTab> {
  List<Product> products = allProduct;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(10),
          height: 130,
          child: ListTile(
            leading: Image.asset(
              products[index].banner,
              fit: BoxFit.cover,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tên sản phẩn: ' + products[index].name),
                const Text('Số lượng'),
                const Text('100'),
              ],
            ),
          ),
        );
      },
    );
  }
}
