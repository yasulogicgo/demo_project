import 'package:flutter/material.dart';
import 'package:get/get.dart';


  SnackbarController commonSnackBar({ required String message ,required  bool success}) {
    return Get.snackbar(
      success == true ? "Success":"Error",
      message,
      backgroundColor: success == true ?Colors.green : Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(12),
      borderRadius: 12,
      duration: Duration(seconds: 2),
    );
  }

