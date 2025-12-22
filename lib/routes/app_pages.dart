import 'package:demo_app/main.dart';
import 'package:demo_app/presentation/authentication/login_screen/login_screen.dart';
import 'package:demo_app/presentation/authentication/password_reset_screen/view/ForgotPasswordScreen.dart';
import 'package:demo_app/presentation/authentication/password_reset_screen/view/ResetPasswordScreen.dart';
import 'package:demo_app/presentation/authentication/password_reset_screen/view/VerifyOtpScreen.dart';
import 'package:demo_app/presentation/dashbord_screen.dart';
import 'package:demo_app/presentation/demo_task/view/demo_task_19.dart';
import 'package:demo_app/presentation/demo_task/view/demo_task_3.dart';
import 'package:get/get.dart';

import '../presentation/authentication/Firebase_presentation/firbase_auth/view/firebase_forget_password.dart';
import '../presentation/authentication/Firebase_presentation/firbase_auth/view/firebase_login.dart';
import '../presentation/authentication/Firebase_presentation/firbase_auth/view/firebase_register.dart';
import '../presentation/authentication/Firebase_presentation/firbase_main/firebase_profile/view/firebase_profile_form.dart';
import '../presentation/authentication/Firebase_presentation/firbase_main/firebase_profile/view/firebase_profile_screen.dart';
import '../presentation/demo_task/view/demo_task_13.dart';
import '../presentation/demo_task/view/demo_task_14.dart';
import '../presentation/demo_task/view/demo_task_15.dart';
import '../presentation/demo_task/view/demo_task_4.dart';
import '../presentation/demo_task/view/demo_task_5.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const MyHomePage()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.forgetPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: AppRoutes.verifyOTP, page: () => VerifyOtpScreen()),
    GetPage(name: AppRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: AppRoutes.dashboard, page: () => dashBoardScreen()),
    GetPage(name: AppRoutes.demoTask3, page: () => const DemoTask3()),
    GetPage(name: AppRoutes.demoTask4, page: () => const DemoTask4()),
    GetPage(name: AppRoutes.demoTask5, page: () =>  DemoTask5()),
    GetPage(name: AppRoutes.demoTask13, page: () =>const  DemoTask13()),
    GetPage(name: AppRoutes.demoTask14, page: () =>const  DemoTask14()),
    GetPage(name: AppRoutes.demoTask15, page: () =>DemoTask15()),
    GetPage(name: AppRoutes.demoTask19, page: () =>DemoTask19()),

    GetPage(name: AppRoutes.firebaseLogin, page: () =>  FirebaseLogin(),),
    GetPage(name: AppRoutes.firebaseRegister, page: () =>  FirebaseRegister(),),
    GetPage(name: AppRoutes.firebaseForgetPassword, page: () =>  FirebaseForgetPassword(),),
    GetPage(name: AppRoutes.firebaseProfileForm, page: () =>  FirebaseProfileForm(),),
    GetPage(name: AppRoutes.firebaseProfile, page: () =>  FirebaseProfileScreen(),),

  ];
}