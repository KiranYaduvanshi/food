import 'package:food_user/authentication/auth_binding/forgot_pass_binding.dart';
import 'package:food_user/authentication/auth_binding/login_binding.dart';
import 'package:food_user/authentication/auth_binding/register_binding.dart';
import 'package:food_user/authentication/forgot_password.dart';
import 'package:food_user/authentication/login.dart';
import 'package:food_user/authentication/register.dart';
import 'package:food_user/home/binding/add_address_binding.dart';
import 'package:food_user/home/binding/adress_binding.dart';
import 'package:food_user/home/binding/checkout_binding.dart';
import 'package:food_user/home/binding/homeBottomBinding.dart';
import 'package:food_user/home/binding/my_order_binding.dart';
import 'package:food_user/home/binding/oder_done_binding.dart';
import 'package:food_user/home/binding/paymnet_binidng.dart';
import 'package:food_user/home/binding/product_detail_binding.dart';
import 'package:food_user/home/home_bottom_navigation.dart';
import 'package:food_user/home/home_page.dart';
import 'package:food_user/home/my_order.dart';
import 'package:food_user/home/screens/add_address.dart';
import 'package:food_user/home/screens/address_screen.dart';
import 'package:food_user/home/screens/check_out_screen.dart';
import 'package:food_user/home/screens/order_success.dart';
import 'package:food_user/home/screens/payment_method.dart';
import 'package:food_user/home/screens/product/cart.dart';
import 'package:food_user/home/screens/product/product_details.dart';
import 'package:food_user/home/screens/product/setting.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:get/get.dart';
import '../sliver_app_demo.dart';

class AppPages {
  static const homeRoute = AppRoutes.login;

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBottomBinding(),
    ),
    GetPage(
      name: AppRoutes.homeBottomNavigation,
      page: () => HomeBottomNavigation(),
      binding: HomeBottomBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => ProductDetails(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => SignUpScren(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPass,
      page: () => ForgotPassword(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartScreen(),
      binding: HomeBottomBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingScreen(),
      binding: HomeBottomBinding(),
    ),
    GetPage(
      name: AppRoutes.myOrders,
      page: () => MyOrderScreen(),
      binding: MyOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.sliver,
      page: () => SliverAppDemo(),
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => CheckOutScreen(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentMethodScreen(),
      binding: PayemnetMethodBinding(),
    ),
    GetPage(
      name: AppRoutes.address,
      page: () => AddressScreen(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: AppRoutes.orderDone,
      page: () => const OrderDoneScreen(),
      binding: OrderDoneBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.subCategory,
    //   page: () => SubCatScreen(),
    //   binding: SubCatBinding(),
    // ),
    GetPage(
      name: AppRoutes.addAddress,
      page: () => AddAddressScreen(),
      binding: AddAdressBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.producList,
    //   page: () => ProductListscreen(),
    //   binding: ProductListBinding(),
    // ),
  ];
}
