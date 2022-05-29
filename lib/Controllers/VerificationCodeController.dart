import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  Rx<TextEditingController> txtOTP_First = TextEditingController().obs;
  Rx<TextEditingController> txtOTP_Second = TextEditingController().obs;
  Rx<TextEditingController> txtOTP_Third = TextEditingController().obs;
  Rx<TextEditingController> txtOTP_Fourth = TextEditingController().obs;

  FocusNode focusFirst = FocusNode();
  FocusNode focusSecond = FocusNode();
  FocusNode focusThird = FocusNode();
  FocusNode focusFourth = FocusNode();

  reset() {
    txtOTP_First.value.text = '';
    txtOTP_Second.value.text = '';
    txtOTP_Third.value.text = '';
    txtOTP_Fourth.value.text = '';
  }

}
