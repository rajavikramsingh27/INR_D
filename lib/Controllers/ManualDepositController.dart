import 'package:get/get.dart';

class ManualDepositController extends GetxController {
  RxBool isCheckAccountIdentifier = false.obs;

  reset() {
    isCheckAccountIdentifier.value = false;
  }
}
