import 'package:demo_app/widgets/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoTask15 extends StatelessWidget {
   DemoTask15({super.key});


  final List<CommonCardModel> commonCardList = [
    CommonCardModel(
      fullName: "Yasu Lakhani",
      workField: "Flutter Developer",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiut2JJz0SdtxGJPhhS6HwQD10o-DN7zNb3A&s"
    ),
    CommonCardModel(
      fullName: "Rahul Sharma",
      workField: "Backend Developer",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiut2JJz0SdtxGJPhhS6HwQD10o-DN7zNb3A&s"
    ),
    CommonCardModel(
      fullName: "Anjali Patel",
      workField: "UI/UX Designer",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiut2JJz0SdtxGJPhhS6HwQD10o-DN7zNb3A&s"
    ),
    CommonCardModel(
      fullName: "Anjali Patel",
      workField: "UI/UX Designer",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiut2JJz0SdtxGJPhhS6HwQD10o-DN7zNb3A&s"
    ),
    CommonCardModel(
      fullName: "Anjali Patel",
      workField: "UI/UX Designer",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiut2JJz0SdtxGJPhhS6HwQD10o-DN7zNb3A&s"
   ),

  ];

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text("Team Members")),
       body: ListView.builder(
         padding: const EdgeInsets.all(16),
         itemCount: commonCardList.length,
         itemBuilder: (context, index) {
           final item = commonCardList[index];
           return CommonCard(
             fullName: item.fullName,
             workField: item.workField,
             imageUrl: item.imageUrl,
           );
         },
       ),
     );
   }



}
class CommonCardModel {
  final String fullName;
  final String workField;
  final String imageUrl;

  CommonCardModel({
    required this.fullName,
    required this.workField,
    required this.imageUrl,
  });
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: LayoutBuilder(
//       builder: (context, constraints) {
//         // 🔒 Lock card width once
//         final cardWidth = constraints.maxWidth > 600
//             ? constraints.maxWidth / 3
//             : constraints.maxWidth * 0.9;
//
//         return Center(
//           child: SizedBox(
//             width: cardWidth,
//             child: ListView.builder(
//               itemCount: commonCardList.length,
//               itemBuilder: (context, index) {
//                 final item = commonCardList[index];
//
//                 return Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: CommonCard(
//                     fullName: item.fullName,
//                     workField: item.workField,
//                     imageUrl: item.imageUrl,
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }