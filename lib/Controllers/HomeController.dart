import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Styles/ImageStyle.dart';

class HomeController extends GetxController {


  RxList<String> images = <String> [
    ImageStyle.Group38,
    ImageStyle.Group37,
    ImageStyle.Group38,
    ImageStyle.Group38,
    ImageStyle.Group38,
    ImageStyle.Group37,
  ].obs;


  RxList<String> sendReceive =  [
    'Received',
    'Send',
    'Received',
    'Received',
    'Received',
    'Send',


  ].obs;



  RxList<String> text =  [
    '1,000 INR(D)',
    '3,000 INR(D)',
    '250 INR(D)',
    '1,000 INR(D)',
    '2,692 INR(D)',
    '3,000 INR(D)',

  ].obs;



}
