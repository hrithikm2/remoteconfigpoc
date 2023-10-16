import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product_page_1/bindings/product_page_1_binding.dart';
import '../modules/product_page_1/views/product_page_1_view.dart';
import '../modules/product_page_2/bindings/product_page_2_binding.dart';
import '../modules/product_page_2/views/product_page_2_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.productPage1,
      page: () => const ProductPage1View(),
      binding: ProductPage1Binding(),
    ),
    GetPage(
      name: _Paths.productPage2,
      page: () => const ProductPage2View(),
      binding: ProductPage2Binding(),
    ),
  ];
}
