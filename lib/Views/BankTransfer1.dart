import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/BillingAddress.dart';
import 'package:inr_d/Views/KYCVerification.dart';

class BankTransfer1 extends StatelessWidget {
  const BankTransfer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Bank Transfer',
        titleColor: Colors.black,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body:   SingleChildScrollView(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pleae Note:",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: Colors.black)),
            SizedBox(height: 10,),
            Text( "1. Beneficiary activation can take up to 6 hours depending on your bank.",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.grey)),
            SizedBox(height: 10,),
            Text( "2. You'll ne notified when your deposit has been credited to your INR(D) wallet.",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.grey)),
            SizedBox(height: 20,),
           InkWell(
             child:  Container(
               // height: 55,

               alignment: Alignment.centerLeft,
               padding: EffectStyle.padding(15, 15, 15, 15),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text( "Transfer only from",
                           style: TextStylesProductSans.textStyles_14
                               .apply(color: Colors.black)),
                       Image.asset(ImageStyle.QuetionMark,height: 22,)
                     ],
                   ),
                   SizedBox(height: 15,),
                   Row(

                     children: [
                       Container(
                         height: 45,
                         width: 45,
                         child:  Icon(Icons.account_balance_outlined,color: ColorStyle.white,),
                         alignment: Alignment.center,
                         // padding: EffectStyle.padding(15, 15, 0, 0),

                         decoration: BoxDecoration(
                             color: ColorStyle.primaryColor,

                             borderRadius: BorderRadius.circular(40)
                         ),
                       ),
                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text( "Standard Chartered Bank",
                               style: TextStylesProductSans.textStyles_14
                                   .apply(color: ColorStyle.grey)),
                           SizedBox(height: 2,),
                           Text( "XXXXXX9155",
                               style: TextStylesProductSans.textStyles_14
                                   .apply(color: Colors.black)),
                         ],
                       ),
                     ],
                   ),
                   SizedBox(height: 20,),
                   Text( "Note: Tranfers from any other account will be automatically rejected and refunded in 5 to 7 days",
                       style: TextStylesProductSans.textStyles_14
                           .apply(color: ColorStyle.hex('CEA100'))),
                 ],
               ),
               decoration: BoxDecoration(
                   color: ColorStyle.primaryColor.withOpacity(.1),

                   borderRadius: BorderRadius.circular(12)
               ),
             ),
             onTap: (){
               Get.to(KYCVerification());
             },
           )





          ],
        ),
      ),


    );
  }
}
