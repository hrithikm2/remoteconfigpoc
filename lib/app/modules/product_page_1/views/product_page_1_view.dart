import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_page_1_controller.dart';

class ProductPage1View extends GetView<ProductPage1Controller> {
  const ProductPage1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductPage1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductPage1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
