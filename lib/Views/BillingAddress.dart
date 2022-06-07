import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/CardDetails.dart';


class BillingAddress extends StatelessWidget {
  const BillingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Add Card',
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
            Text("Billing Address",
                style: TextStylesProductSans.textStyles_18
                    .apply(color: Colors.black)),
            SizedBox(height: 20,),
            Container(
              height: 55,
              alignment: Alignment.centerLeft,
              padding: EffectStyle.padding(15, 0, 0, 0),
              child:  TextField (
                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: 'Canada'
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

                    hintText: 'Street Adress (Line 1)'
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

                    hintText: 'Street Adress (Line 2)'
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

                    hintText: 'State, Province or Region'
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

                    hintText: 'City*'
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

                    hintText: 'Postal Code*'
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
              text: ' ADD CARD',
              colorBG: ColorStyle.primaryColor,
              width: MediaQuery.of(context).size.width,
              textStyle: TextStylesProductSans.textStyles_16.apply(
                  color: Colors.white
              ),
              onTap: () {
                Get.to(CardDetals());
              },
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
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




          ],
        ),
      ),


    );
  }
}
