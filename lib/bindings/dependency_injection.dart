import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/controller/user_utility_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<SharedPref>(SharedPref(), permanent: true);
    Get.put<CategoryController>(CategoryController(), permanent: true);
    Get.put<CartController>(CartController(), permanent: true);
    Get.put<UserUtilityController>(UserUtilityController(), permanent: true);
  }
}
