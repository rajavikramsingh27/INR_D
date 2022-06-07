import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';

class ReceiverINR extends StatelessWidget {
  const ReceiverINR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Receive INR(D)',
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 40,),

            Container(
              padding: EffectStyle.padding(10, 10, 20, 20),
              margin: EffectStyle.padding(20, 20, 0, 0),
              child:   Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Image.asset(ImageStyle.logoWhiteBG,height: 40,),
                      SizedBox(width: 2,),
                      Text("INR(D) ",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black)),


                    ],
                  ),
                  SizedBox(height: 14,),
                  Image.asset(ImageStyle.ScanCode,height: 180,),
                    SizedBox(height: 18,),
                  Text("8hXf1XfksjfkUHdj3CSjL56fskjsJFnjksj26a",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: Colors.grey)),
                  SizedBox(height: 2,),
                  Text("hnfjhNKhjfkj65fhjihjdDH ",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: Colors.grey)),
                  SizedBox(height: 8,),
                  Text("No memo required ",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: Colors.black87)),
                ],
              ),
              decoration: BoxDecoration(
                  color: ColorStyle.white,

                  borderRadius: BorderRadius.circular(12),
                boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                blurRadius: 8.0,

              ),

          ],
              ),
            ),
            SizedBox(height: 30,),
            Text("Send only INR(D) to this address. Sending any other coins may result in permanent loss.",
                textAlign: TextAlign.center,
                style: TextStylesProductSans.textStyles_14
                    .apply(color: Colors.grey)),
            SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            InkWell(
              child:  Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    // padding: EffectStyle.padding(10, 10, 20, 20),
                    child: Icon(Icons.copy,  color: ColorStyle.white,),
                    decoration: BoxDecoration(
                      color: ColorStyle.primaryColor,

                      borderRadius: BorderRadius.circular(50),

                    ),
                  ),
                  SizedBox(height: 8,),
                  Text("Copy",
                      textAlign: TextAlign.center,
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.primaryColor)),
                ],
              ),
              onTap: (){},
            ),
              SizedBox(width: 20,),
              InkWell(
                child:  Column(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      // padding: EffectStyle.padding(10, 10, 20, 20),
                      child: Icon(Icons.share,  color: ColorStyle.primaryColor,),
                      decoration: BoxDecoration(
                        color: ColorStyle.hex('F3E8E8'),

                        borderRadius: BorderRadius.circular(50),

                      ),
                    ),
                    SizedBox(height: 8,),
                    Text("Share",
                        textAlign: TextAlign.center,
                        style: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.primaryColor)),
                  ],
                ),
                onTap: (){},
              )


            ],
          )



          ],
        ),
      ),
    );
  }
}
