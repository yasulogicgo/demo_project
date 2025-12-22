import 'package:demo_app/widgets/common_animation_Button.dart';
import 'package:demo_app/widgets/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DemoTask5 extends StatelessWidget {
  DemoTask5({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Get.arguments.toString(),
            style: theme.textTheme.titleMedium?.copyWith(fontSize: 16.sp),
          ),
        ),

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              _sectionTitle(theme, "TextFormField"),
              SizedBox(height: 6.h),

              Form(
                key: formKey,
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number required";
                    }
                    if (value.length < 10) {
                      return "Enter valid phone number";
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 8.h),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint("Phone: ${phoneController.text}");
                  }
                },
                child: Text("Submit", style: TextStyle(fontSize: 14.sp)),
              ),

              SizedBox(height: 20.h),

              _sectionTitle(theme, "TextField"),
              SizedBox(height: 6.h),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onChanged: (v) => debugPrint("changed: $v"),
                onSubmitted: (v) => debugPrint("submitted: $v"),
              ),

              SizedBox(height: 8.h),

              ElevatedButton(
                onPressed: () =>
                    debugPrint("Name: ${nameController.text}"),
                child: Text("Print value", style: TextStyle(fontSize: 14.sp)),
              ),

              SizedBox(height: 20.h),

              _sectionTitle(theme, "Buttons"),
              SizedBox(height: 6.h),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 14.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text("Elevated Button", style: TextStyle(fontSize: 14.sp)),
              ),

              SizedBox(height: 12.h),

              AnimatedButton(
                title: "Animated Button",
                color: theme.colorScheme.primary,
                onTap: () => debugPrint("Animated Button Pressed"),
              ),

              SizedBox(height: 12.h),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2.w,
                  ),
                ),
                child: Text("Outlined", style: TextStyle(fontSize: 14.sp)),
              ),

              SizedBox(height: 12.h),

              IconButton(
                icon: const Icon(Icons.favorite),
                iconSize: 30.sp,
                color: theme.colorScheme.error,
                onPressed: () {},
              ),

              SizedBox(height: 20.h),

              _sectionTitle(theme, "InkWell"),
              SizedBox(height: 6.h),

              InkWell(
                onTap: () => debugPrint("InkWell clicked"),
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Text(
                    "Tap Me",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              _sectionTitle(theme, "GestureDetector"),
              SizedBox(height: 6.h),

              GestureDetector(
                onTap: () => debugPrint("Single Tap"),
                onDoubleTap: () => debugPrint("Double Tap"),
                onLongPress: () => debugPrint("Long Press"),
                child: Container(
                  height: 100.h,
                  width: 200.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    "Gesture Detector Box",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              _sectionTitle(theme, "Snackbar"),
              SizedBox(height: 6.h),

              TextButton(
                onPressed: () =>
                    commonSnackBar(message: "Demo Snackbar", success: true),
                child: Text("Show Snackbar", style: TextStyle(fontSize: 14.sp)),
              ),

              SizedBox(height: 20.h),

              _sectionTitle(theme, "DialogBox"),
              SizedBox(height: 6.h),

              TextButton(
                onPressed: () => _showDialogBox(context),
                child: Text("Show Dialog", style: TextStyle(fontSize: 14.sp)),
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔤 Section Title
  Widget _sectionTitle(ThemeData theme, String text) {
    return Text(
      "$text :",
      style: theme.textTheme.titleLarge?.copyWith(fontSize: 18.sp),
    );
  }

  /// 🪟 Dialog
  void _showDialogBox(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text("Title", style: theme.textTheme.titleMedium),
        content: Text("Message", style: theme.textTheme.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
