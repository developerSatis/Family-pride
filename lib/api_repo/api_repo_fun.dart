import 'dart:io';

import 'package:dio/dio.dart';

import 'exception_handle.dart';
import 'server_request.dart';
import 'service_constant.dart';

class ApiRepo {
  final Api _api = Api();
  Response? response;
  static String? apikey = "AIzaSyCD-IEkJPc-Xmrje7yXGQRVyqxQPxr6NWQ";
  Options options = Options(
      headers: {
        HttpHeaders.authorizationHeader: 'YOUR KEY HERE',
      },
      validateStatus: (_) => true,
      contentType: 'application/json',
      responseType: ResponseType.json);
  Options optionsForm = Options(
    headers: {
      HttpHeaders.authorizationHeader: 'YOUR KEY HERE',
    },
    validateStatus: (_) => true,
    // contentType: 'multipart/form-data',
    // responseType: ResponseType.plain
  );

  Future getCategory() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.category, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

  Future getPdfDownload(String orderId) async {
    try {
      Response response = await _api.request
          .get("${ServiceConstant.downloadPdf}/$orderId", options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

  Future getPinCode() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.pinCode, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

  Future getsubCategory() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.subCategory, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

  Future getFlashDeal() async {
    try {
      Response response = await _api.request
          .get(ServiceConstant.getFlashDeal, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get address
  Future getAddress(String id) async {
    try {
      Response response = await _api.request
          .get("${ServiceConstant.getAddress}/$id", options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Coupon
  Future getCoupon() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.getCoupon, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Delivery msg
  Future getDeliveryMsg() async {
    try {
      Response response = await _api.request
          .get(ServiceConstant.getDeliveryMsg, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Date Time
  Future getDateTime() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.getDateTime, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Disclaimer
  Future getDisclaimer() async {
    try {
      Response response = await _api.request
          .get(ServiceConstant.getDisclaimer, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Note
  Future getNote() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.getNote, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//shopOnOff
  Future shopOnOff() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.shopOnOff, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Bottam Banner
  Future getBottamBanner() async {
    try {
      Response response = await _api.request
          .get(ServiceConstant.getBottamBanner, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get minimum cart
  Future getminimunCart() async {
    try {
      Response response = await _api.request
          .get(ServiceConstant.getMinimumCart, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Privacy
  Future getPrivacy() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.getPrivacy, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Return Policy
  Future getReturnPolicy() async {
    try {
      Response response = await _api.request
          .get(ServiceConstant.getReturnPolicy, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get Term condition
  Future getTermCondition() async {
    try {
      Response response = await _api.request
          .get(ServiceConstant.getTermCondition, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

//get wallet
  Future getWallet(String id) async {
    try {
      Response response = await _api.request
          .get("${ServiceConstant.getWallet}/$id", options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

  // Get get product
  Future getProduct(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.getProduct, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // Get get product
  Future addAddress(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.addAddress, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // COnfirm order
  Future confirmOrder(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.confirmOrder, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // apply Coupon
  Future applyCoupon(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.applyCoupon, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // Get home product
  Future getHomeProduct(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.getHomeProduct, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // Get Order
  Future getOrderByid(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.getOrder, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // Get get product
  Future login(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.login, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getSlider() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.getSlider, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

  Future getCoupons() async {
    try {
      Response response =
          await _api.request.get(ServiceConstant.getCoupons, options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
      // customSnakebar("Internal server error");
    }
  }

// Get product by id
  Future getProductByID(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.getProductByID, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// getlatest
  Future getlatest(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.getlatest, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// getTransation
  Future getTransaction(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.getTransaction, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// getTransation
  Future getProductHomeTwo(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
          ServiceConstant.getProductHomeTwo,
          options: options,
          data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// getTransation
  Future getProductHomeThree(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
          ServiceConstant.getProductHomeThree,
          options: options,
          data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// getTransation
  Future getOrderDetails(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.orderDetailById, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// userRegister
  Future userRegister(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.userRegister, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// verifyOtp
  Future verifyOtp(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.verifyOtp, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// referCode
  Future referCode(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.referCode, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // Get product by category id
  Future getProductCategorybyid(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
          ServiceConstant.getProductBycateId,
          options: options,
          data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // Get Cart List
  Future getCartDetails(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.getCartList, options: options, data: data);

       print("add Cart Data : ${response}");

      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

// add product to cart
  Future addProductToCart(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.addCart, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // update product to cart
  Future updateCart(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.updateCart, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  // delete item from cart
  Future cartItemDelete(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.cartItemDelete, options: options, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // customeToast("Something went wrong");
      }
    } on DioException catch (e) {
      DioExceptions.fromDioError(e);
    }
  }
  // Future getPlaceDetails(String placeID) async {
  //   try {
  //     Response response = await _api.request.get(
  //         "https://maps.googleapis.com/maps/api/place/details/json?key=$apikey&placeid=$placeID",
  //         options: options);

  //     if (response.statusCode == 200) {
  //       return response.data;
  //     } else {
  //       // customeToast("Something went wrong");
  //     }
  //   } on DioException catch (e) {
  //     DioExceptions.fromDioError(e);
  //     // customSnakebar("Internal server error");
  //   }
  // }

// // Get subCategory
//   Future subCategory(Map<String, dynamic> data) async {
//     try {
//       Response response = await _api.request
//           .post(ServiceConstant.subCategory, options: options, data: data);
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         // customeToast("Something went wrong");
//       }
//     } on DioException catch (e) {
//       DioExceptions.fromDioError(e);
//     }
//   }
}
