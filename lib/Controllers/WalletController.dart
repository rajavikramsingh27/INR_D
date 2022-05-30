import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inr_d/Styles/ImageStyle.dart';

class WalletController extends GetxController {
  RxList<String> chooseUSD = [
    'AUD',
    'USD',
    'CAD',
    'INR',
    'GBP',
    'EURO',
    'SGD',
    'NZD',
  ].obs;

  RxList<String> images = <String>[
    ImageStyle.Group30,
    ImageStyle.Group31,
    ImageStyle.Group32,
    ImageStyle.Group33,
    ImageStyle.Group34,
    ImageStyle.Group35,
    ImageStyle.Group36,
  ].obs;

  RxList<bool> arrSelect = [false].obs;

  reset() {
    arrSelect.clear();

    for (int i = 0; i< images.length; i++) {
      arrSelect.add(false);
    }
  }


}
