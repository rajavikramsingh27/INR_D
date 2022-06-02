
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Constants.dart';

class BuySellController extends GetxController {
  RxBool isBuy = true.obs;
  RxList<String> arrRates = <String>[].obs;
  RxString selectCurrency = 'INR'.obs;
  RxString convertedFixed = '0.00'.obs;

  reset() {
    isBuy.value = true;
    Future.delayed(Duration(milliseconds: 100), () {
      realtimeExchangeRates();
    });
  }

  realtimeExchangeRates() async {
    final response = await API.instance.get(
      endPoint: APIEndPoints.instance.kRealtimeExchangeRates + 'INR',
    );

    if (response![Constants.instance.kMessage].toString().isNotEmpty) {
      final dictMessages =
          Map<String, dynamic>.from(response[Constants.instance.kMessage]);
      final dictRates = Map<String, dynamic>.from(dictMessages['rates']);

      arrRates.clear();
      arrRates.value.add('Select Currency');
      arrRates.value = arrRates.value + List<String>.from(dictRates.keys);

    } else if (!response[Constants.instance.kSuccess]) {

    }
  }

  fixerConvert(String selectCurrency) async {
    final response = await API.instance.post(
      endPoint: APIEndPoints.instance.kFixerConvert,
      params: {
        "from": 'INR',
        "to": selectCurrency,
        "amount": '1000'
      }
    );

    print(response);

    if (response![Constants.instance.kMessage].toString().isNotEmpty) {
      final dictMessages = Map<String, dynamic>.from(response[Constants.instance.kMessage]);
      debugPrint(dictMessages.toString());
      convertedFixed.value = dictMessages[Constants.instance.kResult].toStringAsFixed(2);
    } else if (!response[Constants.instance.kSuccess]) {

    }
  }
}
