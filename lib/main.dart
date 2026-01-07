import 'dart:io';

import 'package:demo_app/constant/constant_icons.dart';
import 'package:demo_app/constant/constant_string.dart';
import 'package:demo_app/presentation/dff/maintenance_app.dart';
import 'package:demo_app/routes/app_pages.dart';
import 'package:demo_app/routes/app_routes.dart';
import 'package:demo_app/service_locator.dart';
import 'package:demo_app/shared_prefrences/shared_pref.dart';
import 'package:demo_app/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logic_go_network/network/rest_client.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constant/app_constant.dart';
import 'firebase_options.dart';

// CHANGE THESE TO YOUR REAL APP IDs
const String androidPackageName = 'com.logicgo.demo_app'; // ← Change if different
const String iosAppId = '1234567890'; // ← Change if you have iOS app

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.setDefaults({
    'app_enabled': true,
    'disable_message': 'The app is currently unavailable. Please try again later.',
    'minimum_version_android': '1.0.0',
    'minimum_version_ios': '1.0.0',
    'force_update_title': 'Update Required',
    'force_update_message': 'A new version is required to continue using the app.',
    'force_update_button': 'Update Now',
  });

  await remoteConfig.fetchAndActivate();

  // Real-time updates (optional but recommended)
  remoteConfig.onConfigUpdated.listen((event) async {
    await remoteConfig.activate();
  });

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String currentVersion = packageInfo.version;

  String minVersion = Platform.isAndroid
      ? remoteConfig.getString('minimum_version_android')
      : remoteConfig.getString('minimum_version_ios');

  bool isVersionOutdated = !_isVersionGreaterOrEqual(currentVersion, minVersion);
  bool isMaintenance = remoteConfig.getBool('server_maintenance');

  if (isVersionOutdated) {
    runApp(const ForceUpdateApp());
  }else if (isMaintenance) {
    runApp(MaintenanceApp(
      title: "Temporary Unavailable",
      message: "We're performing maintenance. Please try again in a few minutes.",
    ));
  } else if (!remoteConfig.getBool('app_enabled')) {
    runApp(AppDisabledApp(message: remoteConfig.getString('disable_message')));
  } else {
    runApp(MyApp(isLightMode: isLightMode));
  }
}

bool _isVersionGreaterOrEqual(String current, String minimum) {
  List<int> currentParts = current.split('.').map(int.parse).toList();
  List<int> minParts = minimum.split('.').map(int.parse).toList();
  for (int i = 0; i < minParts.length; i++) {
    int curr = i < currentParts.length ? currentParts[i] : 0;
    if (curr > minParts[i]) return true;
    if (curr < minParts[i]) return false;
  }
  return true;
}

// ====================== Force Update App ======================
class ForceUpdateApp extends StatelessWidget {
  const ForceUpdateApp({super.key});

  Future<void> _launchStore() async {
    final String url = Platform.isAndroid
        ? 'https://play.google.com/store/apps/details?id=$androidPackageName'
        : 'https://apps.apple.com/app/id$iosAppId';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfig.instance;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.system_update, size: 120.sp, color: Colors.blue),
                  SizedBox(height: 40.h),
                  Text(
                    remoteConfig.getString('force_update_title'),
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    remoteConfig.getString('force_update_message'),
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50.h),
                  ElevatedButton(
                    onPressed: _launchStore,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 16.h),
                      textStyle: TextStyle(fontSize: 18.sp),
                    ),
                    child: Text(remoteConfig.getString('force_update_button')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ====================== App Disabled App ======================
class AppDisabledApp extends StatelessWidget {
  final String message;
  const AppDisabledApp({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.block, size: 120.sp, color: Colors.grey),
                  SizedBox(height: 40.h),
                  Text(
                    'App Unavailable',
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    message,
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ====================== Normal MyApp (unchanged) ======================
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
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        getPages: AppPages.pages,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: widget.isLightMode ? ThemeMode.dark : ThemeMode.light,
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
          style: theme.textTheme.titleMedium?.copyWith(fontSize: 16.sp),
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: SvgPicture.asset(ConstantIcons.logo, fit: BoxFit.contain),
        ),
        actions: [
          IconButton(
            icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () async {
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
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
        child: Column(
          children: [
            demoButton(context, text: "Container, Text, Image, Icon, Row / Column, Stack", routes: AppRoutes.demoTask3, dataPassing: "task3"),
            demoButton(context, text: "Card, Divider, Expanded, Flexible, ListView, GridView", routes: AppRoutes.demoTask4, dataPassing: "task4"),
            demoButton(context, text: "TextField, Button, Snackbar, DialogBox", routes: AppRoutes.demoTask5, dataPassing: "task5"),
            demoButton(context, text: "AnimatedContainer, AnimatedOpacity, AnimatedAlign", routes: AppRoutes.demoTask13),
            demoButton(context, text: "AnimationController, CurvedAnimation, AnimatedBuilder & Tween", routes: AppRoutes.demoTask14),
            demoButton(context, text: "Using MediaQuery, Using LayoutBuilder & Using flutter_screenutil", routes: AppRoutes.demoTask15),
            demoButton(context, text: "hive local database", routes: AppRoutes.demoTask19),
            demoButton(context, text: "Firebase cloud database", routes: FirebaseAuth.instance.currentUser == null ? AppRoutes.firebaseLogin : AppRoutes.firebaseProfile),
            demoButton(context, text: "Login Page", routes: AppRoutes.login),
          ],
        ),
      ),
    );
  }

  Widget demoButton(BuildContext context, {required String text, String? dataPassing, required String routes}) {
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
          border: Border.all(color: theme.dividerColor, width: 1.2.w),
          boxShadow: [
            BoxShadow(color: theme.shadowColor.withOpacity(0.1), blurRadius: 4.r, offset: Offset(1.w, 1.h)),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
        ),
      ),
    );
  }
}