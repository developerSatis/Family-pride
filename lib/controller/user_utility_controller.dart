import 'package:get/get.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/loading_indicator.dart';

import '../api_repo/api_repo_fun.dart';

class UserUtilityController extends GetxController {
  ApiRepo apiRepo = ApiRepo();

  RxString userWalletBalance = "".obs;
  RxString privacyPolicy = "".obs;
  RxString returnPolicy = "".obs;
  RxString termsCondition = "".obs;

  RxBool isPrivacyLoad = false.obs;
  RxBool isReturnLoad = false.obs;
  RxBool isTermsConditionLoad = false.obs;
  RxBool isreferLoad = false.obs;

  RxBool isUsingWallet = false.obs;

  RxString userRefferCode = "".obs;
  RxString referingingUrl =
      "https://play.google.com/store/apps/details?id=com.com.world.familypride"
          .obs;
  RxString referAmount = "100".obs;

  SharedPref sharedPref = Get.put(SharedPref());

  Future getWallet(bool isLoading) async {
    isLoading ? showloadingIndicator() : null;
    int walletLength = 0;
    await sharedPref.getuserId();
    try {
      await apiRepo.getWallet(sharedPref.userID.value).then((value) async {
        if (value["success"] == true) {
          // print(value['total']);
          print("we are in");
          // print(value['subtotal']);
          // cartNewPrice.value = value["total"].toString();
          // cartSubTotal.value = value["subtotal"].toString();
          hideLoading();
          try {
            if (value["wallet"] == null) {
              userWalletBalance.value = 0.toString();
            } else {
              print("this is wallet");
              walletLength = value["wallet"].length;

              if (walletLength != 0) {
                userWalletBalance.value = value["wallet"]["amount"].toString();
                // userWalletBalance.value = 500.toString();
              } else {
                userWalletBalance.value = 0.toString();
              }
            }
            print("this is wa");
            print(userWalletBalance.value);
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

  Future getPrivacy() async {
    isPrivacyLoad.value = true;
    try {
      await apiRepo.getPrivacy().then((value) async {
        if (value["success"] == true) {
          print("we are in");

          hideLoading();
          try {
            privacyPolicy.value = value["privacy"]["description"];
            isPrivacyLoad.value = false;
          } catch (e) {
            print(e);
          }
        } else {
          isPrivacyLoad.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getReturnPolicy() async {
    isReturnLoad.value = true;

    try {
      await apiRepo.getReturnPolicy().then((value) async {
        if (value["success"] == true) {
          print("we are in");

          hideLoading();
          try {
            returnPolicy.value = value["returnPolicy"]["description"];
            isReturnLoad.value = false;
          } catch (e) {
            print(e);
          }
        } else {
          isReturnLoad.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getTermCondition() async {
    isTermsConditionLoad.value = true;

    try {
      await apiRepo.getTermCondition().then((value) async {
        if (value["success"] == true) {
          print("we are in");

          hideLoading();
          try {
            termsCondition.value = value["termCondition"]["description"];
            isTermsConditionLoad.value = false;
          } catch (e) {
            print(e);
          }
        } else {
          isTermsConditionLoad.value = false;
          hideLoading();
          customeToast(value["message"]);
        }
      });
    } catch (e) {
      (e);
    }
  }

  Future getReferCode() async {
    await sharedPref.getuserId();
    isreferLoad.value = true;
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = sharedPref.userID.value;
    print(data);
    try {
      apiRepo.referCode(data).then(
        (value) {
          if (value['status'] == true) {
            userRefferCode.value = value['data']['refer_code'];
            referAmount.value = value['data']['referal_amount'];

            isreferLoad.value = false;
          }
          isreferLoad.value = false;
        },
      );
    } catch (e) {
      isreferLoad.value = false;
      print(e);
    }
  }

  loadUserUtilityFun() async {
    await sharedPref.getuserId();
    sharedPref.userID.value.isNotEmpty ? await getWallet(false) : null;
  }

  @override
  void onInit() async {
    super.onInit();
    await sharedPref.getuserId();
    userRefferCode.value = sharedPref.userID.value;

    // await getWallet(false);
  }
}
