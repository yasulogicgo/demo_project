import 'package:demo_app/Model/response_model.dart';
import 'package:demo_app/data/repo/auth_repo.dart';
import 'package:demo_app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/common_snackbar.dart';

class SingUpController extends GetxController {
  // TextEditing Controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observables
  var isLoading = false.obs;
  var hidePassword = true;
  var hideConfirmPassword = true;

  // Validation Logic
  bool validateRegistration() {
    if (emailController.text.trim().isEmpty) {
      Get.snackbar("Error", "Email is required",);
      return false;
    }

    if (!emailController.text.trim().isEmail) {
      Get.snackbar("Error", "Invalid email format");
      return false;
    }

    if (passwordController.text.trim().isEmpty) {
      Get.snackbar("Error", "Password is required");
      return false;
    }

    if (passwordController.text.trim().length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters");
      return false;
    }

    if (confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar("Error", "Confirm password is required");
      return false;
    }

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Get.snackbar("Error", "Passwords do not match");
      return false;
    }

    return  true;
  }

  void passwordShow(){
    hidePassword = !hidePassword;
    update();
  }
  void confirmPasswordShow(){
    hideConfirmPassword = !hideConfirmPassword;
    update();
  }

  // API Call or Submit Logic
  void registerUser() async {
    if (!validateRegistration()) return;

    isLoading.value = true;

    try {
      ResponseModel response = await AuthRepo.registerApi(
        body: {
          "fullname": userNameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      debugPrint('register Response === ${response.toJson()}');
      if (response.status == true) {
        isLoading.value = false;
        commonSnackBar(message: response.message, success: false);

      } else {
        debugPrint("register status false");
        isLoading.value = false;

        commonSnackBar(message: response.message, success: false);
      }
    } catch (e) {
      debugPrint('register Cache Error ${e.toString()}');
      isLoading.value = false;
      commonSnackBar(message: e.toString(), success: false);

    }

    isLoading.value = false;

    Get.snackbar("Success", "Registration completed!");

    Get.back(); // go to login or previous screen
  }
}
