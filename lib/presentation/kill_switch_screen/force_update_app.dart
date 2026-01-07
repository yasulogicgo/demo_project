import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

// CHANGE THESE TO YOUR REAL APP IDs
const String androidPackageName = 'com.logicgo.demo_app'; // ← Change if different
const String iosAppId = '1234567890'; // ← Change if you have iOS app

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
