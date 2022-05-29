import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Components/AddBankAUDBox.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';

class AddBankAUD extends StatelessWidget {
  const AddBankAUD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Add Bank',
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
      body:SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldCustomOutline(
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'Name :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              TextFieldCustomOutline(
                keyboardType: TextInputType.number,
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'Account No. :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              TextFieldCustomOutline(
                keyboardType: TextInputType.number,
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'BSB No. :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              TextFieldCustomOutline(
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'Bank Name :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              DropdownButtonCustom(
                padding: EffectStyle.padding(10, 10, 10, 10),
                colorBorder: Colors.black12,
                radiusBorder: 6,
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                iconWidget: Icon(Icons.keyboard_arrow_down, color: ColorStyle.grey, size: 26,),
                listValue: ['Select ID :', 'Driving Licence', 'Passport','National Card'],
                selectedValue: "Select ID :",
                onChanged: (text) {},
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 42,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageStyle.cloudComputing,
                          height: 22,
                          color: ColorStyle.grey,
                        ),
                        // Icon(Icons.cloud_upload_outlined,
                        // color: ColorStyle.grey,
                        //   size: 20,
                        // ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("ID Front",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.grey)),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: ColorStyle.grey
                        )
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 42,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageStyle.cloudComputing,
                          height: 22,
                          color: ColorStyle.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("ID Back",
                            style: TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.grey)),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: ColorStyle.grey
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              TextButtonCustom(
                text: "SUBMIT",
                colorBG: ColorStyle.primaryColor,
                textStyle: TextStylesProductSans.textStyles_16
                    .apply(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(VerificationCode());
                },
              ),
              SizedBox(
                height: 22,
              ),
              AddBankAUDBox(),

              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
