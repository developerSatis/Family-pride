import 'dart:developer';

import 'package:android_id/android_id.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/models/address_list_model.dart';
import 'package:hindustan_food/models/cart_list_model.dart';
import 'package:hindustan_food/models/coupon_list_model.dart';
import 'package:hindustan_food/models/order_list_model.dart';
import 'package:hindustan_food/models/order_product_model.dart';
import 'package:hindustan_food/models/pin_code_model.dart';
import 'package:hindustan_food/models/transation_model.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/loading_indicator.dart';
import 'package:hindustan_food/view/cart/wallet_applied_logic.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api_repo/api_repo_fun.dart';

class CartController extends GetxController {
  ApiRepo apiRepo = ApiRepo();

  // RxString addDelevry = "".obs;

  // void updateDelivery() {
  //   double cartPrice = double.tryParse(cartNewPrice.value) ?? 0;
  //   double delivery = double.tryParse(deliveryCharge.value) ?? 0;
  //
  //   addDelevry.value = (cartPrice + delivery).toString();
  //
  //   print("Updated addDelevry: ${addDelevry.value}");
  // }
  //
  // void updateCartNewPrice(String newPrice) {
  //   cartNewPrice.value = newPrice;
  //   updateDelivery();  // Update delivery whenever the price changes
  // }
  //
  // // Method to update delivery charge
  // void updateDeliveryCharge(String newCharge) {
  //   deliveryCharge.value = newCharge;
  //   updateDelivery();  // Update delivery whenever the charge changes
  // }

  RxList cartList = [].obs;
  RxList totalCastList = [].obs;
  RxString cartSubTotal = "".obs;
  RxString cartNewPrice = "".obs;
  RxString cartTotalTax = "".obs;
  RxString totalSavedAmount = "".obs;
  RxString discountPrice = "".obs;
  RxBool isCouponApplied = false.obs;
  RxInt couponIndex = (-1).obs;
  RxString couponAmount = "".obs;

  RxString getPriceMsg = "".obs;

  RxString deliveryCharge = "".obs;
  RxString deliveryChargeStatus = "".obs;
  RxString packingCharge = "".obs;
  RxString packingChargeStatus = "".obs;

  RxString disCountType = "".obs;
  RxString couponName = "".obs;
  RxString totalAfterCoupon = "".obs;
  RxString actualTotal = "".obs;
  RxString couponPrice = "".obs;

  RxString deliveryDate = "".obs;
  RxString deliveryTime = "".obs;
  RxString deliveryStartTime = "".obs;

  RxString pdfLink = "".obs;

  RxBool isOrderLoad = false.obs;
  RxBool isLookingForLocation = false.obs;
  RxString realTimeAddress = ''.obs;

  RxString delDate = "".obs;

  RxString subTotalOrder = "".obs;
  RxString couponOrder = "".obs;
  RxString couponAmountOrder = "".obs;
  RxString orderDiscount = "".obs;
  RxString orderPackCharge = "".obs;
  RxString orderDeliveryCharge = "".obs;
  RxString orderGrandTotal = "".obs;
  RxString orderDate = "".obs;
  RxString orderNumber = "".obs;
  RxString totalOrderSaving = "".obs;

  RxBool isUserNew = false.obs;

  CategoryController categoryController = Get.put(CategoryController());
  RxList<CastListModel> allCartList = <CastListModel>[].obs;
  RxList<CouponListModel> getCouponList = <CouponListModel>[].obs;
  RxList<PinCodeModel> pinCodeList = <PinCodeModel>[].obs;
  RxList pinCodes = [].obs;
  RxList<AddressListModel> addressList = <AddressListModel>[].obs;
  RxList<OrderListModel> orderList = <OrderListModel>[].obs;
  RxList<TransationModel> transationList = <TransationModel>[].obs;
  RxList<OrderProductDetailsModel> productOrderDetails =
      <OrderProductDetailsModel>[].obs;

  RxInt selectedAddressIndex = 0.obs;

  RxBool isDownloadProgress = false.obs;

  RxString androidId = "".obs;

  RxDouble userLat = 0.0.obs;
  RxDouble userLong = 0.0.obs;

  RxBool isTransationLoading = false.obs;
  RxBool isPinCodeLoading = false.obs;
  RxDouble downloadProgress = 0.0.obs;

