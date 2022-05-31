
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inr_d/Styles/ImageStyle.dart';

import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';




class WalletController extends GetxController {

RxList<String> arrBankDetails = [''].obs;

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


RxList<String> images = <String>[
    ImageStyle.aud,
    ImageStyle.usd,
    ImageStyle.cad,
    ImageStyle.inr,
    ImageStyle.gbp,
    ImageStyle.euro,
    ImageStyle.sgd,
    ImageStyle.nzd,
  ].obs;

  RxList<bool> arrSelect = [false].obs;

  reset() {
    arrSelect.clear();
    arrBankDetails.clear();

    for (int i = 0; i< images.length; i++) {
      arrSelect.add(false);
    }

  }

}

textFieldOutline(String title) {
  return TextFieldCustomOutline(
    padding: EffectStyle.padding(10, 10, 10, 10),
    hintText: title,
    textStyle: TextStylesProductSans.textStyles_14.apply(
      color: Colors.black,
      fontWeightDelta: 1,
    ),
    colorFill: ColorStyle.white,
    colorBoder: Colors.black12,
    radiusBorder: 6,
  );
}

dropdownButtonCustom() {
  return DropdownButtonCustom(
    padding: EffectStyle.padding(10, 10, 10, 10),
    colorBorder: Colors.black12,
    radiusBorder: 6,
    textStyle: TextStylesProductSans.textStyles_14.apply(
      color: Colors.black,
      fontWeightDelta: 1,
    ),
    iconWidget: Icon(Icons.keyboard_arrow_down, color: ColorStyle.grey, size: 26,),
    listValue: ['Select ID', 'Driving Licence', 'Passport','National Card'],
    selectedValue: "Select ID",
    onChanged: (text) {},
  );
}

frontBack() {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(child: InkWell(
        child: Container(
          height: 50,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageStyle.cloudComputing,
                height: 22,
                color: ColorStyle.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text("ID Front",
                  style: TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.grey)),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: ColorStyle.grey
              )
          ),
        ),
        onTap: () {

        },
      )),
      SizedBox(width: 30,),
      Expanded(child: InkWell(
        child: Container(
          height: 50,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageStyle.cloudComputing,
                height: 22,
                color: ColorStyle.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text("ID Back",
                  style: TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.grey)),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: ColorStyle.grey
              )
          ),
        ),
        onTap: () {

        },
      ))
    ],
  );
}
