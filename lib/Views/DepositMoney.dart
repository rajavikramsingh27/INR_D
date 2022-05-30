import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';


class DeposiMoney extends StatelessWidget {
  const DeposiMoney({Key? key}) : super(key: key);

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
      body:SingleChildScrollView(
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
                GetStorage().write('isAutoDeposit', true);
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text("Content will be edit by admin",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.primaryColor)),
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
                GetStorage().write('isAutoDeposit', false);
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text("Content will be edit by admin",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.primaryColor)),
          ],
        ),
      ),
    );
  }
}
