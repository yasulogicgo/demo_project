import 'package:demo_app/constant/constant_icons.dart';
import 'package:demo_app/constant/constant_string.dart';
import 'package:demo_app/presentation/authentication/login_screen/login_controller.dart';
import 'package:demo_app/presentation/authentication/sing_up/sing_up_screen.dart';
import 'package:demo_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/common_Textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     Get.put(LoginController());
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),

      body: GetBuilder<LoginController>(
        builder: (controller) =>
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),

                        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

              Image.asset(ConstantIcons.userAvatar,height: 64.h,width: 64.w,),

                // Title
                Text(
                  welcomeBack,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10.h),

                // Email Field
                CommonTextfield(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  hintText: email,
                  prefixWidget: Icon(Icons.email_outlined),
                  fillColor: Colors.grey.shade200,
                  borderColor: Colors.grey,
                ),

                SizedBox(height: 20.h),

                // Password Field
                CommonTextfield(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: controller.passwordController,
                  hintText: password,
                  prefixWidget: Icon(Icons.lock_outline),
                  fillColor: Colors.grey.shade200,
                  borderColor: Colors.grey,
                ),

                SizedBox(height: 30.h),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50.h,

                  child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          onPressed: () {
                            controller.loginValidation();
                            controller.update();
                            },
                          child: Text(
                      login,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Container(
                  alignment: .centerRight,
                  child: TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.forgetPassword),
                    child: Text(
                      forgotPassword,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                Container(
                  alignment: .center,
                  child: TextButton(
                    onPressed: () { Get.to(SingUpControllerScreen());},
                    child: Text(
                      createNewAccount,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),


              ],
                        ),
                      ),
            )
      ),
    );
  }
}
