import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


showLoaderGetX() {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 60,
          // width: 200,
          margin: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
              Container(
                width: 16,
              ),
              Text(
                "Loading ...",
                style: TextStylesProductSans.textStyles_16
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

hideLoader() {
  Navigator.pop(Get.context!);
}

extension SnackBar on String {
  showError() {
    Get.snackbar(
      "Error!",
      this,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  showSuccess() {
    Get.snackbar(
      "Success!",
      this,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

