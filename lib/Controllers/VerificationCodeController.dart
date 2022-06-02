import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Views/PINScreen.dart';


class VerificationCodeController extends GetxController {
  Rx<TextEditingController> txtOTP_First = TextEditingController().obs;
  Rx<TextEditingController> txtOTP_Second = TextEditingController().obs;
  Rx<TextEditingController> txtOTP_Third = TextEditingController().obs;
  Rx<TextEditingController> txtOTP_Fourth = TextEditingController().obs;

  FocusNode focusFirst = FocusNode();
  FocusNode focusSecond = FocusNode();
  FocusNode focusThird = FocusNode();
  FocusNode focusFourth = FocusNode();

  RxString phoneNumber = ''.obs;

  reset() {
    txtOTP_First.value.text = '';
    txtOTP_Second.value.text = '';
    txtOTP_Third.value.text = '';
    txtOTP_Fourth.value.text = '';
  }

  void sendVerifyCode() async {
    final otpValues = txtOTP_First.value.text+txtOTP_Second.value.text+txtOTP_Third.value.text+txtOTP_Fourth.value.text;

    Get.focusScope!.unfocus();

    final response = await API.instance.post(
        endPoint: APIEndPoints.instance.kTwilioVerifyCode,
        params: {
          'to': phoneNumber.value,
          'code': otpValues
        });

    print(response);
    print(response!['status']);

    if (response['status']) {
      Get.to(PINScreen(
        title: 'Please set a PIN',
        desc:
        "Prevent unauthorised access.",
        isForgotPINShow: false,
        enterSetConfirmPIN: 2,
      ));
    } else {

    }

  }

}
