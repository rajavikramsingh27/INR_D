
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Constants.dart';

class BuySellController extends GetxController {
  RxBool isBuy = true.obs;
  RxList<String> arrRates = <String>[].obs;
  RxString selectCurrency = 'INR'.obs;
  RxString conversionPrice = '0.00'.obs;
  RxString convertedINR = '0.00'.obs;

  Rx<TextEditingController> controllerTextEditing = TextEditingController().obs;

  reset() {
    isBuy.value = true;
    controllerTextEditing.value.text = '';
    conversionPrice.value = '0';
    convertedINR.value = '0';

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
        "from": selectCurrency,
        "to": 'INR',
        "amount": '1'
      }
    );

    print(response);

    if (response![Constants.instance.kMessage].toString().isNotEmpty) {
      final dictMessages = Map<String, dynamic>.from(response[Constants.instance.kMessage]);
      debugPrint(dictMessages.toString());
      conversionPrice.value = dictMessages[Constants.instance.kResult].toStringAsFixed(2);
      priceConversationPrice();
    } else if (!response[Constants.instance.kSuccess]) {

    }
  }

  priceConversationPrice() {
    final priceForConversion = controllerTextEditing.value.text.isEmpty ? '0' : controllerTextEditing.value.text;
    convertedINR.value = (double.parse(priceForConversion)*double.parse(conversionPrice.value)).toStringAsFixed(2);

    debugPrint('converstedINR converstedINR converstedINR converstedINR ');
    debugPrint(priceForConversion);
    debugPrint(conversionPrice.value);
    debugPrint(convertedINR.value);
  }

}
