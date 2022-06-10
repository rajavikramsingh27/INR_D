import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Controllers/DepositMoneyController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'ManualDeposit.dart';
import '../Views/AddBank.dart';

class DepositMoney extends StatelessWidget {
  final String titleManualDeposit;
  final int indexManualDeposit;
  final String currencyName;

  DepositMoney({Key? key, required this.currencyName, required this.titleManualDeposit, required this.indexManualDeposit}) : super(key: key);

  final controller = Get.put(DepositMoneyController());
  bool isOwn = true;
  decorationForBoxes() {
    return BoxDecoration(
        color: ColorStyle.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: Colors.black12,
            width: 1
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 4,
            color: Colors.black12,
          )
        ]
    );
  }

  dropdownButtonCustom() {
    final arrDropDown = ['Your Own Account', 'Third Party Account'];

    return Get.dialog(
      barrierColor: Colors.transparent,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                color: Colors.transparent,
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                margin: EdgeInsets.only(
                  top: 120,
                  left: 20,
                  right: 20
                ),
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 16,
                ),
                child: ListView.separated(
                  itemCount: arrDropDown.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: ColorStyle.grey.withOpacity(0.6),
                      margin: EdgeInsets.only(
                        top: 16,
                        bottom: 16
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            arrDropDown[index],
                            textAlign: TextAlign.center,
                            style: TextStylesProductSans.textStyles_16.apply(
                              color: ColorStyle.grey,
                              fontWeightDelta: 1,
                            ),
                          ),
                          SizedBox(width: 40,),
                          Icon(Icons.arrow_forward_ios_sharp, color: ColorStyle.grey, size: 20)
                        ],
                      ),
                      onTap: () {
                        isOwn = (index == 0) ? true : false;
                        Get.back();
                        if (currencyName.toLowerCase().contains('inr')) {
                          alert();
                        }
                      },
                    );
                  },
                ),
              )
            ),
          ],
        )
    );
  }

  alert() {
    return Get.defaultDialog(
      radius: 6,
      title: 'Sorry!',
      titleStyle:  TextStylesProductSans.textStyles_20.apply(
        color: ColorStyle.grey,
        fontWeightDelta: 1,
      ),
      content: Text(
        'You have to add bank details.',
        style: TextStylesProductSans.textStyles_16.apply(
          color: ColorStyle.grey,
          fontWeightDelta: 1,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                'Add Bank',
                style: TextStylesProductSans.textStyles_16.apply(
                  color: Colors.blue,
                  fontWeightDelta: 1,
                ),
              ),
              onPressed: () {
                Get.back();
                Get.to(AddBank(
                  title: (isOwn ? 'Your Own ' : 'Third Party ')+currencyName,
                  arrBankFormDetails: controller.arrManualDeposit[indexManualDeposit],
                  isOwn: isOwn ? true : false ,
                ));
              },
            ),
          TextButton(
            child: Text(
              'Cancel',
              style: TextStylesProductSans.textStyles_16.apply(
                color: Colors.red,
                fontWeightDelta: 1,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          ],
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: '',
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body: GetBuilder(
        init: DepositMoneyController(),
        initState: (state) {
          controller.currencyName.value = currencyName;
          controller.reset();
        },
        builder: (auth) {
          return Obx(()=> controller.isLoading.value ? Container() : SingleChildScrollView(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: decorationForBoxes(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '   Auto Deposit',
                          style: TextStylesProductSans.textStyles_14.apply(
                            color: ColorStyle.grey,
                            fontWeightDelta: 0,
                          ),
                        ),
                        controller.htmlContentAutoDeposit.value
                      ],
                    ),
                  ),
                  onTap: () {
                    dropdownButtonCustom();
                  },
                ),

                SizedBox(
                  height: 60,
                ),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: decorationForBoxes(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '   Manual Deposit',
                            style: TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.grey,
                              fontWeightDelta: 0,
                            ),
                          ),
                          controller.htmlContentManualDeposit.value,
                        ],
                      )
                  ),
                  onTap: () {
                    Get.to(ManualDeposit(
                      title: titleManualDeposit,
                      arrBankDetails: controller.arrManualDeposit[indexManualDeposit],
                    ));
                  },
                ),

              ],
            ),
          ));
        },
      ),
    );
  }
}


