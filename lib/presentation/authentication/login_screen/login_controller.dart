import 'dart:convert';

import 'package:demo_app/Model/response_model.dart';
import 'package:demo_app/data/repo/auth_repo.dart';
import 'package:demo_app/model/user_model.dart';
import 'package:demo_app/presentation/dashbord_screen.dart';
import 'package:demo_app/shared_prefrences/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../get_it/auth/repository/auth_repository.dart';
import '../../../service_locator.dart';
import '../../../widgets/common_snackbar.dart';

class LoginController extends GetxController{
  final AuthRepository repository = sl<AuthRepository>();
  Rx<UserModel?> user = Rx<UserModel?>(null);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    emailController.text = "janki.logicgo@gmail.com";
    passwordController.text = "janki@123";
    super.onInit();
  }
  void loadUser() {
    user.value = repository.getLocalUser();
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void loginValidation() async{

  if(emailController.text.isEmpty){
      Get.log("Enter the Email");
  }
  else if(!isValidEmail(emailController.text)){
    Get.log("Email not proper formate");
  }
  else if(passwordController.text.length <= 4){
    Get.log("Password must be a 4 character");
  }
  else if(passwordController.text.isEmpty){
    Get.log("Enter the password");
  }
  else{
    await login();
  }
}

  Future<void> login() async {
    try {
      final result = await repository.login({
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      });
      if (result.token.isNotEmpty) {
        commonSnackBar(message: "Login successful", success: true);

        Get.offAll(() => dashBoardScreen());
      }

    } catch (e) {
      commonSnackBar(message: e.toString(), success: false);
    }
  }


  Future<void> userLogin() async {
    try{
        SharedPref  sharedPref = SharedPref();
      ResponseModel response = await AuthRepo.loginApi(
          body: {
            "email": emailController.text.trim(),
            "password": passwordController.text.trim(),
          },

      );
      debugPrint('register Response === ${response.toJson()}');
      if (response.status == true) {
        UserModel userModel = UserModel.fromJson(response.body);
        commonSnackBar(message: response.message, success: true);
        sharedPref.setStringData(key: "userTokon", value: userModel.token);
        sharedPref.setStringData(key: "_id", value: userModel.user.id);
        sharedPref.setStringData(key: "name", value: userModel.user.fullName);
        sharedPref.setStringData(key: "email", value: userModel.user.id);
        sharedPref.setStringData(key: "profile_photo", value: userModel.user.profileImage);
        sharedPref.setStringData(key: "phoneNumber", value: userModel.user.phoneNumber);
        sharedPref.setStringData(key: "gender", value: userModel.user.gender);

        String jsonString = jsonEncode(userModel.user.toJson());
        sharedPref.setStringData(key: "userModel", value: jsonString);
        debugPrint("User = ${ UserModel.fromJson(response.body)}");
        Get.offAll(() => dashBoardScreen());

      } else {
        debugPrint("register status false");


        commonSnackBar(message: response.message, success: false);
      }
    } catch (e) {
      debugPrint('register Cache Error ${e.toString()}');
      commonSnackBar(message: e.toString(), success: false);

    }

  }


}