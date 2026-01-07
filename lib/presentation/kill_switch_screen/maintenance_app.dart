// ====================== Maintenance / Temporary Issue App ======================


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaintenanceApp extends StatelessWidget {
  final String title;
  final String message;

  const MaintenanceApp({super.key, required this.title, required this.message});

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
                  Icon(Icons.build_circle, size: 120.sp, color: Colors.orange),
                  SizedBox(height: 40.h),
                  Text(
                    title,
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    message,
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: () {
                      // Optional: Allow retry (will re-check remote config)
                      exit(0); // Or restart app (simple way)
                      // Better: Restart app properly using package like 'flutter_phoenix'
                    },
                    child: Text("Retry"),
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