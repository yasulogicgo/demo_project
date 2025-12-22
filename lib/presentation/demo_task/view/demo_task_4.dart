import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DemoTask4 extends StatelessWidget {
  const DemoTask4({super.key});

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
          padding: EdgeInsets.all(16.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🪪 CARD + DIVIDER
              Card(
                margin: EdgeInsets.only(bottom: 20.h),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card Example",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Divider(
                        thickness: 1.5,
                        color: theme.dividerColor,
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        "This is a card with a divider inside it.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// 📐 EXPANDED / FLEXIBLE
              Text(
                "Expanded / Flexible Example",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 10.h),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 60.h,
                      color: theme.colorScheme.primary,
                      child: Center(
                        child: Text(
                          "Expanded (Flex 2)",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      height: 60.h,
                      color: theme.colorScheme.secondary,
                      child: Center(
                        child: Text(
                          "Flexible (Flex 1)",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              /// 📜 LISTVIEW
              Text(
                "ListView Example",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 10.h),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: theme.dividerColor,
                      ),
                    ),
                    child: Text(
                      "List Item ${index + 1}",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 30.h),

              /// 🟩 GRIDVIEW
              Text(
                "GridView Example",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 10.h),

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  6,
                      (i) => Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Box ${i + 1}",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
