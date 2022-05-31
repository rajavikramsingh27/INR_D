
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddBankController extends GetxController {
  RxInt countForTextEditingController = 0.obs;
  RxList<TextEditingController> arrTextEditController = [TextEditingController()].obs;
  Rx<TextEditingController> controllerPanCard = TextEditingController().obs;

  RxList<String> arrBankDetails = [''].obs;
  RxString selectedDropDown = ''.obs;

  reset() {
    selectedDropDown.value = '';
    arrTextEditController.clear();
    arrBankDetails.clear();

    for (int i = 0; i<countForTextEditingController.value; i++) {
      arrTextEditController.add(TextEditingController());
    }
  }
}