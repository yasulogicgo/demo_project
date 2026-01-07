// Add this class anywhere in main.dart (after MyHomePage or before)

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackendErrorScreen extends StatelessWidget {
  final VoidCallback? onRetry;

  const BackendErrorScreen({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfig.instance;

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
                  Icon(Icons.cloud_off, size: 120.sp, color: Colors.orange),
                  SizedBox(height: 40.h),
                  Text(
                    remoteConfig.getString('maintenance_title'),
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    remoteConfig.getString('maintenance_message'),
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50.h),
                  if (onRetry != null)
                    ElevatedButton(
                      onPressed: onRetry,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 16.h),
                        textStyle: TextStyle(fontSize: 18.sp),
                      ),
                      child: const Text("Try Again"),
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