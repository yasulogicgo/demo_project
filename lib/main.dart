import 'package:demo_app/constant/constant_icons.dart';
import 'package:demo_app/constant/constant_string.dart';
import 'package:demo_app/routes/app_pages.dart';
import 'package:demo_app/routes/app_routes.dart';
import 'package:demo_app/service_locator.dart';
import 'package:demo_app/shared_prefrences/shared_pref.dart';
import 'package:demo_app/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:logic_go_network/network/rest_client.dart';

import 'constant/app_constant.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
  restClient = RestClient(
    baseUrl: baseUrlauth,
    token: "",
    connectionTO: 30000,
    receiveTO: 30000,
  );

  await Hive.initFlutter();
  await init();
  await Hive.openBox(taskBox);

  bool isLightMode = await SharedPref().getBoolData(key: "isLightModeKey") ?? false;

  runApp( MyApp( isLightMode: isLightMode,));
}

class MyApp extends StatefulWidget {
  final bool isLightMode;
  const MyApp({super.key, required this.isLightMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X base
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,_) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        getPages: AppPages.pages,

        /// 🌞🌙 THEMES
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: widget.isLightMode == false ? ThemeMode.light : ThemeMode.dark,

        home: const SafeArea(child: MyHomePage()),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          screenName,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 16.sp,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: SvgPicture.asset(
            ConstantIcons.logo,
            fit: BoxFit.contain,
          ),
        ),actions: [
        IconButton(
          icon: Icon(
            Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,

          ),
          onPressed: () async{
            if (Get.isDarkMode) {
              Get.changeThemeMode(ThemeMode.light);
              await SharedPref().setBoolData(key: "isLightModeKey", value: false);
            } else {
              Get.changeThemeMode(ThemeMode.dark);
              await SharedPref().setBoolData(key: "isLightModeKey", value: true);
            }
          },
        ),
      ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            demoButton(
              context,
              text:
              "Container, Text, Image, Icon, Row / Column, Stack",
              routes: AppRoutes.demoTask3,
              dataPassing: "task3",
            ),
            demoButton(
              context,
              text:
              "Card, Divider, Expanded, Flexible, ListView, GridView",
              routes: AppRoutes.demoTask4,
              dataPassing: "task4",
            ),
            demoButton(
              context,
              text:
              "TextField, Button, Snackbar, DialogBox",
              routes: AppRoutes.demoTask5,
              dataPassing: "task5",
            ),
            demoButton(
              context,
              text:
              "AnimatedContainer, AnimatedOpacity, AnimatedAlign",
              routes: AppRoutes.demoTask13,
            ),
            demoButton(
              context,
              text:
              "AnimationController, CurvedAnimation, AnimatedBuilder & Tween",
              routes: AppRoutes.demoTask14,
            ),
            demoButton(
              context,
              text:
              "Using MediaQuery, Using LayoutBuilder & Using flutter_screenutil",
              routes: AppRoutes.demoTask15,
            ),
            demoButton(
              context,
              text: "hive local database",
              routes: AppRoutes.demoTask19,
            ),
            demoButton(
              context,
              text: "Firebase cloud database",
              routes: FirebaseAuth.instance.currentUser == null ? AppRoutes.firebaseLogin : AppRoutes.firebaseProfile,
            ),
            demoButton(
              context,
              text: "Login Page",
              routes: AppRoutes.login,
            ),
          ],
        ),
      ),
    );
  }


  Widget demoButton(
      BuildContext context, {
        required String text,
        String? dataPassing,
        required String routes,
      }) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => Get.toNamed(routes, arguments: dataPassing),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.all(12.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: theme.dividerColor,
            width: 1.2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.1),
              blurRadius: 4.r,
              offset: Offset(1.w, 1.h),
            ),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
