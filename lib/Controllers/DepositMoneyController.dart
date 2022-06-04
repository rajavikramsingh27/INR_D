

import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Constants.dart';
import 'package:flutter_html/flutter_html.dart';

class DepositMoneyController extends GetxController {

  List<List<String>> arrManualDeposit = [
    // AUD
    [
      'Name',
      'Account No.',
      'BSB No.',
      'Bank Name.',
      'pay ID',
    ],
    //USD
    [
      'Name',
      'Account No.',
      'Routing No..',
      'Bank Name.',
    ],
// CAD
    [
      'Name',
      'Account No.',
      'Transit No.',
      'Bank Name.',
      'Interac ID',
    ],
// INR
    [
      'Name',
      'Account No.',
      'IFSC Code.',
      'Bank Name.',
      'UPI ID',
    ],
// GBP
    [
      'Name',
      'Account No.',
      'Sort Code.',
      'Bank Name.',
    ],
// EURO
    [
      'Name',
      'Account No.',
      'IBAN.',
      'Bank Name.',
    ],
// SGD
    [
      'Name',
      'Account No.',
      'BSB',
      'BIC',
      'Bank Name.',
    ],
    //NZD
    [
      'Name',
      'Account No.',
      'BSB',
      'Bank Name.',
    ],
  ];

  RxBool isLoading = true.obs;
  RxString currencyName = ''.obs;

  Rx<Html> htmlContentAutoDeposit = Html(
    data: '',
  ).obs;

  Rx<Html> htmlContentManualDeposit = Html(
    data: '',
  ).obs;

  reset() {
    Future.delayed(Duration(milliseconds: 100), () {
      getContentAutoDeposit();
      Future.delayed(Duration(milliseconds: 100), () {
        getContentManualDeposit();
      });
    });
  }

  getContentAutoDeposit() async {
    isLoading.value = true;
    final response = await API.instance.get(
      endPoint: APIEndPoints.instance.kGetContent + '2/${currencyName}/AUTO',
    );

    isLoading.value = false;

    if (response![Constants.instance.kSuccess]) {
      final dictData =
      Map<String, dynamic>.from(response[Constants.instance.kData]);
      htmlContentAutoDeposit.value = Html(data: dictData['text'].toString());
    } else if (!response[Constants.instance.kSuccess]) {

    }
  }

  getContentManualDeposit() async {
    isLoading.value = true;

    final response = await API.instance.get(
      endPoint: APIEndPoints.instance.kGetContent + '2/${currencyName}/MANUAL',
    );

    isLoading.value = false;

    if (response![Constants.instance.kSuccess]) {
      final dictData =
      Map<String, dynamic>.from(response[Constants.instance.kData]);
      htmlContentManualDeposit.value = Html(data: dictData['text'].toString());
    } else if (!response[Constants.instance.kSuccess]) {

    }
  }

}