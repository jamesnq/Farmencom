import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';
import 'package:uet_hackathon_2022/modules/products.dart';
import 'package:uet_hackathon_2022/ui/add_item_screen/add_item_screen.dart';

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
    print(MediaQuery.of(context).size.width);
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
      backgroundColor: const Color(0xFFf5f5f5),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var route =
              MaterialPageRoute(builder: (context) => const AddItemScreen());
          Navigator.push(context, route);
        },
        backgroundColor: const Color(0XFFFE9539),
        child: const Icon(Icons.add),
      ),
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
            crossAxisSpacing: 10,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
            children: List.generate(products.length, (index) {
              return buidCard(context, products[index].banner, products[index].name,
                  products[index].price.toString(), () {});
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

  Widget buidCard(BuildContext context,
      String banner, String name, String price, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
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
          child: Column(
            children: [
              Hero(
                tag: banner,
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(banner),
                    fit: BoxFit.contain,
                  )),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Color(themeColor),
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  color: const Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Thêm vào giỏ',
                      style: TextStyle(fontSize: 12, color: Color(themeColor)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
