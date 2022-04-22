import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';
import 'package:uet_hackathon_2022/modules/products.dart';
import 'package:uet_hackathon_2022/ui/home_screen/screens/product_detail_screen.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              onChanged: searchProduct,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Nhập nội dung cần tìm',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(themeColor)),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xf5f5f5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Yêu cầu đặt hàng từ doanh nghiệp',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            // height: 30,
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(products.length, (index) {
              return GestureDetector(
                onTap: () {
                  var route = MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      product: products[index],
                    ),
                  );
                  Navigator.push(context, route);
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  // color: Colors.red,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        products[index].banner,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 20,
                        child: Text(
                          (products[index].name),
                        ),
                      ),
                      Text(
                        products[index].price.toString() + ' vnd',
                        style: const TextStyle(
                          color: Color(themeColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          )),
        ],
      ),
    );
  }

  void searchProduct(String query) {
    final suggestions = allProduct.where((product) {
      final productName = product.name.toLowerCase();
      final input = query.toLowerCase();
      return productName.contains(input);
    }).toList();

    setState(() {
      products = suggestions;
    });
  }
}
