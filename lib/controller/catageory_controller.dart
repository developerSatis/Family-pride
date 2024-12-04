import 'dart:async';

import 'package:android_id/android_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/models/bottom_banner_model.dart';
import 'package:hindustan_food/models/category_model.dart';
import 'package:hindustan_food/models/flash_deal_product_model.dart';
import 'package:hindustan_food/models/home_product_second_model.dart';
import 'package:hindustan_food/models/home_product_third_model.dart';
import 'package:hindustan_food/models/latest_product_model.dart';
import 'package:hindustan_food/models/product_by_category_model.dart';
import 'package:hindustan_food/models/product_home_model.dart';
import 'package:hindustan_food/models/product_model.dart';
import 'package:hindustan_food/models/slider_item_model.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/loading_indicator.dart';
import 'package:hindustan_food/view/cart/wallet_applied_logic.dart';
import 'package:hindustan_food/view/confirm_page/order_confirm_page.dart';
import 'package:hindustan_food/view/home_page.dart';
import 'package:hindustan_food/view/login/otp_screen.dart';

import '../api_repo/api_repo_fun.dart';

class CategoryController extends GetxController {
  ApiRepo apiRepo = ApiRepo();

  Timer timer = Timer(const Duration(seconds: 1), () {});

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;

  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductHomeModel> homeProductList = <ProductHomeModel>[].obs;
  RxList<HomeSecondProductModel> homeProductListTwo =
      <HomeSecondProductModel>[].obs;
  RxList<SliderDataModel> sliderList = <SliderDataModel>[].obs;
  RxList<FlashDealProductModel> flashDealProductList =
      <FlashDealProductModel>[].obs;

  RxList multiImage = [].obs;

  SharedPref sharedPref = Get.put(SharedPref());

  RxMap<int, int> categoryTotal = <int, int>{}.obs;
  RxList<int> catagoryIdList = <int>[].obs;

  RxList<ProductByCategoryModel> productByCategoryList =
      <ProductByCategoryModel>[].obs;
  RxList<ProductByCategoryModel> syncproductByCategoryList =
      <ProductByCategoryModel>[].obs;
  RxList<LatestProductModel> latestProductList = <LatestProductModel>[].obs;
  RxList<BottomBannerModel> bottomBanner = <BottomBannerModel>[].obs;
  RxList<HomeThirdProductModel> homeProductListThird =
      <HomeThirdProductModel>[].obs;
  RxString productName = "".obs;
  RxString productUnit = "".obs;
  RxString productSalePrice = "".obs;
  RxString productOfferPrice = "".obs;
  RxString productQuantity = "".obs;
  RxString productDiscountPercentage = "".obs;
  RxString productDifferencePercentage = "".obs;
  RxString productPrice = "".obs;
  RxString productImage = "".obs;
  RxString productId = "".obs;
  RxString productShortDescription = "".obs;
  RxString productDescription = "".obs;
  RxString productSummary = "".obs;
  RxString productNewPrice = "".obs;
  RxList productCart = [].obs;

  RxBool isValidOtp = false.obs;
  RxString otp = "".obs;

  RxString walletTotalCut = ''.obs;
  RxString havingTotalWallet = ''.obs;
  RxString userToPay = ''.obs;

  RxString couponDiscount = "".obs;
  RxString couponCode = "".obs;
  RxString totalAfterCoupon = "".obs;

  RxBool isLatestLoading = false.obs;
  RxBool isShopOnOffLoading = false.obs;
  RxString categoryId = "".obs;

  RxString android_id = "".obs;

  RxString startTime = "".obs;
  RxString endTime = "".obs;

  RxString paymentMethod = "".obs;

  RxString orderId = "".obs;

  RxInt selectedIndex = 0.obs;

  RxBool checkstart = false.obs;
  RxBool checkend = false.obs;
  RxBool isHavingTime = false.obs;

  RxBool islogin = false.obs;
  RxBool isAddressSave = false.obs;

  RxString disclaimer = "".obs;
  RxString note = "".obs;
  RxString minimumCartValue = "".obs;
  // RxString bottamBannerUrl = "".obs;
  // RxString bottamBannerStatus = "".obs;
  RxString shopOnOff = "".obs;

