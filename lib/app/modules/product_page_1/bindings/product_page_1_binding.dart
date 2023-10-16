import 'package:get/get.dart';

import '../controllers/product_page_1_controller.dart';

class ProductPage1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPage1Controller>(
      () => ProductPage1Controller(),
    );
  }
}
