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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 20
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                  "Deposit funds to your INR(D) wallet via NEFT, IMPS or RTGS",
                  style: TextStylesProductSans.textStyles_16
                      .apply(color: Colors.grey)),
            ),
            SizedBox(
              height: 16,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 16),
                  padding: EdgeInsets.only(left: 30, bottom: 30),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: ColorStyle.grey, width: 2))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Note the account details below and add as a "
                          'beneficiary to your registered bank account.',
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Beneficiary Name",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text("Nitan Singh",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset(
                            ImageStyle.Copyy,
                            height: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Bank Name",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text("ICIC Bank",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset(
                            ImageStyle.Copyy,
                            height: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Account Name",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text("ICBR 0000 0003 0695",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset(
                            ImageStyle.Copyy,
                            height: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("IFSC Name",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text("ICIC0001658",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset(
                            ImageStyle.Copyy,
                            height: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Account Type",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.black45)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text("Savings",
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.black)),
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset(
                            ImageStyle.Copyy,
                            height: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 0,
                  child: Container(
                    height: 36,
                    width: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorStyle.primaryColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Text('1',
                        style: TextStylesProductSans.textStyles_16
                            .apply(color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 36,
                  width: 36,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 16
                  ),
                  decoration: BoxDecoration(
                      color: ColorStyle.primaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                      '2',
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.white)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    // padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Transfer funds from your registered bank "
                                'account to the above beneficiary.',
                            style: TextStylesProductSans.textStyles_16
                                .apply(color: Colors.black45)),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Pleae Note:",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: Colors.black)),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "1. Beneficiary activation can take up to 6 hours depending on your bank.",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.grey)),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "2. You'll ne notified when your deposit has been credited to your INR(D) wallet.",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.grey)),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          child: Container(
                            // height: 55,

                            alignment: Alignment.centerLeft,
                            padding: EffectStyle.padding(15, 15, 15, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Transfer only from",
                                        style: TextStylesProductSans.textStyles_14
                                            .apply(color: Colors.black)),
                                    Image.asset(
                                      ImageStyle.QuetionMark,
                                      height: 22,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      child: Icon(
                                        Icons.account_balance_outlined,
                                        color: ColorStyle.white,
                                      ),
                                      alignment: Alignment.center,
                                      // padding: EffectStyle.padding(15, 15, 0, 0),

                                      decoration: BoxDecoration(
                                          color: ColorStyle.primaryColor,
                                          borderRadius: BorderRadius.circular(40)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Standard Chartered Bank",
                                            style: TextStylesProductSans.textStyles_14
                                                .apply(color: ColorStyle.grey)),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text("XXXXXX9155",
                                            style: TextStylesProductSans.textStyles_14
                                                .apply(color: Colors.black)),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    "Note: Tranfers from any other account will be automatically rejected and refunded in 5 to 7 days",
                                    style: TextStylesProductSans.textStyles_14
                                        .apply(color: ColorStyle.hex('CEA100'))),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: ColorStyle.primaryColor.withOpacity(.1),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onTap: () {
                            // Get.to(KYCVerification());
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
