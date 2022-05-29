import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/WalletController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class ListViewWallet extends StatelessWidget {
  ListViewWallet({Key? key}) : super(key: key);

  final controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 500,
      child:  ListView.separated(
        itemCount: 7,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 16,right: 19),
            width: double.infinity,
            height: 102,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      Icons.keyboard_arrow_up,
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: ColorStyle.grey
                )
            ),
          );
        },
      ),
      // border: Border.all(
      //     color: ColorStyle.grey
      // )
    );
  }
}
