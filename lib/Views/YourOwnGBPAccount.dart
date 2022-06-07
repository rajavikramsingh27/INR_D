import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/YourOwnUSDAccount.dart';

class YourOwnGBPAccount extends StatelessWidget {
  const YourOwnGBPAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Your Own GBP Account',
        titleColor: Colors.black,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body:   SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20,),
            Container(
              height: 55,
              alignment: Alignment.centerLeft,
              padding: EffectStyle.padding(15, 0, 0, 0),
              child:  TextField (
                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: 'Name'
                ),
              ),
              decoration: BoxDecoration(
                // color: ColorStyle.white,
                  border: Border.all(
                      color: ColorStyle.grey.withOpacity(.3)
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 55,
              alignment: Alignment.centerLeft,
              padding: EffectStyle.padding(15, 0, 0, 0),
              child:  TextField (
                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: 'Account No.'
                ),
              ),
              decoration: BoxDecoration(
                // color: ColorStyle.white,
                  border: Border.all(
                      color: ColorStyle.grey.withOpacity(.3)
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 55,
              alignment: Alignment.centerLeft,
              padding: EffectStyle.padding(15, 0, 0, 0),
              child:  TextField (
                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: 'Sort Code'
                ),
              ),
              decoration: BoxDecoration(
                // color: ColorStyle.white,
                  border: Border.all(
                      color: ColorStyle.grey.withOpacity(.3)
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 55,
              alignment: Alignment.centerLeft,
              padding: EffectStyle.padding(15, 0, 0, 0),
              child:  TextField (
                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: 'Bank Name'
                ),
              ),
              decoration: BoxDecoration(
                // color: ColorStyle.white,
                  border: Border.all(
                      color: ColorStyle.grey.withOpacity(.3)
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
            ),



            SizedBox(height: 20,),
            TextButtonCustom(
              text: 'SUBMIT',
              colorBG: ColorStyle.primaryColor,
              width: MediaQuery.of(context).size.width,
              textStyle: TextStylesProductSans.textStyles_16.apply(
                  color: Colors.white
              ),
              onTap: () {
                Get.to(YourOwnUSDAccount());
              },
            ),
            SizedBox(height: 20,),
            Container(
              height: 150,
              // alignment: Alignment.centerLeft,
              padding: EffectStyle.padding(15, 0, 0, 0),
              child:  TextField (
                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: ''
                ),
              ),
              decoration: BoxDecoration(
                // color: ColorStyle.white,
                  border: Border.all(
                      color: ColorStyle.grey.withOpacity(.3)
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
            SizedBox(height: 20,),
            Text("Content will be edit by admin",
                style: TextStylesProductSans.textStyles_18
                    .apply(color: ColorStyle.primaryColor)),
            SizedBox(height: 20,),

          ],
        ),
      ),


    );
  }
}
