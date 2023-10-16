import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_page_2_controller.dart';

class ProductPage2View extends GetView<ProductPage2Controller> {
  const ProductPage2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductPage2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductPage2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
