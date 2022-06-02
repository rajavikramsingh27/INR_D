
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PINScreenController extends GetxController {
  RxString pinValue = ''.obs;
  RxString pinConfirmValue = ''.obs;

  Rx<FocusNode> focusNode = FocusNode().obs;
  Rx<TextEditingController> textController = TextEditingController().obs;

  reset() {
        Future.delayed(Duration(seconds: 1), () {
      focusNode.value.requestFocus();
    });
  }
}