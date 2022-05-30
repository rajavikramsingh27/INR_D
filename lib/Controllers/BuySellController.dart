

import 'package:get/get.dart';

class BuySellController extends GetxController {

  RxBool isBuy = true.obs;

  reset() {
    isBuy.value = true;
  }
}
