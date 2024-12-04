import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends GetxController {
  RxString userID = "".obs;

  setUserId(String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("UserId", userId);
  }

  getuserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userID.value = prefs.getString('UserId') ?? "";

    return userID;
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("UserId");
  }

  @override
  void onInit() async {
    super.onInit();
    await getuserId();
  }
}
