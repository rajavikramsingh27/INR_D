import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/AppBarStyle.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/BillingAddress.dart';

class AddCard extends StatelessWidget {
   AddCard({Key? key}) : super(key: key);
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return ColorStyle.primaryColor;
    }
    return ColorStyle.grey;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Add Card',
        titleColor: Colors.black,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body:   SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Disclaimer",
                style: TextStylesProductSans.textStyles_18
                    .apply(color: Colors.black)),
            SizedBox(height: 10,),
            Text("I am linking my card because iwant to use deposited funds to trade INR(D). Nobody else is instucting me to create an INR(D) account or link my card",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.grey)),
            SizedBox(height: 30,),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  padding: EffectStyle.padding(10, 0, 0, 0),
                  child: Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      isChecked = value!;
                    },
                  ),

                ),
                SizedBox(width: 10,),
                Text("I agree",
                    style: TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.grey)),
              ],
            ),
            SizedBox(height: 140,),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              padding: EffectStyle.padding(10, 0, 0, 0),
              child:  TextField (
                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: ''
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
            TextButtonCustom(
              text: ' CONTINUE',
              colorBG: ColorStyle.primaryColor,
              width: MediaQuery.of(context).size.width,
              textStyle: TextStylesProductSans.textStyles_16.apply(
                  color: Colors.white
              ),
              onTap: () {
                Get.to(BillingAddress());
              },
            )




          ],
        ),
      ),


    );
  }
}
