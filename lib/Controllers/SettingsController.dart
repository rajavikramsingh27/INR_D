import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inr_d/Styles/ImageStyle.dart';

class SettingsController extends GetxController {

  RxList<String> arrListDetails = [''].obs;


  RxList<String> chooseHelp = [
    'Help',

  ].obs;
  RxList<String> chooseAdd = [
    '+ Add Bank',

  ].obs;

  RxList<String> chooseMed = [

    'Media',

  ].obs;

  RxList<String> chooseProfile = [

    'Profile',
  ].obs;
  RxList<String> chooseKYEC = [

    'KYEC',
  ].obs;
  RxList<String> chooseHistory = [

    'History',
  ].obs;


  RxList<bool> arrSelect = [false].obs;
  RxList<bool> arrSelect1 = [false].obs;
  RxList<bool> arrSelect2 = [false].obs;
  RxList<bool> arrSelect3 = [false].obs;
  RxList<bool> arrSelect4 = [false].obs;
  RxList<bool> arrSelect5 = [false].obs;
  reset() {
    arrSelect.clear();
    arrSelect1.clear();
    arrSelect2.clear();
    arrSelect3.clear();
    arrSelect4.clear();
    arrSelect5.clear();


    for (int i = 0; i< images.length; i++) {
      arrSelect.add(false);
    }

  }



  RxList<String> images = <String> [
    ImageStyle.telegram,
    ImageStyle.whatsUp,
    ImageStyle.discord,
    ImageStyle.twitter,
    ImageStyle.email,
    ImageStyle.call,
  ].obs;

  RxList<String> chooseMedia1 = <String> [
    'Telegram',
    'WhatsApp',
    'Discord',
    'Twitter',
    'Email',
    'Call',
  ].obs;
  RxList<String> chooseMedia2 = <String> [
    'Add Interac ID',
    'Add Pay ID',
    'Add Bank',
    'Add UPI  ID',

  ].obs;
  RxList<String> chooseMedia3 = <String> [
    'NY',
    'CA',
    'WA',
    'VT',
    'Vaveda',
    'Hawai',

  ].obs;
  RxList<String> chooseHistory1 = <String> [
    'Buy History',
    'Sell History',
    'Deposit History',
    'Withdraw History',


  ].obs;







}
