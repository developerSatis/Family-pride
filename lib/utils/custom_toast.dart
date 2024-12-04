import 'package:fluttertoast/fluttertoast.dart';
import 'package:hindustan_food/utils/color.dart';

customeToast(String text) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: appColorBlack,
      textColor: whiteColor);
}
