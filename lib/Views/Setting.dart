import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/DropdownButtonCustom.dart';
import 'package:inr_d/Components/HelpScreen.dart';
import 'package:inr_d/Components/ProfileScreen.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Controllers/SettingsController.dart';
import 'package:inr_d/Controllers/WalletController.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/SendTo.dart';

class Setting extends StatelessWidget {
   Setting({Key? key}) : super(key: key);
   final controller = Get.put(SettingsController());
  String titleManualDeposit = '';
  int indexManualDeposit = 0;
  final arrDropDown = ['+ Add Bank', 'Bank Transefer', 'UPI', 'CAD', 'HDFC', 'Interad',];
  final arrDropDownCurrency = ['Currency',];
   final arrDropDownHelp = ['Help','HDFC','' ];
   final arrDropDownMedia = ['Media','You Tube', ];
   final arrDropDownProfile = ['Profile', ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Settings',
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body:  GetBuilder(
        init: SettingsController(),
        initState: (state) {
          // controller.reset();
        },
        builder: (auth) {
          return Obx(() => SingleChildScrollView(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  padding: EffectStyle.padding(10, 0, 0, 0),
                  child:  TextField (
                    decoration: InputDecoration(

                        border: InputBorder.none,

                        hintText: 'Reset PIN'
                    ),
                  ),
                  decoration: BoxDecoration(
                      // color: ColorStyle.white,
                      border: Border.all(
                          color: ColorStyle.grey.withOpacity(.3)
                      ),
                      borderRadius: BorderRadius.circular(6)
                  ),
                ),

                SizedBox(height: 20,),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.arrSelect3.length,
physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(

                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 2, top: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all( color: ColorStyle.grey.withOpacity(.3))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            // 'Help',
                                              controller.chooseAdd[index],
                                              style: TextStylesProductSans
                                                  .textStyles_14),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      controller.arrSelect3[index]
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: ColorStyle.grey,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),

                              ],
                            ),
                            onTap: () {
                              for (int i = 0;
                              i < controller.arrSelect3.length;
                              i++) {
                                if (i == index) {
                                  controller.arrSelect3[i] =
                                  !controller.arrSelect3[i];
                                } else {
                                  controller.arrSelect3[i] = false;
                                }
                              }
                            },
                          ),
                          if (controller.arrSelect3[index])
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [



                                AddBank(),
                                SizedBox(height: 20,),


                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.arrSelect.length,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    // ScrollPhysics? physics;
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(

                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 2, top: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all( color: ColorStyle.grey.withOpacity(.3))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            // 'Help',
                                              controller.chooseHelp[index],
                                              style: TextStylesProductSans
                                                  .textStyles_14),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      controller.arrSelect[index]
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: ColorStyle.grey,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),

                              ],
                            ),
                            onTap: () {
                              for (int i = 0;
                              i < controller.arrSelect.length;
                              i++) {
                                if (i == index) {
                                  controller.arrSelect[i] =
                                  !controller.arrSelect[i];
                                } else {
                                  controller.arrSelect[i] = false;
                                }
                              }
                            },
                          ),
                          if (controller.arrSelect[index])
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [



                                HelpScreen(),
                                SizedBox(height: 20,),


                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.arrSelect4.length,

                      separatorBuilder: (context, index) {
                        // ScrollPhysics? physics;
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Container(

                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 16, right: 16, bottom: 2, top: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all( color: ColorStyle.grey.withOpacity(.3))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [

                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                // 'Help',
                                                  controller.chooseKYEC[index],
                                                  style: TextStylesProductSans
                                                      .textStyles_14),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          controller.arrSelect4[index]
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          color: ColorStyle.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),

                                  ],
                                ),
                                onTap: () {
                                  for (int i = 0;
                                  i < controller.arrSelect4.length;
                                  i++) {
                                    if (i == index) {
                                      controller.arrSelect4[i] =
                                      !controller.arrSelect4[i];
                                    } else {
                                      controller.arrSelect4[i] = false;
                                    }
                                  }
                                },
                              ),
                              if (controller.arrSelect4[index])
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [



                                    AddBankEKYC(),
                                    SizedBox(height: 20,),


                                  ],
                                ),
                            ],
                          ),
                        );
                      },
                    ),),
                    SizedBox(width: 10,),
                    InkWell(
                      child: Text("Not verified",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.primaryColor)),
                      onTap: (){

                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.arrSelect1.length,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(

                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 2, top: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all( color: ColorStyle.grey.withOpacity(.3))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            // 'Help',
                                              controller.chooseMed[index],
                                              style: TextStylesProductSans
                                                  .textStyles_14),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      controller.arrSelect1[index]
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: ColorStyle.grey,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),

                              ],
                            ),
                            onTap: () {
                              for (int i = 0;
                              i < controller.arrSelect1.length;
                              i++) {
                                if (i == index) {
                                  controller.arrSelect1[i] =
                                  !controller.arrSelect1[i];
                                } else {
                                  controller.arrSelect1[i] = false;
                                }
                              }
                            },
                          ),
                          if (controller.arrSelect1[index])
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  // width: 139,
                                  padding: EffectStyle.padding(10, 0, 0, 0),
                                  child: Row(

                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        ImageStyle.youTube,
                                        // controller.images[index],
                                        height: 28,),
                                      SizedBox(width: 10,),
                                      Text(
                                          "You Tube",
                                          // controller.chooseMedia[index],

                                          style: TextStylesProductSans.textStyles_16
                                              .apply(color: Colors.grey)),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorStyle.hex('F3E8E8'),

                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),


                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.arrSelect2.length,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(

                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 2, top: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all( color: ColorStyle.grey.withOpacity(.3))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            // 'Help',
                                              controller.chooseProfile[index],
                                              style: TextStylesProductSans
                                                  .textStyles_14),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      controller.arrSelect2[index]
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: ColorStyle.grey,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),

                              ],
                            ),
                            onTap: () {
                              for (int i = 0;
                              i < controller.arrSelect2.length;
                              i++) {
                                if (i == index) {
                                  controller.arrSelect2[i] =
                                  !controller.arrSelect2[i];
                                } else {
                                  controller.arrSelect2[i] = false;
                                }
                              }
                            },
                          ),
                          if (controller.arrSelect2[index])
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [


                                    Container(
                                      height: 50,
                                      // width: 139,
                                      padding: EffectStyle.padding(10, 0, 0, 0),
                                      child: TextField (

                                        decoration: InputDecoration(

                                            border: InputBorder.none,

                                            hintText: ' Full Name',
                                          hintStyle: TextStylesProductSans.textStyles_14

                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: ColorStyle.hex('F3E8E8'),

                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                    ),
                                    SizedBox(height: 14,),
                                    Container(
                                      height: 50,
                                      // width: 139,
                                      padding: EffectStyle.padding(10, 0, 0, 0),
                                      child: TextField (
                                        decoration: InputDecoration(

                                            border: InputBorder.none,

                                            hintText: 'Email',
                                            hintStyle: TextStylesProductSans.textStyles_14
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: ColorStyle.hex('F3E8E8'),

                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                    ),
                                    SizedBox(height: 14,),
                                    Container(
                                      height: 100,
                                      // width: 139,
                                      padding: EffectStyle.padding(10, 0, 0, 0),
                                      child: TextField (
                                        decoration: InputDecoration(

                                            border: InputBorder.none,

                                            hintText: '  Address',
                                            hintStyle: TextStylesProductSans.textStyles_14
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: ColorStyle.hex('F3E8E8'),

                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                    ),
                                    SizedBox(height: 14,),
                                    TextButtonCustom(
                                      text: ' Save',
                                      colorBG: ColorStyle.primaryColor,
                                      width: MediaQuery.of(context).size.width-60,
                                      textStyle: TextStylesProductSans.textStyles_16.apply(
                                          color: Colors.white
                                      ),
                                      onTap: () {
                                        Get.to(SendTo());
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),



                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.arrSelect5.length,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    // ScrollPhysics? physics;
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(

                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 2, top: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all( color: ColorStyle.grey.withOpacity(.3))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            // 'Help',
                                              controller.chooseHistory[index],
                                              style: TextStylesProductSans
                                                  .textStyles_14),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      controller.arrSelect5[index]
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: ColorStyle.grey,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),

                              ],
                            ),
                            onTap: () {
                              for (int i = 0;
                              i < controller.arrSelect5.length;
                              i++) {
                                if (i == index) {
                                  controller.arrSelect5[i] =
                                  !controller.arrSelect5[i];
                                } else {
                                  controller.arrSelect5[i] = false;
                                }
                              }
                            },
                          ),
                          if (controller.arrSelect5[index])
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [



                                ChooseHistory(),
                                SizedBox(height: 20,),


                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),



              ],
            ),
          ),);
        },
      ),


    );
  }
}
