import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CommonCard extends StatelessWidget {
  final String fullName;
  final String workField;
  final String imageUrl;

  const CommonCard({
    super.key,
    required this.fullName,
    required this.workField,
    required this.imageUrl,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     elevation: 4,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(16),
  //     ),
  //     child: LayoutBuilder(
  //       builder: (context, constraints) {
  //         final cardWidth = constraints.maxWidth;
  //
  //         final imageSize = cardWidth * 0.25;
  //         final nameFontSize = cardWidth * 0.075;
  //         final workFontSize = cardWidth * 0.045;
  //
  //         return Padding(
  //           padding: EdgeInsets.all(cardWidth * 0.06),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               CircleAvatar(
  //                 radius: imageSize / 2,
  //                 backgroundImage: NetworkImage(imageUrl),
  //               ),
  //               SizedBox(height: cardWidth * 0.05),
  //               Text(
  //                 fullName,
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: TextStyle(
  //                   fontSize: nameFontSize,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               SizedBox(height: cardWidth * 0.02),
  //               Text(
  //                 workField,
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: TextStyle(
  //                   fontSize: workFontSize,
  //                   color: AppColors.grayColor,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 40.r,
              backgroundImage: NetworkImage(imageUrl),
            ),

            SizedBox(height: 12.h),

            // Full Name
            Text(
              fullName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6.h),

            // Work Field
            Text(
              workField,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.grayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
