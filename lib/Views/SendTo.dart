import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/DropdownButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/BankTransfer1.dart';

class SendTo extends StatelessWidget {
  const SendTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Send To',
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
                alignment: Alignment.center,
                child:  Image.asset(ImageStyle.logoWhiteBG,height: 68,),
              ),
            SizedBox(height: 40,),
            Text("To Address",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: Colors.grey)),
            SizedBox(height: 10,),
            Container(
              padding: EffectStyle.padding(10, 10, 0, 0),
              child:   Row(
                children: [

                  Expanded(child:  TextField (
                    decoration: InputDecoration(

                        border: InputBorder.none,

                        hintText: ''
                    ),
                  ),),
              InkWell(
                child:     Image.asset(ImageStyle.Scanner,height: 22,),
                onTap: (){},
              )

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
            SizedBox(height: 28,),
            Text("Amount ",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: Colors.grey)),
            SizedBox(height: 10,),
            Container(
              padding: EffectStyle.padding(10, 10, 0, 0),
              child:   Row(
                children: [

                  Expanded(child:  TextField (
                    decoration: InputDecoration(

                        border: InputBorder.none,

                        hintText: ''
                    ),
                  ),),
                  Text("INR(D) ",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: Colors.grey)),
                  SizedBox(width: 12,),
                  Text("All ",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.primaryColor)),

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
            SizedBox(height: 10,),
            Text("Balance : 0.00",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: Colors.grey)),
            SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: EffectStyle.padding(24, 0, 20, 20),
                child:   Column(
                  children: [
                    Row(
                      children: [


                        Text("The network you have selected is ",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),
                        SizedBox(width: 2,),
                        Text("BSC smart ",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.redAccent)),

                      ],
                    ),
                    Row(
                      children: [


                        Text("Chain.",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.redAccent)),
                        SizedBox(width: 2,),
                        Text("Please ensure that the withdrawal address",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),

                      ],
                    ),
                    Row(

                      children: [


                        Text("supports the.",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),
                        SizedBox(width: 2,),
                        Text("BSC smart chain",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.redAccent)),
                        SizedBox(width: 2,),
                        Text("network",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.grey)),



                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: ColorStyle.primaryColor.withOpacity(.1),

                    borderRadius: BorderRadius.circular(6)
                ),
              ),
              onTap: (){
                Get.to(BankTransfer1());
              },
            )


          ],
        ),
      ),
    );
  }
}
