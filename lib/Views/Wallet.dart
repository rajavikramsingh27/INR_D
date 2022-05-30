import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inr_d/Controllers/WalletController.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/AddBank.dart';
import '../Views/ManualDeposit.dart';


class Wallet extends StatelessWidget {
  Wallet({Key? key}) : super(key: key);

  final controller = Get.put(WalletController());

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
      body: GetBuilder(
        init: WalletController(),
        initState: (state) {
          controller.reset();
        },
        builder: (auth) {
          return Obx(()=>ListView.separated(
            shrinkWrap: true,
            itemCount: controller.arrSelect.length,
            padding: EdgeInsets.only(left: 16,right: 16, bottom: 16, top: 16),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16,right: 16, bottom: 16, top: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: ColorStyle.grey
                    )
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        controller.images[index],
                                        height: 35
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        controller.chooseUSD[index],
                                        style: TextStylesProductSans.textStyles_14),
                                  ],
                                ),
                              ),
                              Icon(
                                controller.arrSelect[index] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
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
                        ],
                      ),
                      onTap: () {
                        for (int i = 0; i<controller.arrSelect.length; i++) {
                          if (i==index) {
                            controller.arrSelect[i] = !controller.arrSelect[i];
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
                              final isAutoDeposit = GetStorage().read('isAutoDeposit') ?? true;

                              List<Widget> arrBankDetails = [];

                              if (index == 0) {
                                arrBankDetails = controller.arrAUDBankDetails;
                              } else if (index == 1) {
                                arrBankDetails = controller.arrUSDBankDetails;
                              } else if (index == 2) {
                                arrBankDetails = controller.arrCADBankDetails;
                              } else if (index == 3) {
                                arrBankDetails = controller.arrINRBankDetails;
                              } else if (index == 4) {
                                arrBankDetails = controller.arrGBPBankDetails;
                              } else if (index == 5) {
                                arrBankDetails = controller.arrEUROBankDetails;
                              } else if (index == 6) {
                                arrBankDetails = controller.arrSGDBankDetails;
                              } else if (index == 7) {
                                arrBankDetails = controller.arrNZDBankDetails;
                              }
                              if (isAutoDeposit) {
                                Get.to(AddBank(
                                  title: controller.chooseUSD[index],
                                  arrBankFormDetails: arrBankDetails,
                                ));
                              } else {
                                Get.to(ManualDeposit(
                                  title: controller.chooseUSD[index],
                                  arrBankDetails: controller.arrManualDeposit[index],
                                ));
                              }
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
                  ],
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
