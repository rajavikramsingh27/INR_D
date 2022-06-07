import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';

class BankTransfer extends StatelessWidget {
  const BankTransfer({Key? key}) : super(key: key);

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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Container(


                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text("Deposit funds to your INR(D) wallet via NEFT, IMPS or RTGS",
                    style: TextStylesProductSans.textStyles_16
                        .apply(color: Colors.grey)),


            ),
            SizedBox(height: 20,),
            Container(


              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text("Minimum ₹100  |  Maximum ₹10,000",
                  style: TextStylesProductSans.textStyles_18
                      .apply(color: Colors.black)),


            ),
            SizedBox(height: 20,),
            Container(

              padding: EdgeInsets.only(left: 12, right: 12),
              child:  Row(
                children: [

                  Column(
                    children: [
                      Container(

                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        // padding: EffectStyle.padding(15, 0, 0, 0),
                        child: Text("1",
                            style: TextStylesProductSans.textStyles_20
                                .apply(color: Colors.white)),
                        decoration: BoxDecoration(
                            color: ColorStyle.primaryColor,

                            borderRadius: BorderRadius.circular(45)
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height-320,
                        width: 2,

                        decoration: BoxDecoration(
                            color: ColorStyle.grey,

                            borderRadius: BorderRadius.circular(45)
                        ),
                      ),
                      Container(

                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        // padding: EffectStyle.padding(15, 0, 0, 0),
                        child: Text("2",
                            style: TextStylesProductSans.textStyles_20
                                .apply(color: Colors.white)),
                        decoration: BoxDecoration(
                            color: ColorStyle.primaryColor,

                            borderRadius: BorderRadius.circular(45)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Note the account details below and add as a ",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      Text("beneficiary to your registered bank account.",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(height: 50,),
                      Text("Beneficiary Name",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text("Nitan Singh",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(width: 6,),
                          Image.asset(ImageStyle.Copyy,height: 16,)
                        ],
                      ),
                      SizedBox(height: 40,),
                      Text("Bank Name",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text("ICIC Bank",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(width: 6,),
                          Image.asset(ImageStyle.Copyy,height: 16,)
                        ],
                      ),
                      SizedBox(height: 40,),
                      Text("Account Name",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text("ICBR 0000 0003 0695",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(width: 6,),
                          Image.asset(ImageStyle.Copyy,height: 16,)
                        ],
                      ),
                      SizedBox(height: 40,),
                      Text("IFSC Name",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text("ICIC0001658",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(width: 6,),
                          Image.asset(ImageStyle.Copyy,height: 16,)
                        ],
                      ),
                      SizedBox(height: 40,),
                      Text("Account Type",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text("Savings",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(width: 6,),
                          Image.asset(ImageStyle.Copyy,height: 16,)
                        ],
                      ),
                      SizedBox(height: 50,),
                      Text("Transfer funds from your registered bank ",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      Text("account to the above beneficiary.",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),

                    ],
                  ),


                ],
              )

            ),


          ],
        ),
      ),


    );
  }
}
