import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Views/VerificationCode.dart';
import '../Utils/Global.dart';
import '../Controllers/VerificationCodeController.dart';


class MobileNumberController extends GetxController {
  RxString flagEmoji = '🇮🇳'.obs;
  RxString phoneCode = '91'.obs;

  Rx<TextEditingController> controllerMobileNumber =
      TextEditingController().obs;

  void sendForOTP() async {
    if (controllerMobileNumber.value.text.isEmpty) {
      'Enter your mobile number'.showError();
    } else if (controllerMobileNumber.value.text.length <
        10) {
      'Enter a valid number'.showError();
    } else {
      Get.focusScope!.unfocus();

      final phoneNumber = '+${phoneCode.value}${controllerMobileNumber.value.text}';
      final response = await API.instance.post(
          endPoint: APIEndPoints.instance.kTwilioSendCode,
          params: {'to': phoneNumber});

      print(response!['status']);

      if (response != null || response.isNotEmpty) {
        final controller = Get.put(VerificationCodeController());
        controller.phoneNumber.value = phoneNumber;
        Get.to(VerificationCode());
      }
    }
  }
}
