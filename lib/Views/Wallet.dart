import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/ListViewWallet.dart';
import 'package:inr_d/Controllers/WalletController.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';

class Wallet extends StatelessWidget {
  Wallet({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Wallet',
        trailings: [
          Container(
            height: 36,
            width: 36,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 20,
              icon: Icon(
                Icons.question_mark_rounded,
                color: Colors.grey,
              ),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16,right: 19),
              width: double.infinity,
              height: 298,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                ImageStyle.Group8,
                                height: 35
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("AUD",
                                style: TextStylesProductSans.textStyles_14),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorStyle.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    height:14,
                  ),
                  Text("Available : 0",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.grey)),
                  SizedBox(
                    height:26,
                  ),
                  TextButtonCustom(
                    text: "+ ADD BANK",
                    colorBG: ColorStyle.primaryColor,
                    textStyle: TextStylesProductSans.textStyles_16
                        .apply(color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      // Get.to(VerificationCode());
                    },
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 139,
                        height: 42,
                        child:   Text("WITHDRAW",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.greylow)),
                        decoration: BoxDecoration(
                          color: ColorStyle.greylight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 139,
                        height: 42,
                        child:   Text("HISTORY",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.greylow)),
                        decoration: BoxDecoration(
                          color: ColorStyle.greylight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 139,
                        height: 42,
                        child:   Text("DEPOSIT",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.greylow)),
                        decoration: BoxDecoration(
                          color: ColorStyle.greylight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 139,
                        height: 42,
                        child:   Text("BUY-SELL",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.greylow)),
                        decoration: BoxDecoration(
                          color: ColorStyle.greylight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: ColorStyle.grey
                  )
              ),
            ),
            SizedBox(
              height:10,
            ),
            ListViewWallet()
          ],
        ),
      ),
    );
  }
}
