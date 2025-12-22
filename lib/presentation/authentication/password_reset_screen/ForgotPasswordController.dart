import 'dart:async';

import 'package:demo_app/Model/response_model.dart';
import 'package:demo_app/data/repo/auth_repo.dart';
import 'package:demo_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/common_snackbar.dart';

class ForgotPasswordController extends GetxController {

  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = ValueNotifier<bool>(false);
  final apiMessage = ValueNotifier<String>("");


  final secondsRemaining = ValueNotifier<int>(60);
  Timer? timer;


  Future<void> forgotPassword() async {
    final email = emailController.text.trim();

    isLoading.value = true;
    apiMessage.value = "";
    ResponseModel response = await AuthRepo.forgotPasswordApi(email: {"email": email});
    try {
      if (response.status){
        apiMessage.value = response.message;
        startTimer();
        isLoading.value = false;
        commonSnackBar(message: response.message, success: true);
        Get.toNamed(AppRoutes.verifyOTP);
      }
      else{
        apiMessage.value = response.message;
        isLoading.value = false;
      }
    } catch (e) {
      apiMessage.value = "Failed: ${response.message}";
    } finally {
      apiMessage.value = "";
      isLoading.value = false;
    }
  }



  /// START 1-MIN TIMER
  void startTimer() {
    secondsRemaining.value = 60;

    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        t.cancel();
      }
    });
  }

  /// VERIFY OTP API
  Future<void> verifyOtp() async {
    final email = emailController.text.trim();
    final otp = int.parse(otpController.text.trim());
      isLoading.value = true;

      ResponseModel response = await AuthRepo.verifyOtpApi(
        body: {
          "email": email,
          "otp": otp,
        },
      );
    try {

      apiMessage.value = response.message;
      if (response.status) {
        commonSnackBar(message: response.message, success: true);
        apiMessage.value = "";
        Get.toNamed(AppRoutes.resetPassword);
      }
      isLoading.value = false;
    } catch (e) {
      apiMessage.value = "Failed: ${response.message}";
    } finally {
      apiMessage.value = "";
      isLoading.value = false;
    }
  }

  /// RESEND OTP
  Future<void> resendOtp() async {
    final email = emailController.text.trim();

    isLoading.value = true;

    ResponseModel res = await AuthRepo.reSendEmailOtoApi(
      email: {"email": email},
    );
    try {
      isLoading.value = false;

      apiMessage.value = res.message;

      if (res.status) {
        startTimer(); // restart timer
      }
    } catch (e) {
      apiMessage.value = "Failed: ${res.message}";
    } finally {
      apiMessage.value = "";
      isLoading.value = false;
    }

  }
  Future<void> resetPassword() async {
    final email = emailController.text.trim();

    final newPass = newPasswordController.text.trim();
    final confirmPass = confirmPasswordController.text.trim();

    // VALIDATION
    if ( newPass.isEmpty || confirmPass.isEmpty) {
      apiMessage.value = "All fields are required!";
      return;
    }

    if (newPass.length < 6) {
      apiMessage.value = "New password must be at least 6 characters!";
      return;
    }

    if (newPass != confirmPass) {
      apiMessage.value = "New password & Confirm password must match!";
      return;
    }

    isLoading.value = true;
    apiMessage.value = "";

    ResponseModel res = await AuthRepo.resetPasswordApi(
      body: {
        "email": email,
        "newPassword": newPass,
        "conformNewPassword": confirmPass,
      },
    );
    try {
      isLoading.value = false;
      apiMessage.value = res.message;

      if (res.status) {
        commonSnackBar(message: res.message, success: true);

        Get.offAllNamed(AppRoutes.login);
      }
    }
    catch (e) {
      apiMessage.value = "Failed: ${res.message}";
    } finally {
      apiMessage.value = "";
      isLoading.value = false;
    }
  }



  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