  RxString userID = "".obs;
  RxString otpData = "".obs;

  late TextEditingController phoneNumberController;

  late TextEditingController addNameController;
  late TextEditingController addPhoneController;
  late TextEditingController addEmailController;
  late TextEditingController addReferCodeController;
  late TextEditingController addHouseNumController;
  late TextEditingController addAddressController;
  late TextEditingController addCityController;
  late TextEditingController addStateController;
  late TextEditingController pincodeController;

  late TextEditingController nameForRegController;
  late TextEditingController emailForRegController;
  late TextEditingController passwordForRegController;
  late TextEditingController phoneForRegController;
  late TextEditingController stateForRegController;
  late TextEditingController cityForRegController;
  late TextEditingController pinCodeForRegController;
  late TextEditingController passwordSignForRegController;
  late TextEditingController passwordLoginForRegController;
  late TextEditingController emailLoginForRegController;
  late TextEditingController conPasswordForRegController;

  late TextEditingController firstOtp;
  late TextEditingController secondOtp;
  late TextEditingController thirdOtp;
  late TextEditingController fourthOtp;
  late TextEditingController fifthOtp;
  late TextEditingController sixOtp;

  Future getCategory() async {
    // showloadingIndicator();
    try {
      await apiRepo.getCategory().then((value) async {
        if (value["status"] == true) {
          print(value["data"]);
          categoryList.value = (value["data"] as List)
              .map(
                (e) => CategoryModel.fromJson(e),
              )
              .toList();
          print('this is category list');
          print(categoryList);

          // print("thsi is catageory list model");
          // print(isAdd);
          // // hideLoading();
          // !isAdd
          //     ? Get.to(
          //         ComplaintCatagory(
          //           isAdd: isAdd,
          //         ),
          //         transition: Transition.downToUp)
          //     : null;
        } else {
          // hideLoading();
          // customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getDisclaimer() async {
    // showloadingIndicator();
    try {
      await apiRepo.getDisclaimer().then((value) async {
        if (value["success"] == true) {
          disclaimer.value = value["disclaimer"]["description"] != null
              ? value["disclaimer"]["description"].toString()
              : "";
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getNote() async {
    // showloadingIndicator();
    try {
      await apiRepo.getNote().then((value) async {
        if (value["success"] == true) {
          note.value = value["disclaimer"]["description"] != null
              ? value["disclaimer"]["description"].toString()
              : "";
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getBottamBanner() async {
    // showloadingIndicator();
    try {
      await apiRepo.getBottamBanner().then((value) async {
        if (value["success"] == true) {
          try {
            bottomBanner.value = (value["banners"] as List)
                .map(
                  (e) => BottomBannerModel.fromJson(e),
                )
                .toList();
          } catch (e) {
            print(e);
          }
          // bottamBannerUrl.value =
          //     value["imageUrl"] != null ? value["imageUrl"].toString() : "";
          // bottamBannerStatus.value = value["termCondition"] != null
          //     ? value["termCondition"]["status"].toString()
          //     : "";
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future shopOffOn() async {
    // showloadingIndicator();
    isShopOnOffLoading.value = true;
    try {
      await apiRepo.shopOnOff().then((value) async {
        if (value["status"] == true) {
          try {
            shopOnOff.value = value["message"];
            isShopOnOffLoading.value = false;
            print("today shop is ${shopOnOff.value}");
          } catch (e) {
            print(e);
          }
          print("today shop is outside ${shopOnOff.value}");
        } else {
          try {
            shopOnOff.value = value["message"];
            isShopOnOffLoading.value = false;
            print("today shop is ${shopOnOff.value}");
          } catch (e) {
            print(e);
          }
          print("today shop is outside ${shopOnOff.value}");
          // hideLoading();
          // customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getMinimumCart() async {
    // showloadingIndicator();
    try {
      await apiRepo.getminimunCart().then((value) async {
        if (value["success"] == true) {
          minimumCartValue.value = value["minimumCart"]["amount"] != null
              ? value["minimumCart"]["amount"].toString()
              : "";
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future<String?> getId() async {
    const androidIdPlugin = AndroidId();

    android_id.value = (await androidIdPlugin.getId())!;
    return android_id.value;
  }

  Future getSubCategory() async {
    // showloadingIndicator();
    try {
      await apiRepo.getsubCategory().then((value) async {
        if (value["status"] == true) {
          print(value["data"]);
          // categoryList.value = (value["data"] as List)
          //     .map(
          //       (e) => CategoryListModel.fromJson(e),
          //     )
          //     .toList();
          // print("thsi is catageory list model");
          // print(isAdd);
          // // hideLoading();
          // !isAdd
          //     ? Get.to(
          //         ComplaintCatagory(
          //           isAdd: isAdd,
          //         ),
          //         transition: Transition.downToUp)
          //     : null;
        } else {
          // hideLoading();
          // customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getProducts() async {
    // await getId();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    data["user_id"] = sharedPref.userID.value;
    // data["device_id"] = android_id.value;
    // showloadingIndicator();
    print("data");
    print(data);
    try {
      await apiRepo.getProduct(data).then((value) async {
        if (value["status"] == true) {
          // print(value["data"]);
          try {
            productList.value = (value["data"] as List)
                .map(
                  (e) => ProductModel.fromJson(e),
                )
                .toList();
          } catch (e) {
            print(e);
          }
          print("this is product list");

          // print("thsi is catageory list model");
          // print(isAdd);
          // // hideLoading();
          // !isAdd
          //     ? Get.to(
          //         ComplaintCatagory(
          //           isAdd: isAdd,
          //         ),
          //         transition: Transition.downToUp)
          //     : null;
        } else {
          // hideLoading();
          // customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getHomeProduct() async {
    // await getId();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    data["user_id"] = sharedPref.userID.value;
    // data["device_id"] = android_id.value;
    // showloadingIndicator();
    print("data");
    print(data);
    try {
      await apiRepo.getHomeProduct(data).then((value) async {
        if (value["status"] == true) {
          // print(value["data"]);
          try {
            homeProductList.value = (value["data"] as List)
                .map(
                  (e) => ProductHomeModel.fromJson(e),
                )
                .toList();
            print(homeProductList);
          } catch (e) {
            print(e);
          }
          print("this is product list");

          // print("thsi is catageory list model");
          // print(isAdd);
          // // hideLoading();
          // !isAdd
          //     ? Get.to(
          //         ComplaintCatagory(
          //           isAdd: isAdd,
          //         ),
          //         transition: Transition.downToUp)
          //     : null;
        } else {
          // hideLoading();
          // customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getHomeProductTwo() async {
    // await getId();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    data["user_id"] = sharedPref.userID.value;

    // data["device_id"] = "3";
    // data["device_id"] = android_id.value;
    // showloadingIndicator();
    print("data");
    print(data);
    try {
      await apiRepo.getProductHomeTwo(data).then((value) async {
        if (value["status"] == true) {
          // print(value["data"]);
          try {
            homeProductListTwo.value = (value["data"] as List)
                .map(
                  (e) => HomeSecondProductModel.fromJson(e),
                )
                .toList();
            print(homeProductListTwo);
          } catch (e) {
            print(e);
          }
          print("this is product list");

          // print("thsi is catageory list model");
          // print(isAdd);
          // // hideLoading();
          // !isAdd
          //     ? Get.to(
          //         ComplaintCatagory(
          //           isAdd: isAdd,
          //         ),
          //         transition: Transition.downToUp)
          //     : null;
        } else {
          // hideLoading();
          // customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future addAddresses() async {
    showloadingIndicator();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    data["user_id"] = sharedPref.userID.value;
    // data["email"] = "";
    data["name"] = addNameController.text;
    data["phone"] = addPhoneController.text;
    data["city"] = addCityController.text;
    data["state"] = addStateController.text;
    data["pincode"] = pincodeController.text;
    data["address"] = addAddressController.text;
    data["house_no"] = addHouseNumController.text;
    // showloadingIndicator();
    print("data");
    print(data);
    try {
      await apiRepo.addAddress(data).then((value) async {
        print("this is data of value");
        print(value);
        CartController cartController = Get.put(CartController());
        if (value["success"] == true) {
          print(value["data"]);
          try {
            print("we are here");
            addNameController.clear();

            addCityController.clear();
            addStateController.clear();
            addEmailController.clear();
            addPhoneController.clear();
            pincodeController.clear();
            addAddressController.clear();
            addHouseNumController.clear();
            print("This is call of address");
            await cartController.getAddress();
            print("add address api called");
            hideLoading();
            customeToast(value["message"]);
          } catch (e) {
            print(e);
          }
          // print("this is product list");

          // print("thsi is catageory list model");
          // print(isAdd);
          // // hideLoading();
          // !isAdd
          //     ? Get.to(
          //         ComplaintCatagory(
          //           isAdd: isAdd,
          //         ),
          //         transition: Transition.downToUp)
          //     : null;
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future confirmOrder() async {
    showloadingIndicator();
    // await getId();
    // await sharedPref.getuserId();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = sharedPref.userID.value;

    // data["device_id"] = android_id.value;
    // data["device_id"] = sharedPref.userID.value;
    data["payment_method"] = paymentMethod.value;
    data["name"] = addNameController.text;
    data["house_no"] = addHouseNumController.text;
    data["phone"] = addPhoneController.text;
    data["address"] = addAddressController.text;
    data["city"] = addCityController.text;
    data["state"] = addStateController.text;
    data["pincode"] = pincodeController.text;
    data["coupon_discount"] = couponDiscount.value;
    data["coupon_code"] = couponCode.value;
    data["total_after_coupon"] = totalAfterCoupon.value;
    data["email"] = addEmailController.text;
    data["wallet_amount"] = walletTotalCut.value;
    data["refer_code"] = addReferCodeController.text.isNotEmpty
        ? addReferCodeController.text
        : "";
    // showloadingIndicator();
    print("data");
    print(data);
    try {
      await apiRepo.confirmOrder(data).then((value) async {
        print("this is data of value");
        print(value);
        CartController cartController = Get.put(CartController());
        if (value["status"] == true) {
          print(value["data"]);
          try {
            orderId.value =
                value['order_id'] != null ? value['order_id'].toString() : "";
            print("we are here");
            addNameController.clear();
            addPhoneController.clear();
            addCityController.clear();
            addStateController.clear();
            addEmailController.clear();
            pincodeController.clear();
            addAddressController.clear();
            addHouseNumController.clear();
            print("This is call of address");
            Get.offAll(() => const OrderConfirmPage());
            await cartController.getCardDetails();
            await getProducts();
            await getHomeProduct();
            await getHomeProductTwo();
            await cartController.getCoupon();
            await userUtilityController.getWallet(false);
            print("add address api called");
            hideLoading();
            customeToast(value["message"]);
          } catch (e) {
            print(e);
          }
          // print("this is product list");

          // print("thsi is catageory list model");
          // print(isAdd);
          // // hideLoading();
          // !isAdd
          //     ? Get.to(
          //         ComplaintCatagory(
          //           isAdd: isAdd,
          //         ),
          //         transition: Transition.downToUp)
          //     : null;
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future login() async {
    showloadingIndicator();

    await getId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    // data["mobile"] = phoneNumberController.text;
    data["email"] = emailLoginForRegController.text;
    data["password"] = passwordLoginForRegController.text;
    // showloadingIndicator();
    print("data");
    print(data);
    try {
      await apiRepo.login(data).then((value) async {
        CartController cartController = Get.put(CartController());
        if (value["status"] == true) {
          // print(value["data"]);
          try {
            hideLoading();
            customeToast(value["message"]);
            userID.value = value['data']["user_id"].toString();
            // otpData.value = value["data"].toString();
            // userID.value = value["user_id"].toString();
            // otpData.value = value["data"].toString();
            // print(userID.value);
            // await sharedPref.setUserId(
            //     value["user_id"] != null ? value["user_id"].toString() : "");
            // await sharedPref.getuserId();

            await sharedPref.setUserId(userID.value);
            await sharedPref.getuserId();
            getProducts();
            getHomeProduct();
            getHomeProductTwo();
            cartController.getCardDetails();

            Get.offAll(() => const HomePage());
            // Get.to(() => const OtpScreen());
          } catch (e) {
            print(e);
          }
        } else {
          hideLoading();
          // customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future loginWithPhone(String sign) async {
    showloadingIndicator();

    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    // data["mobile"] = phoneNumberController.text;
    data["phone"] = "91${phoneNumberController.text}";
    data["signature"] = sign;

    // showloadingIndicator();
    print("data");
    print("Login Response : $data");
    try {
      await apiRepo.login(data).then((value) async {
        CartController cartController = Get.put(CartController());
        if (value["status"] == 1) {
          // print(value["data"]);
          try {
            hideLoading();
            customeToast(value["message"]);
            print(value["message"]);
            // userID.value = value['data']["user_id"].toString();
            otpData.value = value["data"].toString();
            print("this is otp data ${otpData.value}");
            // userID.value = value["user_id"].toString();
            // otpData.value = value["data"].toString();
            // print(userID.value);
            // await sharedPref.setUserId(
            //     value["user_id"] != null ? value["user_id"].toString() : "");
            // await sharedPref.getuserId();

            // await sharedPref.setUserId(userID.value);
            // await sharedPref.getuserId();
            // getProducts();
            // getHomeProduct();
            // getHomeProductTwo();
            // cartController.getCardDetails();

            // Get.offAll(() => const HomePage());
            Get.to(() => const OtpScreen());
          } catch (e) {
            print(e);
          }
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future verifyOtp(int otp) async {
    showloadingIndicator();

    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    // data["mobile"] = phoneNumberController.text;
    data["phone"] = "91${phoneNumberController.text}";
    data["otp"] = otp;
    data["oldotp"] = otp;

    // showloadingIndicator();
    print("data");
    print(data);
    try {
      await apiRepo.verifyOtp(data).then((value) async {
        CartController cartController = Get.put(CartController());
        if (value["status"] == 1) {
          // print(value["data"]);
          try {
            hideLoading();
            customeToast(value["message"]);
            print(value["message"]);
            // userID.value = value['data']["user_id"].toString();
            // otpData.value = value["data"].toString();
            // print("this is otp data ${otpData.value}");
            // // userID.value = value["user_id"].toString();
            // // otpData.value = value["data"].toString();
            // // print(userID.value);
            await sharedPref.setUserId(value["data"]["user_id"] != null
                ? value["data"]["user_id"].toString()
                : "");
            // // await sharedPref.getuserId();

            // await sharedPref.setUserId(userID.value);
            await sharedPref.getuserId();
            getProducts();
            getHomeProduct();
            getHomeProductTwo();
            cartController.getCardDetails();
            userUtilityController.getWallet(false);
            Get.offAll(() => const HomePage());
            // Get.to(() => const OtpScreen());
          } catch (e) {
            print(e);
          }
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getSlider() async {
    // showloadingIndicator();
    try {
      await apiRepo.getSlider().then((value) async {
        if (value["status"] == true) {
          print(value["data"]);
          sliderList.value = (value["data"] as List)
              .map(
                (e) => SliderDataModel.fromJson(e),
              )
              .toList();
          sliderList.value =
              sliderList.where((p0) => p0.status == "active").toList();

          print("this is slider list");
          print(sliderList);
          print("this is slider list length ${sliderList.length}");
          // print("thsi is catageory list model");
          // print(isAdd);
          // // hideLoading();
          // !isAdd
          //     ? Get.to(
          //         ComplaintCatagory(
          //           isAdd: isAdd,
          //         ),
          //         transition: Transition.downToUp)
          //     : null;
        } else {
          // hideLoading();
          // customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getProductCategorybyid(int id) async {
    showloadingIndicator();
    // await getId();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    data["user_id"] = sharedPref.userID.value;
    // data["category_id"] = id;
    // data["device_id"] = android_id.value;
    print("this is data");
    print("this is id $id");
    print(data);
    try {
      await apiRepo.getProduct(data).then((value) async {
        // await apiRepo.getProductCategorybyid(data).then((value) async {
        if (value["status"] == true) {
          print(value["data"]);
          selectedIndex.value = id;
          hideLoading();
          // try {
          //   syncproductByCategoryList.value = (value["data"] as List)
          //       .map(
          //         (e) => ProductByCategoryModel.fromJson(e),
          //       )
          //       .toList();
          //   productByCategoryList.clear();
          //   for (CategoryModel i in categoryList) {
          //     for (ProductByCategoryModel j in syncproductByCategoryList) {
          //       if (j.categoryId == i.id) {
          //         productByCategoryList.add(j);
          //       }
          //     }
          //   }
          //   print(syncproductByCategoryList[81].categoryId);
          //   categoryTotal.clear();
          //   for (CategoryModel i in categoryList) {
          //     categoryTotal[i.id] = countItemsInCategory(i.id);
          //   }

          //   print(categoryTotal);
          try {
            productByCategoryList.value = (value["data"] as List)
                .map(
                  (e) => ProductByCategoryModel.fromJson(e),
                )
                .toList();
            // for (CategoryModel i in categoryList) {
            //   for (ProductByCategoryModel j in productByCategoryList) {
            //     if (j.categoryId == i.id) {
            //       syncproductByCategoryList.add(j);
            //     }
            //   }
            // }
            categoryTotal.clear();
            catagoryIdList.clear();
            for (CategoryModel i in categoryList) {
              catagoryIdList.add(i.id);
              categoryTotal[i.id] = countItemsInCategory(i.id);
            }
            print(categoryTotal);
            print(catagoryIdList);
            //   print(syncproductByCategoryList[81].categoryId);
          } catch (e) {
            print(e);
          }
          print("This is product length ${productByCategoryList.length}");
          // print("this is summary");
          // print(productSummary.value);
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  int countItemsInCategory(int categoryId) {
    // Filter the list based on the category ID
    List<ProductByCategoryModel> categoryProducts = productByCategoryList
        .where((product) => product.categoryId == categoryId)
        .toList();

    // Count the number of items in the filtered list
    return categoryProducts.length;
  }

  Future registration() async {
    showloadingIndicator();

    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = nameForRegController.text;
    data["email"] = emailForRegController.text;
    data["phone"] = phoneForRegController.text;
    data["password"] = passwordSignForRegController.text;
    data["confirm_password"] = conPasswordForRegController.text;
    // data["pincode"] = pinCodeForRegController.text;
    // data["state"] = stateForRegController.text;
    // data["city"] = cityForRegController.text;
    print("this is data");
    print(data);
    try {
      await apiRepo.userRegister(data).then((value) async {
        CartController cartController = Get.put(CartController());
        if (value["status"] == true) {
          print(value["data"]);
          // selectedIndex.value = id;
          hideLoading();
          try {
            customeToast(value["message"]);

            userID.value = value["data"]["user_id"].toString();
            // userID.value = value["user_id"].toString();
            // otpData.value = value["data"].toString();
            // await sharedPref.setUserId(
            //     value["user_id"] != null ? value["user_id"].toString() : "");
            // await sharedPref.getuserId();

            await sharedPref.setUserId(userID.value);
            await sharedPref.getuserId();
            getProducts();
            getHomeProduct();
            getHomeProductTwo();
            cartController.getCardDetails();

            Get.offAll(() => const HomePage());
            // Get.off(
            //     () => const SignInPage(
            //           isGuest: true,
            //         ),
            //     transition: Transition.noTransition);
            // productByCategoryList.value = (value["data"] as List)
            //     .map(
            //       (e) => ProductByCategoryModel.fromJson(e),
            //     )
            //     .toList();
          } catch (e) {
            print(e);
          }
          // print(productByCategoryList);
          // print("this is summary");
          // print(productSummary.value);
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getProductByID(int id) async {
    showloadingIndicator();
    // await getId();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    data["user_id"] = sharedPref.userID.value;
    data["id"] = id;
    // data["device_id"] = android_id.value;
    print("data");
    print(data);
    try {
      await apiRepo.getProductByID(data).then((value) async {
        if (value["status"] == true) {
          // print(value["data"]);
          productCart.clear();
          hideLoading();
          try {
            productName.value =
                value["data"]["name"] ?? value["data"]["name"].toString();
            productQuantity.value = value["data"]["quantity"] != null
                ? value["data"]["quantity"].toString()
                : '';
            productUnit.value = value["data"]["unit"] != null
                ? value["data"]["unit"].toString()
                : '';
            productSalePrice.value = value["data"]["sale_price"] != null
                ? value["data"]["sale_price"].toString()
                : "";
            productOfferPrice.value = value["data"]["offer_price"] != null
                ? value["data"]["offer_price"].toString()
                : "";
            productDiscountPercentage.value =
                value["data"]["discount_percentage"] != null
                    ? value["data"]["discount_percentage"].toString()
                    : "";
            productDifferencePercentage.value =
                value["data"]["difference_percentage"] != null
                    ? value["data"]["difference_percentage"].toString()
                    : "";
            productPrice.value = value["data"]["price"] != null
                ? value["data"]["price"].toString()
                : '';
            productImage.value = value["data"]["main_image"] ??
                value["data"]["main_image"].toString();
            productShortDescription.value = value["data"]
                    ["short_description"] ??
                value["data"]["short_description"].toString();
            productDescription.value = value["data"]["description"] ??
                value["data"]["description"].toString();
            productSummary.value =
                value["data"]["summary"] ?? value["data"]["summary"].toString();

            productNewPrice.value = value["data"]["offer_price"] != null
                ? value["data"]["offer_price"].toString()
                : "";

            productId.value = value["data"]["id"] != null
                ? value["data"]["id"].toString()
                : "";
            print((value['data']['gallery']));
            multiImage.value = value['data']['gallery'];
            multiImage.add({"image": productImage.value});
            print(multiImage.length);
            print(multiImage[0].values.first);
            // print("this is mutilimage $multiImage");
            // print("this is product new price ");
            productCart.addAll(value["data"]["cart"]);
            // print(productCart);
            // print(productId.value);
          } catch (e) {
            print(e);
          }
          print("this is summary");
          print(productSummary.value);
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getlatest() async {
    // showloadingIndicator();
    isLatestLoading.value = true;
    await getId();
    final Map<String, dynamic> data = <String, dynamic>{};

    data["device_id"] = android_id.value;
    print("data");
    print(data);
    try {
      await apiRepo.getlatest(data).then((value) async {
        if (value["status"] == true) {
          hideLoading();
          print("this is latest product list before");
          try {
            latestProductList.value = (value["data"] as List)
                .map(
                  (e) => LatestProductModel.fromJson(e),
                )
                .toList();
            isLatestLoading.value = false;
            print("this is latest product list ");
          } catch (e) {
            print(e);
          }
          print("this is summary");
          print(productSummary.value);
        } else {
          isLatestLoading.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getProductHomeThree() async {
    // showloadingIndicator();
    isLatestLoading.value = true;
    await getId();
    final Map<String, dynamic> data = <String, dynamic>{};

    data["device_id"] = android_id.value;
    print("data");
    print(data);
    try {
      await apiRepo.getProductHomeThree(data).then((value) async {
        if (value["status"] == true) {
          hideLoading();
          print("this is latest product list before");
          try {
            homeProductListThird.value = (value["data"] as List)
                .map(
                  (e) => HomeThirdProductModel.fromJson(e),
                )
                .toList();
            isLatestLoading.value = false;
            print("this is latest product list ");
          } catch (e) {
            print(e);
          }
          print("this is summary");
          print(productSummary.value);
        } else {
          isLatestLoading.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getFlashDeal() async {
    // showloadingIndicator();

    try {
      await apiRepo.getFlashDeal().then((value) async {
        if (value["status"] == true) {
          // print(value["data"]);
          productCart.clear();
          hideLoading();
          try {
            DateTime currentTime = DateTime.now();
            startTime.value = value["data"] != null
                ? value["data"]["start_time"].toString()
                : "";
            endTime.value = value["data"] != null
                ? value["data"]["end_time"].toString()
                : "";
            if (startTime.isNotEmpty && endTime.isNotEmpty) {
              DateTime inputDateTimeStart = DateTime.parse(startTime.value);
              DateTime inputDateTimeEnd = DateTime.parse(endTime.value);
              if (inputDateTimeStart.isAfter(currentTime)) {
                print("Start time chalu nhi hua");
                checkstart.value = false;
              } else if (inputDateTimeStart.isBefore(currentTime)) {
                print("Start time chalu hai");
                checkstart.value = true;
              } else {
                print("start tiem ke barabar hai");
                checkstart.value = true;
              }

              if (inputDateTimeEnd.isAfter(currentTime)) {
                checkend.value = true;
                print("abhi flash chal raha hai");
              } else if (inputDateTimeEnd.isBefore(currentTime)) {
                checkend.value = false;

                print("finish");
              } else {
                print("flash deal chal rahi hai ");
                checkend.value = false;
              }
              print(inputDateTimeEnd.difference(currentTime));

              isHavingTime.value =
                  (checkstart.value == true && checkend.value == true)
                      ? true
                      : false;
            }

            value["data"] != null
                ? flashDealProductList.value =
                    (value["data"]["products"] as List)
                        .map(
                          (e) => FlashDealProductModel.fromJson(e),
                        )
                        .toList()
                : null;
            print(flashDealProductList);
            // print(startTime.value);
            print("is falsh deal on ${isHavingTime.value}");
          } catch (e) {
            print(e);
          }
          print("this is summary");
          // print(productSummary.value);
        } else {
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  loadCategoryFun() async {
    await sharedPref.getuserId();
    await shopOffOn();
    await getBottamBanner();
    await getlatest();

    // await getProductHomeThree();
    await getMinimumCart();
    await getNote();
    await getDisclaimer();
    await getCategory();
    await getSubCategory();
    sharedPref.userID.isNotEmpty ? await getProducts() : null;
    await getSlider();
    sharedPref.userID.isNotEmpty ? await getHomeProduct() : null;
    sharedPref.userID.isNotEmpty ? await getHomeProductTwo() : null;
  }

  @override
  void onInit() async {
    super.onInit();
    phoneNumberController = TextEditingController();
    addNameController = TextEditingController();
    addPhoneController = TextEditingController();
    addHouseNumController = TextEditingController();
    addAddressController = TextEditingController();
    addCityController = TextEditingController();
    addStateController = TextEditingController();
    pincodeController = TextEditingController();
    addEmailController = TextEditingController();

    nameForRegController = TextEditingController();
    emailForRegController = TextEditingController();
    passwordForRegController = TextEditingController();
    phoneForRegController = TextEditingController();
    stateForRegController = TextEditingController();
    cityForRegController = TextEditingController();
    pinCodeForRegController = TextEditingController();

    passwordSignForRegController = TextEditingController();
    conPasswordForRegController = TextEditingController();

    emailLoginForRegController = TextEditingController();
    passwordLoginForRegController = TextEditingController();

    addReferCodeController = TextEditingController();

    firstOtp = TextEditingController();
    secondOtp = TextEditingController();
    thirdOtp = TextEditingController();
    fourthOtp = TextEditingController();
    fifthOtp = TextEditingController();
    sixOtp = TextEditingController();

    // !isShopOnOffLoading.value
    //     ? {
    //         await shopOffOn(),
    //         await getlatest(),
    //         await getBottamBanner(),
    //         await getMinimumCart(),
    //         await getNote(),
    //         await getDisclaimer(),
    //         await getCategory(),
    //         await getSubCategory(),
    //         await getProducts(),
    //         await getSlider(),
    //         await getHomeProduct()
    //       }
    //     : null;

    // await getFlashDeal();

    // await getProductByID(1);
  }

  @override
  void dispose() {
    super.dispose();
    addNameController.dispose();
    phoneNumberController.dispose();
    addPhoneController.dispose();
    addHouseNumController.dispose();
    addAddressController.dispose();
    addCityController.dispose();
    addStateController.dispose();
    pincodeController.dispose();
    addEmailController.dispose();

    nameForRegController.dispose();
    emailForRegController.dispose();
    passwordForRegController.dispose();
    phoneForRegController.dispose();
    stateForRegController.dispose();
    cityForRegController.dispose();
    pinCodeForRegController.dispose();

    passwordSignForRegController.dispose();
    conPasswordForRegController.dispose();

    emailLoginForRegController.dispose();
    passwordLoginForRegController.dispose();

    addReferCodeController.dispose();

    firstOtp.dispose();
    secondOtp.dispose();
    thirdOtp.dispose();
    fourthOtp.dispose();
    fifthOtp.dispose();
    sixOtp.dispose();
  }
}
