import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Components/AppBarStyle.dart';
import '../Components/TextButtonCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Controllers/OrderPreviewController.dart';
import 'package:get/get.dart';



class OrderPreview extends StatelessWidget {
  final double? conversionPrice;
  final String? paymentMethodCurrency;
  final double? purchasePrice;
  final bool isSell;

  OrderPreview({Key? key,
    required this.conversionPrice,
    required this.paymentMethodCurrency,
    required this.purchasePrice,
    required this.isSell,
  }) : super(key: key);

  final controller = Get.put(OrderPreviewController());

  purchasePopUp() {
    return Get.dialog(
        Center(
          child: Container(
            margin: EdgeInsets.only(
                left: 30,
                right: 30
            ),
            height: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorStyle.primaryColor,
                borderRadius: BorderRadius.circular(2)
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Sucessfully ${isSell ? 'Purchased' : 'Sold'}',
                      style: TextStylesProductSans.textStyles_20.apply(
                          color: Colors.white
                      )
                  ),
                  SizedBox(height: 40),
                  TextButtonCustom(
                    height: 44,
                    width: 120,
                    text: 'Done',
                      textStyle: TextStylesProductSans.textStyles_18.apply(
                          color: ColorStyle.primaryColor
                      ),
                    colorBG: Colors.white,
                    onTap: () {
                      Get.back();
                      Navigator.of(Get.context!)..pop()..pop();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Order Preview',
        leading: BackButton(
          color: ColorStyle.grey,
        ),
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
        init: OrderPreviewController(),
        initState: (state) {
          controller.purchasePrice.value = purchasePrice!;
          controller.conversionPrice.value = conversionPrice!;
          Future.delayed(Duration(milliseconds: 100), () {
            controller.getFixer(paymentMethodCurrency!, isSell);
          });
          controller.reset();
        },
        builder: (auth) {
          return Obx(()=>SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${controller.totalPrice.value} INR(D)',
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
                      Text(
                          conversionPrice!.toString(),
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
                      Text("Cash (${paymentMethodCurrency})",
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
                      Text(
                          paymentMethodCurrency!.contains('INR') ? 'INR ${purchasePrice!}' : '\$${purchasePrice!}',
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.grey)),
                    ],
                  ),

                  if (controller.admin_fees.value != 0.0)
                  SizedBox(height: 50,),
                  if (controller.admin_fees.value != 0.0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Admin Fee",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.grey)),
                      Text(
                          '${controller.admin_fees.value} INR(D)',
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.grey)),
                    ],
                  ),
                  if (controller.inflation_rate.value != 0.0)
                  SizedBox(height: 50,),
                  if (controller.inflation_rate.value != 0.0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Inflation Rate',
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.grey)),
                      Text(
                          isSell ? '- ${controller.inflation_rate.value}  % INR(D)' : '+${controller.inflation_rate.value} % INR(D)',
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.grey)),
                    ],
                  ),
                  if (controller.other_fees.value != 0.0)
                  SizedBox(height: 50,),
                  if (controller.other_fees.value != 0.0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Other Fee",
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: Colors.grey)),
                      Text(
                          '${controller.other_fees.value} INR(D)',
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
                      purchasePopUp();
                    },
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ));
        }
      ),
    );
  }
}
