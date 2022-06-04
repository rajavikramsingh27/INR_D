import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Controllers/DepositMoneyController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';
import 'ManualDeposit.dart';


class DepositMoney extends StatelessWidget {
  final String titleManualDeposit;
  final int indexManualDeposit;
  final String currencyName;

  DepositMoney({Key? key, required this.currencyName, required this.titleManualDeposit, required this.indexManualDeposit}) : super(key: key);

  final controller = Get.put(DepositMoneyController());

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
                InkWell(
                  child: IgnorePointer(
                    ignoring: true,
                    child: TextFieldCustomOutline(
                      padding: EffectStyle.padding(10, 10, 10, 10),
                      maxLines: 5,
                      hintText: 'Auto Deposit',
                      textStyle: TextStylesProductSans.textStyles_18.apply(
                        color: Colors.black,
                        fontWeightDelta: 0,
                      ),
                      colorFill: ColorStyle.white,
                      colorBoder: Colors.black12,
                      radiusBorder: 6,
                    ),
                  ),
                  onTap: () {
                    // GetStorage().write('isAutoDeposit', true);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                controller.htmlContentAutoDeposit.value,
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  child: IgnorePointer(
                    ignoring: true,
                    child: TextFieldCustomOutline(
                      padding: EffectStyle.padding(10, 10, 10, 10),
                      maxLines: 5,
                      hintText: 'Manual Deposit',
                      textStyle: TextStylesProductSans.textStyles_18.apply(
                        color: Colors.black,
                        fontWeightDelta: 0,
                      ),
                      colorFill: ColorStyle.white,
                      colorBoder: Colors.black12,
                      radiusBorder: 6,
                    ),
                  ),
                  onTap: () {
                    Get.to(ManualDeposit(
                      title: titleManualDeposit,
                      arrBankDetails: controller.arrManualDeposit[indexManualDeposit],
                    ));

                  },
                ),
                SizedBox(
                  height: 16,
                ),
                controller.htmlContentManualDeposit.value,
              ],
            ),
          ));
        },
      ),
    );
  }
}
