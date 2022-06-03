import 'package:get/get.dart';

class OrderPreviewController extends GetxController {
  RxDouble adminFee = 7.90.obs;
  RxDouble otherFee = 0.00.obs;

  RxString totalPrice = '0.00'.obs;

  reset() {

  }
}
