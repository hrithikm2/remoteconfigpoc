import 'package:get/get.dart';

import '../controllers/product_page_2_controller.dart';

class ProductPage2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPage2Controller>(
      () => ProductPage2Controller(),
    );
  }
}
