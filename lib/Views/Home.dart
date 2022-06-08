import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/ListViewHome.dart';
import 'package:inr_d/Controllers/HomeController.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/BuySell.dart';


class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.scaffold,
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.light,
        title: '',
        leading: IconButton(
          icon: Icon(Icons.notifications_none_sharp, color: Colors.white, size: 30,),
          onPressed: () {

          },
        ),
        trailings: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Image.asset(
              ImageStyle.Layer212Image,
              height: 26,
            ),
            onPressed: () {

            },
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16,right: 16),
              child: Column(
                children: [
                  Image.asset(
                    ImageStyle.LayerImage,
                    height: 50,
                    // color: ColorStyle,
                  ),
                  SizedBox(
                    height:8,
                  ),
                  Text("1,000.00 INR(D)",
                      style: TextStylesProductSans.textStyles_24.apply(
                          color: ColorStyle.white
                      )),
                  SizedBox(
                    height: 1,
                  ),
                  Text("Main Wallet",
                      style: TextStylesProductSans.textStyles_18.apply(
                          color: ColorStyle.grey
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12,right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'kera1605xx6pl...i3395refgjj',
                            style: TextStylesProductSans.textStyles_18),
                        Container(
                          child:Row(
                            children: [
                              Image.asset(
                                ImageStyle.Copy,
                                height: 32,
                                // color: ColorStyle,
                              ),
                              SizedBox(
                                width:6,
                              ),
                              Image.asset(
                                ImageStyle.qrcode,
                                height: 32,
                                // color: ColorStyle,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: ColorStyle.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                              ImageStyle.Group43,
                              height:56,
                              fit: BoxFit.cover,
                              // color: ColorStyle,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Send",
                                style: TextStylesProductSans.textStyles_14.apply(
                                    color: ColorStyle.white
                                )),
                          ],
                        ),
                      ),),
                      Expanded(child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                              ImageStyle.Group44,
                              height:56,
                              fit: BoxFit.cover,
                              // color: ColorStyle,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Receive",
                                style: TextStylesProductSans.textStyles_14.apply(
                                    color: ColorStyle.white
                                )),
                          ],
                        ),
                      ),),
                      Expanded(child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                ImageStyle.Group45,
                                height:56,
                                fit: BoxFit.cover,
                                // color: ColorStyle,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text("Buy",
                                  style: TextStylesProductSans.textStyles_14.apply(
                                      color: ColorStyle.white
                                  )),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.to(BuySell(isBuy: true,));
                        },
                      ),),
                      Expanded(child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                ImageStyle.Group46,
                                height:56,
                                fit: BoxFit.cover,
                                // color: ColorStyle,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text("Sell",
                                  style: TextStylesProductSans.textStyles_14.apply(
                                      color: ColorStyle.white
                                  )),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.to(BuySell(isBuy: false,));
                        },
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ListViewHome(),
          ],
        ),
      ),
    );
  }
}
