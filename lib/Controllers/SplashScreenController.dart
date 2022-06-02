import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Models/User.dart';
import '../Utils/API.dart';
import '../Utils/Constants.dart';
import '../Views/MobileNumber.dart';
import '../Views/PINScreen.dart';

class SplashScreenController extends GetxController {

  getUser({required String mobileNumber}) async {
    final response = await API.instance.get(
      endPoint: APIEndPoints.instance.kGetUser+mobileNumber,
    );

    print(response);
    print(response![Constants.instance.kSuccess]);
    if (response[Constants.instance.kSuccess]) {
      final dictData = Map<String, dynamic>.from(response[Constants.instance.kData]);
      final user = User.fromJson(dictData);

      if (user.status == 'active') {
          Get.to(PINScreen(
            title: 'Enter your PIN',
            desc:
            "Enter the secure PIN to access your account",
            isForgotPINShow: true,
            enterSetConfirmPIN: 0,
            isBack: false,
          ));
      }
    } else if (!response[Constants.instance.kSuccess]) {
      Get.to(MobileNumber());
    }
  }

}
