import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';

import 'package:inr_d/Styles/TextStyles.dart';import 'package:inr_d/Views/BankTransfer.dart';
// import 'package:inr_d/Views/YourOwnAUDAccount.dart';


class KYCVerification extends StatelessWidget {
   KYCVerification({Key? key}) : super(key: key);
   bool isChecked = false;
   Color getColor(Set<MaterialState> states) {
     const Set<MaterialState> interactiveStates = <MaterialState>{
       MaterialState.pressed,
       MaterialState.hovered,
       MaterialState.focused,
     };
     if (states.any(interactiveStates.contains)) {
       return ColorStyle.primaryColor;
     }
     return ColorStyle.grey;
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'KYC Verification',
        titleColor: Colors.black,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body:   SingleChildScrollView(
        padding: EdgeInsets.only(left: 16,right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Documents you should keep handy",
                style: TextStylesProductSans.textStyles_18
                    .apply(color: Colors.black)),
            SizedBox(height: 18,),
            Text( "To open a INR(D) account, INR(D) requires few documents to verifiy your identity.",
                style: TextStylesProductSans.textStyles_16
                    .apply(color: ColorStyle.grey)),
            SizedBox(height: 40,),
            Text( "INDIA",
                style: TextStylesProductSans.textStyles_18
                    .apply(color: Colors.black)),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( "1. Aadhaar card ",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),
                        SizedBox(height: 6,),
                        Image.asset(ImageStyle.Card2,height: 65,)
                      ],
                    ),
                    SizedBox(width: 18,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( "2. Passport ",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),
                        SizedBox(height: 6,),
                        Image.asset(ImageStyle.Card3,height: 65,)
                      ],
                    ),

                  ],
                ),

              ],
            ),
            SizedBox(height: 40,),
            Text( "REST OF WORLD",
                style: TextStylesProductSans.textStyles_18
                    .apply(color: Colors.black)),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( "1. Passport ",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),
                        SizedBox(height: 6,),
                        Image.asset(ImageStyle.Card3,height: 65,)
                      ],
                    ),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( "2. Driving License",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),
                        SizedBox(height: 6,),
                        Image.asset(ImageStyle.Card4
                          ,height: 65,)
                      ],
                    ),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( "3. National ID",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),
                        SizedBox(height: 6,),
                        Image.asset(ImageStyle.Card5,height: 65,)
                      ],
                    ),

                  ],
                ),

              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      padding: EffectStyle.padding(10, 0, 0, 0),
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          isChecked = value!;
                        },
                      ),

                    ),
                    SizedBox(height: 10,),

                  ],
                ),


                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("I confirm that i am not a resident of any of following",
                        style: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.grey)),
                   Row(
                     children: [
                       Text("US states.",
                           style: TextStylesProductSans.textStyles_16
                               .apply(color: ColorStyle.grey)),
                       Text(" ( NY, CA, WA, VT, Naveda, Hawai )",
                           style: TextStylesProductSans.textStyles_14
                               .apply(color: ColorStyle.primaryColor)),
                     ],
                   )

                  ],
                ),
              ],
            ),
            SizedBox(height: 40,),
            TextButtonCustom(
              text: 'CONTINUE',
              colorBG: ColorStyle.primaryColor,
              width: MediaQuery.of(context).size.width,
              textStyle: TextStylesProductSans.textStyles_16.apply(
                  color: Colors.white
              ),
              onTap: () {
                // Get.to(YourOwnAUDAccount());
              },
            ),

          ],
        ),
      ),


    );
  }
}
