
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Utils/API.dart';
import '../Utils/Constants.dart';

class OrderPreviewController extends GetxController {
  RxString totalPrice = '0.00'.obs;

  RxDouble purchasePrice = 0.0.obs;
  RxDouble conversionPrice = 0.0.obs;

  RxDouble admin_fees = 0.0.obs;
  RxDouble other_fees = 0.0.obs;
  RxDouble inflation_rate = 0.0.obs;

  reset() {

  }

  getFixer(String currency, bool isSell) async {
    final response = await API.instance.get(
        endPoint: APIEndPoints.instance.kGetExr,
    );

    if (response![Constants.instance.kData].toString().isNotEmpty) {
      final dictMessages = Map<String, dynamic>.from(response[Constants.instance.kData]);
      // debugPrint(dictMessages.toString());
      // debugPrint(dictMessages[currency].toString());

      final dictCurrency = Map<String, dynamic>.from(dictMessages[currency]);
      Map<String, dynamic>? dictBuySell;
      if (isSell) {
        dictBuySell = Map<String, dynamic>.from(dictCurrency['sell']);
      } else {
        dictBuySell = Map<String, dynamic>.from(dictCurrency['buy']);
      }

      debugPrint(dictBuySell.toString());

      if (dictBuySell['admin_fees'] != null) {
        admin_fees.value = dictBuySell['admin_fees'] ?? 0.0;
      }

      if (dictBuySell['other_fees'] != null) {
        other_fees.value = dictBuySell['other_fees'] ?? 0.0;
      }

      if (dictBuySell['inflation_rate'] != null) {
        inflation_rate.value = double.parse(dictBuySell['inflation_rate'] ?? '0.0');
      }

      debugPrint(admin_fees.value.toString());
      debugPrint(other_fees.value.toString());
      debugPrint(inflation_rate.value.toString());

      final rateAmount = (conversionPrice.value*inflation_rate.value)/100.0;

      // Buy + krna
//     sell - krna
//   inflamation rate in 10%

      if (isSell) {
        totalPrice.value = ((conversionPrice.value*purchasePrice.value)-rateAmount-admin_fees.value-other_fees.value).toStringAsFixed(2);
      } else {
        totalPrice.value = ((conversionPrice.value*purchasePrice.value)+rateAmount-admin_fees.value-other_fees.value).toStringAsFixed(2);
      }
      debugPrint(totalPrice.value);

    } else if (!response[Constants.instance.kSuccess]) {

    }
  }
}