  SharedPref sharedPref = Get.put(SharedPref());
  // void calculation() {
  //   totalCastList.clear();
  //   if (cartList.isNotEmpty) {
  //     for (var i in cartList) {
  //       totalCastList.add(i.price);
  //     }
  //   }
  //   print(totalCastList);
  //   totalsum.value = totalCastList.reduce((a, b) => a + b);
  //   print(totalsum.value);
  // }

  Future<String?> getId() async {
    const androidIdPlugin = AndroidId();

    androidId.value = (await androidIdPlugin.getId())!;
    return androidId.value;
  }

  Future getCardDetails() async {
    // showloadingIndicator();
    // await categoryController.getId();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = sharedPref.userID.value;
    // data["device_id"] = categoryController.android_id.value;
    print("this is data");
    print(data);
    try {
      await apiRepo.getCartDetails(data).then((value) async {
        if (value["status"] == true) {
          // print(value['total']);
          // print(value['subtotal']);
          try {
            deliveryCharge.value = value["delivery_charge"].toString();
            print("this is 1");
            deliveryChargeStatus.value =
                value["delivery_Charge_free"].toString();
            print("this is 2");

            // print("this is deli ${deliveryCharge.value}");
            // print("this is deli ${value['delivery_charge']}");
            packingCharge.value = value["packing_charge"].toString();
            print("this is 3");

            packingChargeStatus.value = value["packingCharge_free"].toString();
            print("this is 4");

            // cartNewPrice.value = value["subtotal"].toString();
            cartNewPrice.value = value["total"].toString();
            print("this is 5");

            cartTotalTax.value = value["total_tax"].toString();
            print("this is 6");

            // cartSubTotal.value = value["total"].toString();
            cartSubTotal.value = value["subtotal"].toString();
            print("this is 7");

            actualTotal.value = value["actual_total"].toString();
            print("this is 8");

            totalSavedAmount.value = value["total_saved_amount"].toString();
            print("this is 9");

            value["subtotal"] != null && value["total"] != null
                ? discountPrice.value = "${value["total"] - value["subtotal"]}"
                : null;
            print("this is 10");

            print("this is deli ${deliveryCharge.value}");
          } catch (e) {
            print(e);
          }
          hideLoading();
          try {
            print("this is og value ${value["data"]}");
            allCartList.value = (value["data"] as List)
                .map(
                  (e) => CastListModel.fromJson(e),
                )
                .toList();
            print('This is all cart list $allCartList');
          } catch (e) {
            print(e);
          }
          print(allCartList);
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

  Future applyCoupon(
      String discountType, String couponAmount, String couponCode) async {
    // showloadingIndicator();
    isCouponApplied.value = true;
    // await categoryController.getId();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = sharedPref.userID.value;

    // data["device_id"] = categoryController.android_id.value;
    data["discount_type"] = discountType;
    data["coupon_amount"] = couponAmount;
    data["coupon_code"] = couponCode;
    print("this is data");
    print(data);
    try {
      await apiRepo.applyCoupon(data).then((value) async {
        if (value["status"] == true) {
          try {
            couponPrice.value = couponAmount;
            cartNewPrice.value = value["total"].toString();
            // cartSubTotal.value = value["subtotal"].toString();
            // cartSubTotal.value = value["subtotal"].toString();
            totalAfterCoupon.value = value["total_after_coupon"].toString();
            categoryController.couponDiscount.value =
                value["coupon_discount"].toString();
            categoryController.couponCode.value =
                value["coupon_code"].toString();
            categoryController.totalAfterCoupon.value =
                value["total_after_coupon"].toString();
            userUtilityController.isUsingWallet.value = false;
            print(
                "this is couponDis ${categoryController.couponDiscount.value}");
            print("this is couponCode ${categoryController.couponCode.value}");
            print(
                "this is totalafter  ${categoryController.totalAfterCoupon.value}");
            print("hjj");
            actualTotal.value = value["actual_total"]?.toString() ?? "";
            print("hhh");
            value["subtotal"] != null && value["total"] != null
                ? discountPrice.value =
                    (value["total"] - value["subtotal"]).toString()
                // (double.parse(value["total"]).toInt() -
                //         double.parse(value["subtotal"]).toInt())
                //     .toString()
                : null;
          } catch (e) {
            print(e);
          }
          isCouponApplied.value = false;
        } else {
          isCouponApplied.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getCoupon() async {
    // showloadingIndicator();

    try {
      await apiRepo.getCoupon().then((value) async {
        if (value["status"] == true) {
          // print(value['total']);
          // print(value['subtotal']);

          hideLoading();
          try {
            getCouponList.value = (value["data"] as List)
                .map(
                  (e) => CouponListModel.fromJson(e),
                )
                .toList();
            print(getCouponList);
          } catch (e) {
            print(e);
          }
          print(allCartList);
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

  Future getPinCode() async {
    // showloadingIndicator();
    isPinCodeLoading.value = true;
    try {
      await apiRepo.getPinCode().then((value) async {
        if (value["success"] == true) {
          // print(value['total']);
          // print(value['subtotal']);

          hideLoading();
          try {
            pinCodeList.value = (value["pincode"] as List)
                .map(
                  (e) => PinCodeModel.fromJson(e),
                )
                .toList();
            pinCodes.value = pinCodeList.map((item) => item.pincode).toList();
            print(pinCodes[0]);
            isPinCodeLoading.value = false;
            print(pinCodeList);
          } catch (e) {
            print(e);
          }
          print(allCartList);
          // print("this is summary");
          // print(productSummary.value);
        } else {
          isPinCodeLoading.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  String getNextDateFormatted() {
    DateTime currentDate = DateTime.now();
    // Add one day to the current date to get the next date
    DateTime nextDate = currentDate.add(const Duration(days: 1));

    // Format the next date as "dd MMM"
    String formattedNextDate =
        '${nextDate.day.toString().padLeft(2, '0')} ${_getMonthAbbreviation(nextDate.month)}';
    delDate.value = formattedNextDate;
    return formattedNextDate;
  }

  String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  Future allTransation() async {
    // showloadingIndicator();
    isTransationLoading.value = true;
    // await categoryController.getId();
    // final Map<String, dynamic> data = <String, dynamic>{};
    // data["device_id"] = categoryController.android_id.value;

    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    data["user_id"] = sharedPref.userID.value;
    print(data);
    try {
      await apiRepo.getTransaction(data).then((value) async {
        if (value["status"] == true) {
          // print(value['total']);
          // print(value['subtotal']);

          hideLoading();
          try {
            transationList.value = (value["data"] as List)
                .map(
                  (e) => TransationModel.fromJson(e),
                )
                .toList();
            print(transationList);
            isTransationLoading.value = false;
          } catch (e) {
            print(e);
          }

          // print("this is summary");
          // print(productSummary.value);
        } else {
          isTransationLoading.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future addProductToCart(String productId, String productQuantity) async {
    // await categoryController.getId();
    await sharedPref.getuserId();
    showloadingIndicator();
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = sharedPref.userID.value;
    // data["device_id"] = categoryController.android_id.value;
    data["product_id"] = productId;
    data["quantity"] = productQuantity;
    print("this is data");
    print(data);
    try {
      await apiRepo.addProductToCart(data).then((value) async {
        if (value["success"] == true) {
          print(value["data"]);
          couponIndex.value = (-1);
          couponAmount.value = "";
          couponPrice.value = "";
          await categoryController.getProducts();
          await categoryController.getHomeProduct();
          await getCardDetails();
          hideLoading();
          categoryController.categoryId.isNotEmpty
              ? await categoryController.getProductCategorybyid(
                  int.parse(categoryController.categoryId.value))
              : null;

          // try {
          //   allCartList.value = (value["data"] as List)
          //       .map(
          //         (e) => CastListModel.fromJson(e),
          //       )
          //       .toList();
          // } catch (e) {
          //   print(e);
          // }
          // print(allCartList);
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

  Future updateCart(String cartId, String productQuantity) async {
    // await categoryController.getId();
    await sharedPref.getuserId();
    showloadingIndicator();
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = sharedPref.userID.value;
    // data["device_id"] = categoryController.android_id.value;
    data["cart_id"] = cartId;
    data["quantity"] = productQuantity;
    print("this is data");
    print(data);
    try {
      await apiRepo.updateCart(data).then((value) async {
        if (value["success"] == true) {
          print(value["data"]);
          userUtilityController.isUsingWallet.value = false;
          couponIndex.value = (-1);
          couponAmount.value = "";
          couponPrice.value = "";
          await categoryController.getProducts();
          await categoryController.getHomeProduct();
          await getCardDetails();
          hideLoading();
          categoryController.categoryId.isNotEmpty
              ? await categoryController.getProductCategorybyid(
                  int.parse(categoryController.categoryId.value))
              : null;

          // try {
          //   allCartList.value = (value["data"] as List)
          //       .map(
          //         (e) => CastListModel.fromJson(e),
          //       )
          //       .toList();
          // } catch (e) {
          //   print(e);
          // }
          // print(allCartList);
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

  Future deleteCartItem(String cartId) async {
    // await categoryController.getId();
    showloadingIndicator();
    final Map<String, dynamic> data = <String, dynamic>{};
    // data["device_id"] = categoryController.android_id.value;
    data["cart_id"] = cartId;

    print("this is data");
    print(data);
    try {
      await apiRepo.cartItemDelete(data).then((value) async {
        if (value["success"] == true) {
          print(value["data"]);
          couponIndex.value = (-1);
          couponAmount.value = "";
          couponPrice.value = "";
          await categoryController.getProducts();
          await categoryController.getHomeProduct();
          await getCardDetails();
          hideLoading();
          categoryController.categoryId.isNotEmpty
              ? await categoryController.getProductCategorybyid(
                  int.parse(categoryController.categoryId.value))
              : null;

          // try {
          //   allCartList.value = (value["data"] as List)
          //       .map(
          //         (e) => CastListModel.fromJson(e),
          //       )
          //       .toList();
          // } catch (e) {
          //   print(e);
          // }
          // print(allCartList);
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

  Future getAddress() async {
    await sharedPref.getuserId();
    showloadingIndicator();

    try {
      await apiRepo.getAddress(sharedPref.userID.value).then((value) async {
        if (value["success"] == true) {
          print(value["address"]);

          try {
            // addressList.value = (value["address"] as List)
            //     .map(
            //       (e) => AddressListModel.fromJson(e),
            //     )
            //     .toList();
            if (value["address"] != null) {
              categoryController.addNameController.text =
                  value["address"]["name"];
              categoryController.addHouseNumController.text =
                  value["address"]["house_no"];
              categoryController.addAddressController.text =
                  value["address"]["address"];
              categoryController.addCityController.text =
                  value["address"]["city"];
              categoryController.addStateController.text =
                  value["address"]["state"];
              categoryController.pincodeController.text =
                  value["address"]["pincode"];
              categoryController.addPhoneController.text =
                  value["address"]["phone"];
              categoryController.addEmailController.text =
                  value["address"]["email"];
              isUserNew.value = false;
            } else {
              isUserNew.value = true;
            }
            hideLoading();
            print(addressList);
          } catch (e) {
            print(e);
          }
          // print(allCartList);
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

  // getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   debugPrint('location: ${position.latitude}');
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   print(placemarks);
  //   // final coordinates = Coordinates(position.latitude, position.longitude);
  //   // var addresses =
  //   //     await Geocoder().local.findAddressesFromCoordinates(coordinates);
  //   // var first = addresses.first;
  //   // print("${first.featureName} : ${first.addressLine}");
  // }

  getLocation() async {
    // Check permission
    isLookingForLocation.value = true;
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }

    if (status.isGranted) {
      try {
// Permission granted, proceed to get location
        realTimeAddress.value = '';
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        userLat.value = position.latitude;
        userLong.value = position.longitude;
        log('Location: ${position.latitude}, ${position.longitude}');
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {
          Placemark place =
              placemarks[0]; // Assuming only one placemark is returned
          // log(place.toString());
          // Construct the address into a single string
          String formattedAddress =
              "${place.name}, ${place.street}, ${place.subLocality} ${place.locality}, ${place.postalCode}, ${place.country}";
          realTimeAddress.value = formattedAddress;
          isLookingForLocation.value = false;

          log("this is formatted address $formattedAddress");
        }
      } catch (e) {
        print(e);
      }
    } else {
      isLookingForLocation.value = false;
      // Handle the case where permission is denied
      customeToast('Location permission denied');
    }
  }

  Future getDeliveryMsg() async {
    // await sharedPref.getuserId();
    // showloadingIndicator();

    try {
      await apiRepo.getDeliveryMsg().then((value) async {
        if (value["status"] == true) {
          print("this is value of price");
          print(value);
          print(value['data']['min_amount']);
          print("can we print thiss");
          try {
            print("thisis before");
            getPriceMsg.value = value['data']['min_amount'] != null
                ? value['data']['min_amount'].toString()
                : "";
            print("this is price ");
            print(getPriceMsg.value);
          } catch (e) {
            print(e);
          }
          // print(allCartList);
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

  Future getOrderById() async {
    // await sharedPref.getuserId();
    // await getId();
    showloadingIndicator();
    await sharedPref.getuserId();
    final Map<String, dynamic> data = <String, dynamic>{};

    // data["device_id"] = "3";
    data["user_id"] = sharedPref.userID.value;
    // data["device_id"] = categoryController.android_id.value;
    // data["device_id"] = androidId.value;
    // data["id"] = sharedPref.userID.value;
    print("this is data");
    print(data);
    try {
      await apiRepo.getOrderByid(data).then((value) async {
        if (value["status"] == true) {
          // print(value["address"]);
          print('object');
          try {
            orderList.value = (value["data"] as List)
                .map(
                  (e) => OrderListModel.fromJson(e),
                )
                .toList();
            hideLoading();
            print(orderList);
          } catch (e) {
            print(e);
            hideLoading();
          }
          // print(allCartList);
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

  Future orderDetailsFetch(String orderID) async {
    // await sharedPref.getuserId();
    // await getId();
    // showloadingIndicator();
    isOrderLoad.value = true;
    final Map<String, dynamic> data = <String, dynamic>{};
    // data["device_id"] = categoryController.android_id.value;
    data["order_id"] = orderID;
    // data["device_id"] = androidId.value;
    // data["id"] = sharedPref.userID.value;
    print("this is data");
    print(data);
    try {
      await apiRepo.getOrderDetails(data).then((value) async {
        if (value["status"] == true) {
          // print(value["address"]);
          print("this is data of order ");
          print(value["data"]["order_items"]);
          try {
            productOrderDetails.value = (value["data"]["order_items"] as List)
                .map(
                  (e) => OrderProductDetailsModel.fromJson(e),
                )
                .toList();
            subTotalOrder.value = value["data"]["subtotal"]?.toString() ?? "";
            couponOrder.value = value["data"]["coupon"] ?? "";
            couponAmountOrder.value =
                value["data"]["coupon_amount"]?.toString() ?? "";
            orderDiscount.value = value["data"]["discount"]?.toString() ?? "";
            orderPackCharge.value = value["data"]["pack_charge"];
            orderDeliveryCharge.value = value["data"]["delivery_charge"];
            orderGrandTotal.value =
                value["data"]["grand_total"]?.toString() ?? "";
            orderDate.value = value["data"]["order_date"];
            orderNumber.value = value["data"]["order_id"].toString();
            totalOrderSaving.value = value["data"]["total_saving"].toString();
            await pdfDownload(orderID);
            isOrderLoad.value = false;
            hideLoading();
            print(productOrderDetails);
          } catch (e) {
            print(e);
          }
          // print(allCartList);
          // print("this is summary");
          // print(productSummary.value);
        } else {
          isOrderLoad.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future pdfDownload(String orderID) async {
    // await sharedPref.getuserId();
    // await getId();
    // showloadingIndicator();

    try {
      await apiRepo.getPdfDownload(orderID).then((value) async {
        pdfLink.value = value["path"];
        print("this is pdf links ${pdfLink.value}");
      });
    } catch (e) {
      (e);
    }
  }

  Future getDateTime() async {
    // await sharedPref.getuserId();

    try {
      await apiRepo.getDateTime().then((value) async {
        if (value["success"] == true) {
          try {
            print("this is date and time");
            deliveryDate.value = value["date_time_in_ist"] != null
                ? value["date_time_in_ist"].toString()
                : "";
            deliveryTime.value =
                value["time"] != null ? value["time"].toString() : "";
            deliveryStartTime.value = value["start_time"] != null
                ? value["start_time"].toString()
                : "";
            print("this is date ${deliveryDate.value}");
            print("this is date ${deliveryTime.value}");
            hideLoading();
          } catch (e) {
            print(e);
          }
          // print(allCartList);
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

  loadCartFun() async {
    await sharedPref.getuserId();
    getNextDateFormatted();
    await getDeliveryMsg();
    sharedPref.userID.value.isNotEmpty ? await getCardDetails() : null;
    await getCoupon();
    await getDateTime();

  }
}
