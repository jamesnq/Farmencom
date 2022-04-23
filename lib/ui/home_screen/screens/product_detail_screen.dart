import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';

import '../../../modules/products.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(themeColor),
        automaticallyImplyLeading: true,
        title: Text(widget.product.name),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     children: [
      //       Column(
      //         children: [
      //           Image.asset(chat),
      //           Text('Chat'),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.product.banner),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.product.price.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(themeColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
