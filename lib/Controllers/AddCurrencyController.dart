import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Constants.dart';
import 'package:flutter_html/flutter_html.dart';

class AddCurrencyController extends GetxController {
  RxBool isLoading = true.obs;

  Rx<Html> htmlContent = Html(
    data: '',
  ).obs;

  reset() {
    Future.delayed(Duration(milliseconds: 100), () {
      fixerConvert();
    });
  }

  fixerConvert() async {
    isLoading.value = true;

    final response = await API.instance.get(
      endPoint: APIEndPoints.instance.kGetContent + '1/NONE/NONE',
    );

    isLoading.value = false;

    if (response![Constants.instance.kSuccess]) {
      final dictData =
          Map<String, dynamic>.from(response[Constants.instance.kData]);
      htmlContent.value = Html(data: dictData['text'].toString());
    } else if (!response[Constants.instance.kSuccess]) {

    }
  }
}
