import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Controllers/AddCurrencyController.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/DepositMoney.dart';
import '../Controllers/DepositMoneyController.dart';
import '../Utils/Global.dart';
import 'package:flutter/cupertino.dart';


class AddCurrency extends StatelessWidget {
  AddCurrency({Key? key}) : super(key: key);

  final controllerDepositMoney = Get.put(DepositMoneyController());
  final controller = Get.put(AddCurrencyController());

  String titleManualDeposit = '';
  int indexManualDeposit = 0;
  final arrDropDown = [
    'Select',
    'AUD',
    'USD',
    'CAD',
    'INR',
    'GBP',
    'EURO',
    'SGD',
    'NZD'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Add Currency',
      ),
      body: GetBuilder(
        init: AddCurrencyController(),
        initState: (state) {
          controller.reset();
        },
        builder: (auth) {
          return Obx(() => controller.isLoading.value ? Container() : SingleChildScrollView(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                DropdownButtonCustom(
                  padding: EffectStyle.padding(10, 10, 10, 10),
                  bgColor: Colors.white,
                  colorBorder: Colors.black12,
                  dropdownColor: Colors.white,
                  radiusBorder: 6,
                  textStyle: TextStylesProductSans.textStyles_14.apply(
                    color: Colors.grey,
                    fontWeightDelta: 2,
                  ),
                  iconWidget: Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorStyle.grey,
                    size: 26,
                  ),
                  listValue: arrDropDown,
                  selectedValue: 'Select',
                  onChanged: (text) {
                    titleManualDeposit = text!;
                    indexManualDeposit = arrDropDown.indexOf(text) - 1;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Enter Amount",
                    style: TextStylesProductSans.textStyles_14),
                SizedBox(
                  height: 7,
                ),
                TextFieldCustomOutline(
                  padding: EffectStyle.padding(10, 10, 10, 10),
                  hintText: 'Ex.\$320',
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true
                  ),
                  textStyle: TextStylesProductSans.textStyles_14.apply(
                    color: Colors.black,
                    fontWeightDelta: 1,
                  ),
                  colorFill: ColorStyle.white,
                  colorBoder: Colors.black12,
                  radiusBorder: 6,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Min. 10",
                        style: TextStylesProductSans.textStyles_14
                            .apply(color: Colors.grey)),
                    Text("Max. 1000",
                        style: TextStylesProductSans.textStyles_14
                            .apply(color: Colors.grey)),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextButtonCustom(
                  text: 'DEPOSIT',
                  colorBG: ColorStyle.primaryColor,
                  textStyle: TextStylesProductSans.textStyles_16
                      .apply(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    if (titleManualDeposit.isEmpty) {
                      'Select Country'.showError();
                      return;
                    }
                    Get.to(DepositMoney(
                      currencyName: titleManualDeposit,
                      titleManualDeposit: titleManualDeposit,
                      indexManualDeposit: indexManualDeposit,
                    ));
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: ColorStyle.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Colors.black12,
                      width: 1
                    )
                  ),
                  child: controller.htmlContent.value,
                ),
                // Html(data: controller.htmlContent.value),
              ],
            ),
          ));
        },
      ),
    );
  }
}
