import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/TabbarScreenController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/Home.dart';
import '../Views/Wallet.dart';
import '../Views/AddCurrency.dart';


class TabbarScreen extends StatelessWidget {
  final int? indexSelected;

  TabbarScreen({Key? key, this.indexSelected = 0}) : super(key: key);

  double iconSize = 24;

  final arrBody = [
    Home(),
    AddCurrency(),
    Container(
      color: Colors.green,
    ),
    Wallet(),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabbarScreenController());
    return GetBuilder(
      init: TabbarScreenController(),
      builder: (auth) {
        return Obx(() => Scaffold(
              backgroundColor: Colors.white,
              body: arrBody[controller.index.value],
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageStyle.tHome,
                      height: iconSize,
                      color: (controller.index.value == 0)
                          ? ColorStyle.primaryColor
                          : ColorStyle.grey,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageStyle.tDeposit,
                      height: iconSize,
                      color: (controller.index.value == 1)
                          ? ColorStyle.primaryColor
                          : ColorStyle.grey,
                    ),
                    label: 'Deposit',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageStyle.tWithdraw,
                      height: iconSize,
                      color: (controller.index.value == 2)
                          ? ColorStyle.primaryColor
                          : ColorStyle.grey,
                    ),
                    label: 'Withdraw',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageStyle.tWallet,
                      height: iconSize,
                      color: (controller.index.value == 3)
                          ? ColorStyle.primaryColor
                          : ColorStyle.grey,
                    ),
                    label: 'Wallet',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      ImageStyle.tSettings,
                      height: iconSize,
                      color: (controller.index.value == 4)
                          ? ColorStyle.primaryColor
                          : ColorStyle.grey,
                    ),
                    label: 'Settings',
                  ),
                ],
                selectedLabelStyle: TextStylesProductSans.textStyles_14.apply(
                    // color: Colors.black,
                    // fontWeightDelta: 1,
                    ),
                unselectedLabelStyle: TextStylesProductSans.textStyles_14.apply(
                    // color: Colors.black,
                    // fontWeightDelta: 1,
                    ),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: ColorStyle.primaryColor,
                unselectedItemColor: Colors.grey,
                currentIndex: controller.index.value,
                elevation: 10,
                onTap: (index) {
                  controller.index.value = index;
                },
              ),
            ));
      },
    );
  }
}
