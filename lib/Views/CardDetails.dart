import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/BankTransfer.dart';

class CardDetals extends StatelessWidget {
  const CardDetals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Card Detals ',
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

                    hintText: 'Card Number'
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

                    hintText: 'Expiry (MM/YY)'
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
              padding: EffectStyle.padding(15, 15, 0, 0),
              child:  Row(
                children: [
                 Expanded(child:  TextField (
                   decoration: InputDecoration(

                       border: InputBorder.none,

                       hintText: 'CVV'
                   ),
                 ),),
                  Image.asset(ImageStyle.card,height: 22,)
                ],
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

                    hintText: 'Cardholder Name'
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
              text: 'Continue',
              colorBG: ColorStyle.primaryColor,
              width: MediaQuery.of(context).size.width,
              textStyle: TextStylesProductSans.textStyles_16.apply(
                  color: Colors.white
              ),
              onTap: () {
                Get.to(BankTransfer());
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
