
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
    // debugPrint(currency);

    final response = await API.instance.get(
        endPoint: APIEndPoints.instance.kGetExr,
    );

    // debugPrint(response.toString());

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

      admin_fees.value = dictBuySell['admin_fees'];
      other_fees.value = dictBuySell['other_fees'];
      inflation_rate.value = dictBuySell['inflation_rate'];

      debugPrint(admin_fees.value.toString());
      debugPrint(other_fees.value.toString());

      totalPrice.value = ((conversionPrice.value*purchasePrice.value)+admin_fees.value+other_fees.value).toStringAsFixed(2);

    } else if (!response[Constants.instance.kSuccess]) {

    }
  }
}
