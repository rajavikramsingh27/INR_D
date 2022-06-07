import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Components/TextFieldCustomOutline.dart';
import 'package:inr_d/Controllers/BuySellController.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/ManualDeposit.dart';
import 'package:inr_d/Views/OrderPreview.dart';

import '../Components/DropdownButtonCustom.dart';

class Withdraw extends StatelessWidget {
   Withdraw({Key? key}) : super(key: key);

   String titleManualDeposit = '';
   int indexManualDeposit = 0;
   final arrDropDown = ['Type', 'Bank Transefer', 'UPI', 'CAD', 'Payid', 'Interad',];
   final arrDropDownCurrency = ['Currency',];
   final arrDropDowns = ['Select Bank','HDFC','' ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Withdraw',
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EffectStyle.padding(10, 0, 0, 0),
              child:   Row(
                children: [
                  Text("Amount",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: Colors.grey)),
                  SizedBox(width: 20,),
          Expanded(child:  TextField (
            decoration: InputDecoration(

                border: InputBorder.none,

                hintText: '|'
            ),
          ),),
                 Expanded(child:  DropdownButtonCustomCurrency(
                   padding: EffectStyle.padding(10, 10, 10, 10),
                   colorBorder: Colors.black12,
                   radiusBorder: 6,
                   textStyle: TextStylesProductSans.textStyles_14.apply(
                     color: Colors.black,
                     fontWeightDelta: 1,
                   ),
                   iconWidget: Icon(Icons.keyboard_arrow_down, color: ColorStyle.grey, size: 26,),
                   listValue: arrDropDownCurrency,
                   selectedValue: 'Currency',
                   onChanged: (text) {
                     titleManualDeposit = text!;
                     indexManualDeposit = arrDropDown.indexOf(text)-1;
                   },
                 ),)
                ],
              ),
              decoration: BoxDecoration(
                  color: ColorStyle.white,
                border: Border.all(
                  color: ColorStyle.grey.withOpacity(.3)
                ),
                borderRadius: BorderRadius.circular(6)
              ),
            ),
            SizedBox(height: 20,),
            Text("Bal : 0,0",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: Colors.blueAccent)),
            SizedBox(height: 20,),
            DropdownButtonCustom(
              padding: EffectStyle.padding(10, 10, 10, 10),
              colorBorder: Colors.black12,
              radiusBorder: 6,
              textStyle: TextStylesProductSans.textStyles_14.apply(
                color: Colors.black,
                fontWeightDelta: 1,
              ),
              iconWidget: Icon(Icons.keyboard_arrow_down, color: ColorStyle.grey, size: 26,),
              listValue: arrDropDown,
              selectedValue: 'Type',
              onChanged: (text) {
                titleManualDeposit = text!;
                indexManualDeposit = arrDropDown.indexOf(text)-1;
              },
            ),
            SizedBox(height: 20,),
            DropdownButtonCustom(
              padding: EffectStyle.padding(10, 10, 10, 10),
              colorBorder: Colors.black12,
              radiusBorder: 6,
              textStyle: TextStylesProductSans.textStyles_14.apply(
                color: Colors.black,
                fontWeightDelta: 1,
              ),
              iconWidget: Icon(Icons.keyboard_arrow_down, color: ColorStyle.grey, size: 26,),
              listValue: arrDropDowns,
              selectedValue: 'Select Bank',
              onChanged: (text) {
                titleManualDeposit = text!;
                indexManualDeposit = arrDropDown.indexOf(text)-1;
              },
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              child: Text("OR",
                  style: TextStylesProductSans.textStyles_14
                      .apply(color: Colors.grey)),
            ),
            SizedBox(height: 20,),
            TextButtonAddCustom(
              text: " + Add Bank",

              textStyle: TextStylesProductSans.textStyles_16
                  .apply(color: Colors.blue.shade100),
              width: MediaQuery.of(context).size.width,
              onTap: () {
                // Get.to(VerificationCode());
              },
            ),
            SizedBox(height: 20,),
            TextButtonCustom(
              text: " WITHDRAW",
              colorBG: ColorStyle.primaryColor,
              textStyle: TextStylesProductSans.textStyles_16
                  .apply(color: Colors.white),
              width: MediaQuery.of(context).size.width,
              onTap: () {
                // Get.to(VerificationCode());
              },
            ),
            SizedBox(height: 20,),
            Container(
              height: 150,
              padding: EffectStyle.padding(10, 0, 0, 0),
              child: TextField (
                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: ''
                ),
              ),
              decoration: BoxDecoration(
                  color: ColorStyle.white.withOpacity(.3),
                  border: Border.all(
                      color: ColorStyle.grey.withOpacity(.3)
                  ),
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
