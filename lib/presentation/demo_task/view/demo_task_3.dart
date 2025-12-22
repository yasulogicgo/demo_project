import 'package:demo_app/constant/constant_icons.dart';
import 'package:demo_app/widgets/common_Textfield.dart';
import 'package:demo_app/widgets/common_container.dart';
import 'package:demo_app/widgets/common_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/common_image.dart';

class DemoTask3 extends StatelessWidget {
  const DemoTask3({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Get.arguments.toString(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 16.sp,
            ),
          ),
        ),

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Center(
            child: Column(
              children: [

                /// 🟩 CONTAINER DEMO
                CommonContainer(
                  width: 200.w,
                  height: 200.h,
                  padding: EdgeInsets.all(16.w),
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  alignment: Alignment.center,
                  clipBehavior: Clip.hardEdge,

                  constraints: BoxConstraints(
                    minWidth: 100.w,
                    minHeight: 100.h,
                    maxWidth: 300.w,
                    maxHeight: 300.h,
                  ),

                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: theme.colorScheme.primary.withOpacity(0.6),
                      width: 6.w,
                    ),
                  ),

                  transform: Matrix4.identity()..rotateZ(0.05),
                  transformAlignment: Alignment.topCenter,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primary,
                        theme.colorScheme.secondary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withOpacity(0.3),
                        blurRadius: 10.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),

                  child: Text(
                    "Hello Container",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                /// 📝 TEXT DEMO
                CommonText(
                  data: "Hello Flutter!",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 18.sp,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 10.h),

                /// 🖼 IMAGE DEMO
                CommonImage(
                  src: ConstantIcons.userAvatar,
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                  color: theme.colorScheme.primary.withOpacity(0.2),
                  alignment: Alignment.center,
                  colorBlendMode: BlendMode.overlay,
                  errorBuilder: (_,_,_) => Icon(
                    Icons.error,
                    size: 40.sp,
                    color: theme.colorScheme.error,
                  ),
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;
                    return const CircularProgressIndicator();
                  },
                ),

                SizedBox(height: 20.h),

                /// ❤️ ICON DEMO
                CommonIcon(
                  icon: Icons.favorite,
                  size: 80.sp,
                  color: theme.colorScheme.primary,
                  semanticLabel: "Heart Icon",
                  applyTextScaling: true,
                ),

                SizedBox(height: 20.h),

                /// 🧱 STACK DEMO
                Stack(
                  alignment: Alignment.topLeft,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 200.w,
                      height: 200.h,
                      color: theme.colorScheme.secondary.withOpacity(0.3),
                    ),
                    Positioned(
                      bottom: 10.h,
                      right: 10.w,
                      child: Text(
                        "Hello",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: 50.sp,
                      color: theme.colorScheme.error,
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                /// 📐 ROW + FLEXIBLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                /// 🔤 RICH TEXT
                RichText(
                  text: TextSpan(
                    text: "Hello ",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                    ),
                    children: [
                      TextSpan(
                        text: "Flutter ",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Developer!",
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                /// 🌐 FADE IMAGE
                FadeInImage.assetNetwork(
                  placeholder: ConstantIcons.userAvatar,
                  image: "https://picsum.photos/200",
                  width: 200.w,
                  height: 200.h,
                  fadeInDuration: const Duration(milliseconds: 500),
                ),

                SizedBox(height: 20.h),

                /// 👤 CIRCLE AVATAR
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: theme.colorScheme.primary,
                  child: Icon(
                    Icons.person,
                    size: 24.sp,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
