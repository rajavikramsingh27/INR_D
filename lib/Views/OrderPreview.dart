import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/AppBarStyle.dart';
import '../Components/TextButtonCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class OrderPreview extends StatelessWidget {
  const OrderPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Order Preview',
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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("10,000.00 INR(D)",
                  style: TextStylesProductSans.textStyles_24.apply(
                    color: ColorStyle.primaryColor
                  )),
              SizedBox(
                height: 31,
              ),
              Divider(
                height: 1,
                color: ColorStyle.grey,
              ),
              SizedBox(
                height: 46,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("INR(D) Price",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                  Text("78.90",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment Method",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                  Text("Cash (USD)",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Purchase",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                  Text("\$100.90",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Admin Fee",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                  Text("7.90 INR(D)",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Other Fee",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                  Text("0.00",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 46,),
              Row(
                children: [
                  Text("This transaction cannot be reversed.",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: Colors.grey)),
                  Text(" Learn More",
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.primaryColor)),
                ],
              ),
              SizedBox(height: 47,),
              Divider(
                height: 1,
                color: ColorStyle.grey,
              ),
              SizedBox(height: 50,),
              TextButtonCustom(
                text: "BUY NOW",
                colorBG: ColorStyle.primaryColor,
                textStyle: TextStylesProductSans.textStyles_16
                    .apply(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(VerificationCode());
                },
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
