
import 'package:get/get.dart';

class DepositMoneyController extends GetxController {

  RxInt index = 0.obs;
  RxString titleManualDeposit = ''.obs;

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



}