
import 'package:demo_app/constant/constant_string.dart';
import 'package:demo_app/presentation/authentication/sing_up/sing_up_controller.dart';
import 'package:demo_app/widgets/common_Textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SingUpControllerScreen extends StatelessWidget {
  const SingUpControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(SingUpController());

    return Scaffold(
      appBar: AppBar(
        title: Text(register),
      ),
      body: GetBuilder<SingUpController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                CommonTextfield(
                    controller: controller.emailController,
                    hintText: email

                ),
                SizedBox(height: 20),

                CommonTextfield(
                    controller: controller.passwordController,
                    hintText: password,

                    obscureText: controller.hidePassword,
                    suffixWidget: IconButton(
                        icon:  Icon(controller.hidePassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: (){ controller.passwordShow();} ),
                ),

                SizedBox(height: 20,),
                CommonTextfield(
                  controller: controller.confirmPasswordController,
                  hintText: passwordConfirm,
                  obscureText: controller.hideConfirmPassword,
                  suffixWidget: IconButton(
                      icon:  Icon(controller.hideConfirmPassword ? Icons.visibility_off : Icons.visibility),
                      onPressed: (){ controller.confirmPasswordShow();} ),
                ),
                // Confirm Password
                SizedBox(height: 30),
                // Register Button
                Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.registerUser,
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(register),
                  ),
                )),
              ],
            ),
          );
        }
      ),
    );
  }
}
