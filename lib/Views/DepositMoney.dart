import 'package:flutter/material.dart';

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
        title: '',
        onTapTrailing: () {},
      ),
      body:SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                child: TextField (
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'Auto Deposit',
                    hintStyle: TextStylesProductSans.textStyles_18
                        .apply(color: ColorStyle.grey)
                  ),
                ),
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: ColorStyle.grey
                    )
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text("Content will be edit by admin",
                  style: TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.primaryColor)),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: TextField (
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'Manual Deposit',
                      hintStyle: TextStylesProductSans.textStyles_18
                          .apply(color: ColorStyle.grey)
                  ),
                ),
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: ColorStyle.grey
                    )
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text("Content will be edit by admin",
                  style: TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.primaryColor)),


            ],
          ),
        ),
      ),
    );
  }
}
