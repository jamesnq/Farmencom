import 'package:flutter/material.dart';
import 'package:uet_hackathon_2022/constants/constants.dart';
import 'package:uet_hackathon_2022/ui/authen/widget/confirm_button.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    unitController.dispose();
    quantityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Đăng bài bán hàng'),
          backgroundColor: const Color(themeColor),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  // textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    filled: true,
                    // prefixIcon: Image.asset(
                    //   namePrefixIcon,
                    // ),
                    helperText: '',
                    hintText: 'Tên sản phẩm',
                    fillColor: Colors.white,
                  ),
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  // textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    filled: true,
                    // prefixIcon: Image.asset(
                    //   namePrefixIcon,
                    // ),
                    helperText: '',
                    hintText: 'Giá sản phẩm',
                    fillColor: Colors.white,
                  ),
                  controller: priceController,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  // textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    filled: true,
                    // prefixIcon: Image.asset(
                    //   namePrefixIcon,
                    // ),
                    helperText: '',
                    hintText: 'Số lượng',
                    fillColor: Colors.white,
                  ),
                  controller: quantityController,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  // textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    filled: true,
                    // prefixIcon: Image.asset(
                    //   namePrefixIcon,
                    // ),
                    helperText: '',
                    hintText: 'Đơn vị',
                    fillColor: Colors.white,
                  ),
                  controller: unitController,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  // textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    filled: true,
                    // prefixIcon: Image.asset(
                    //   namePrefixIcon,
                    // ),
                    helperText: '',
                    hintText: 'Mô tả',
                    fillColor: Colors.white,
                  ),
                  controller: descriptionController,
                  // textInputAction: TextInputAction.next,
                ),
                MySubmitElevatedButton(
                    onPressed: () {},
                    submitText: 'Đăng bài',
                    textColor: Colors.white,
                    buttonColor: const Color(themeColor)),
              ],
            ),
          ),
        ));
  }
}
